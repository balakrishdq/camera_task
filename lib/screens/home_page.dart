import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:path/path.dart' as path;
import '../style/style.util.dart';

class HomePage extends HookWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final images = useState<List<File>>([]);

    Future<void> _loadImages() async {
      final prefs = await SharedPreferences.getInstance();
      final imagePaths = prefs.getStringList('images') ?? [];
      final imageFiles = imagePaths.map((path) => File(path)).toList();
      images.value = imageFiles;
    }

    Future<void> _saveImages(List<File> images) async {
      final prefs = await SharedPreferences.getInstance();
      final imagePaths = images.map((image) => image.path).toList();
      prefs.setStringList('images', imagePaths);
    }

    Future<void> _captureImage() async {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: ImageSource.camera);
      if (pickedFile != null) {
        final directory = await getApplicationDocumentsDirectory();
        final fileName = path.basename(pickedFile.path);
        final savedImage =
            await File(pickedFile.path).copy('${directory.path}/$fileName');
        images.value = [...images.value, savedImage];
        await _saveImages(images.value);
      }
    }

    Future<void> _deleteImage(int index) async {
      final imageToDelete = images.value[index];
      if (await imageToDelete.exists()) {
        await imageToDelete.delete();
      }
      images.value = [...images.value]..removeAt(index);
      await _saveImages(images.value);
    }

    useEffect(() {
      _loadImages();
      return null;
    }, []);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Style.colors.primary,
          title: Text(
            'Home',
            style: Style.textStyles.primary(
              color: Style.colors.white,
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton.large(
          backgroundColor: Style.colors.primary,
          onPressed: _captureImage,
          child: Icon(
            Icons.camera_alt,
            color: Style.colors.white,
            size: 28.sp,
          ),
        ),
        body: images.value.isEmpty
            ? Padding(
                padding: EdgeInsets.all(10.sp),
                child: Center(
                  child: Lottie.asset('assets/lottie/camera-nodata.json',
                      fit: BoxFit.contain, height: 20.h, width: 80.w),
                ),
              )
            : ListView.builder(
                padding:
                    EdgeInsets.symmetric(vertical: 10.sp, horizontal: 10.sp),
                itemCount: images.value.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: 10.sp),
                    child: Stack(
                      children: [
                        Image.file(
                          images.value[index],
                        ),
                        Positioned(
                          right: 0,
                          child: IconButton(
                            icon: Icon(Icons.delete, color: Style.colors.red),
                            onPressed: () => _deleteImage(index),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
      ),
    );
  }
}
