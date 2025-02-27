import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:mindfulness/models/mood_entry.dart';
import 'package:mindfulness/models/journal_entry.dart';

class HistoryScreen extends StatelessWidget {
  final Box<MoodEntry> _moodBox = Hive.box<MoodEntry>('moodBox');
  final Box<JournalEntry> _journalBox = Hive.box<JournalEntry>('journalBox');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('History')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _moodBox.length,
              itemBuilder: (context, index) {
                final moodEntry = _moodBox.getAt(index);
                return ListTile(
                  leading: Text(moodEntry!.mood, style: TextStyle(fontSize: 30)),
                  title: Text('Mood logged on ${moodEntry.timestamp.toString()}'),
                );
              },
            ),
          ),
          Divider(),
          Expanded(
            child: ListView.builder(
              itemCount: _journalBox.length,
              itemBuilder: (context, index) {
                final journalEntry = _journalBox.getAt(index);
                return ListTile(
                  title: Text(journalEntry!.text),
                  subtitle: Text('Journal entry on ${journalEntry.timestamp.toString()}'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}