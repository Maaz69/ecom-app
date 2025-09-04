import 'package:logger/logger.dart';

class TLoggerHelper {
  static final Logger _logger = Logger(
    printer: PrettyPrinter(
      methodCount: 2, // Number of method calls to be displayed
      errorMethodCount: 8, // Number of method calls if an error occurs
      lineLength: 80, // Width of the output
      colors: true, // Enable colors
      printEmojis: true, // Print emojis for log types
      printTime: true, // Display timestamp
    ),
  );

  /// Log a simple message
  static void logInfo(String message) {
    _logger.i(message);
  }

  /// Log a warning message
  static void logWarning(String message) {
    _logger.w(message);
  }

  /// Log an error message with optional exception
  static void logError(String message, [dynamic error, StackTrace? stackTrace]) {
    _logger.e(message, error: error, stackTrace: stackTrace);
  }

  /// Log a debug message
  static void logDebug(String message) {
    _logger.d(message);
  }

  /// Log a verbose message
  static void logVerbose(String message) {
    _logger.v(message);
  }
}
