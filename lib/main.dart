import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mindfulness/screens/home_screen.dart';
import 'package:mindfulness/models/mood_entry.dart';
import 'package:mindfulness/models/journal_entry.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter(); // Initialize Hive
  Hive.registerAdapter(MoodEntryAdapter()); // Register MoodEntry adapter
  Hive.registerAdapter(JournalEntryAdapter()); // Register JournalEntry adapter
  await Hive.openBox<MoodEntry>('moodBox'); // Open a box for mood logs
  await Hive.openBox<JournalEntry>('journalBox'); // Open a box for journals
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student Wellness App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Color(0xFFF3E5F5),
      ),
      home: HomeScreen(),
    );
  }
}