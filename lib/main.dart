import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:vk/firebase_options.dart';
import 'package:vk/ui/widgets/app/my_app_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}
