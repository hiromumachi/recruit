import 'package:logger/logger.dart';

class LoggerInfo {
  static final instance = CustomLogger();
  static const level = Level.info;
}

class CustomLogger extends Logger {
  static final _standartInstance =
      Logger(printer: _standardLogPrinter, level: LoggerInfo.level);
  static final _standardLogPrinter = PrettyPrinter(
    methodCount: 0,
    errorMethodCount: 8,
    lineLength: 70,
    colors: false,
    printEmojis: true,
  );

  @override
  void t(dynamic message,
      {Object? error, StackTrace? stackTrace, DateTime? time}) {
    _standartInstance.t(message,
        error: error, stackTrace: stackTrace, time: time);
  }

  @override
  void d(dynamic message,
      {Object? error, StackTrace? stackTrace, DateTime? time}) {
    _standartInstance.d(message,
        error: error, stackTrace: stackTrace, time: time);
  }

  @override
  void i(dynamic message,
      {Object? error, StackTrace? stackTrace, DateTime? time}) {
    _standartInstance.i(message,
        error: error, stackTrace: stackTrace, time: time);
  }

  static final _errorInstance =
      Logger(printer: _errorLogPrinter, level: LoggerInfo.level);
  static final _errorLogPrinter = PrettyPrinter(
    methodCount: 2,
    errorMethodCount: 8,
    lineLength: 70,
    colors: false,
    printEmojis: true,
  );

  @override
  void w(dynamic message,
      {Object? error, StackTrace? stackTrace, DateTime? time}) {
    _errorInstance.w(message, error: error, stackTrace: stackTrace, time: time);
  }

  @override
  void e(dynamic message,
      {Object? error, StackTrace? stackTrace, DateTime? time}) {
    _errorInstance.e(message, error: error, stackTrace: stackTrace, time: time);
  }

  @override
  void f(dynamic message,
      {Object? error, StackTrace? stackTrace, DateTime? time}) {
    _errorInstance.f(message, error: error, stackTrace: stackTrace, time: time);
  }
}
