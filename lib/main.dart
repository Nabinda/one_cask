import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import 'package:pixelfield/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChannels.textInput.invokeMethod('TextInput.hide');
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp, // Lock to portrait mode
    DeviceOrientation.portraitDown, // Lock to portrait mode
  ]);
  final directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  runApp(MyApp());
}
