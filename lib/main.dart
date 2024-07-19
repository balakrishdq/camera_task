import 'package:camera_task/screens/home_page.dart';
import 'package:camera_task/style/style.util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

void main() async {
   WidgetsFlutterBinding.ensureInitialized();
   SystemChrome.setPreferredOrientations([
     DeviceOrientation.portraitUp,
     DeviceOrientation.portraitDown,
     DeviceOrientation.landscapeLeft,
     DeviceOrientation.landscapeRight,
   ]);
   SystemChrome.setSystemUIOverlayStyle(
     SystemUiOverlayStyle(
       statusBarColor: Style.colors.primary,
       statusBarBrightness: Brightness.light,
       statusBarIconBrightness: Brightness.light,
       systemNavigationBarDividerColor: Style.colors.transparent,
       systemNavigationBarColor: Style.colors.white,
     ),
   );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
        builder: (context, orientation, deviceType) => MaterialApp(
              title: 'Camera Task',
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
              ),
              home: HomePage(),
            ));
  }
}
