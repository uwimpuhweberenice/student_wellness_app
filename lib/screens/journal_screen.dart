import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:mindfulness/models/journal_entry.dart';

class JournalScreen extends StatefulWidget {
  @override
  _JournalScreenState createState() => _JournalScreenState();
}

class _JournalScreenState extends State<JournalScreen> {
  final Box<JournalEntry> _journalBox = Hive.box<JournalEntry>('journalBox');
  final TextEditingController _journalController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Journal')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _journalController,
              maxLines: 10,
              decoration: InputDecoration(
                hintText: 'Write your thoughts here...',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _saveJournal(_journalController.text),
              child: Text('Save Journal'),
            ),
          ],
        ),
      ),
    );
  }

  void _saveJournal(String text) {
    final journalEntry = JournalEntry(text: text, timestamp: DateTime.now());
    _journalBox.add(journalEntry); // Save journal entry to Hive
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Journal saved!')));
    _journalController.clear();
  }
}