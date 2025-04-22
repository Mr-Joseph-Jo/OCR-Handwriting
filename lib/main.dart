import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ocr/models/note_model.dart';
import 'package:ocr/screens/splash.dart';
import 'package:ocr/utils/color.dart';
import 'package:hive_flutter/hive_flutter.dart';

// Import necessary packages
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

// Declare boxes
late Box box;
late Box<Note> noteBox;

Future<void> main() async {
  // Initialize Hive and open the box
  await Hive.initFlutter();

  // Open a generic box called 'testBox'
  box = await Hive.openBox('testBox');

  // Register the adapter for the Note class
  Hive.registerAdapter(NoteAdapter());

  // Open the box specifically for Note objects
  noteBox = await Hive.openBox<Note>('noteBox');

  // Run the application
  runApp(const MyApp());
}

// Define the root widget of the application
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'LexiScan',
      theme: ThemeData(
<<<<<<< HEAD
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: false,
=======
        // Set the color scheme for the application using a seed color
        colorScheme: ColorScheme.fromSeed(seedColor: primary),
        useMaterial3: false, // Disable Material 3
>>>>>>> d4b75446dbd87fb04457864083f4a6cfbceaf6ba
      ),
      home: const SplashPage(), // Set the home page of the application
    );
  }
}
