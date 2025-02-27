import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:mindfulness/models/mood_entry.dart';

class MoodTrackerScreen extends StatefulWidget {
  @override
  _MoodTrackerScreenState createState() => _MoodTrackerScreenState();
}

class _MoodTrackerScreenState extends State<MoodTrackerScreen> {
  final Box<MoodEntry> _moodBox = Hive.box<MoodEntry>('moodBox');
  String selectedMood = '😊';
  List<String> moods = ['😊', '😐', '😢', '😡', '😴'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Mood Tracker')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('How are you feeling today?', style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),
            GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemCount: moods.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => setState(() => selectedMood = moods[index]),
                  child: Container(
                    decoration: BoxDecoration(
                      color: selectedMood == moods[index] ? Colors.blue : Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(moods[index], style: TextStyle(fontSize: 30)),
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _saveMood(selectedMood),
              child: Text('Save Mood'),
            ),
          ],
        ),
      ),
    );
  }

  void _saveMood(String mood) {
    final moodEntry = MoodEntry(mood: mood, timestamp: DateTime.now());
    _moodBox.add(moodEntry); // Save mood entry to Hive
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Mood saved!')));
  }
}