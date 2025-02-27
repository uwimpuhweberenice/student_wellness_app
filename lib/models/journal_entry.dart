import 'package:hive/hive.dart';

part 'journal_entry.g.dart'; // Generated file

@HiveType(typeId: 1)
class JournalEntry {
  @HiveField(0)
  final String text;

  @HiveField(1)
  final DateTime timestamp;

  JournalEntry({required this.text, required this.timestamp});
}