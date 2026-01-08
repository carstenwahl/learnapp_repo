import 'package:flutter/material.dart';
import 'package:learnapp/app/app.dart';
import 'package:learnapp/core/di/injection.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.configureDependencies();
  runApp(const App());
}
