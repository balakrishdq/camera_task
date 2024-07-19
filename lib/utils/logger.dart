import 'package:logger/logger.dart';

Logger logger = Logger(
    printer: PrettyPrinter(
  methodCount: 10, // number of method calls to be displayed
  errorMethodCount: 10, // number of method calls if stacktrace is provided
  lineLength: 120, // width of the output
  printTime: false, //
));
