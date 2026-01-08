import 'package:injectable/injectable.dart';

@lazySingleton
class Logger {
  void log(String message) => // simple wrapper to centralize logging
      // ignore: avoid_print
      print('[Logger] $message');
}
