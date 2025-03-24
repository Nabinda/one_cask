import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pixelfield/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp, // Lock to portrait mode
    DeviceOrientation.portraitDown, // Lock to portrait mode
  ]);
  runApp(MyApp());
}
