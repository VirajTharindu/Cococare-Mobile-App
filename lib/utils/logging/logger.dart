import 'package:logger/logger.dart' as logger;
import 'package:logger/web.dart';

class CLoggerHelper {
  static final Logger _logger = Logger(
    printer: PrettyPrinter(),
    //customize log levels on user needs

    level: Level.debug,
  ); //logger

  static void debug(String message) {
    _logger.d(message);
  }

  static void info(String message) {
    _logger.i(message);
  }

  static void warning(String message) {
    _logger.w(message);
  }

  static void error(String message, [dynamic error]) {
    _logger.e(message, error: error, stackTrace: StackTrace.current);
  }
}
