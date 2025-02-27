import 'package:hive/hive.dart';

part 'mood_entry.g.dart'; // Generated file

@HiveType(typeId: 0)
class MoodEntry {
  @HiveField(0)
  final String mood;

  @HiveField(1)
  final DateTime timestamp;

  MoodEntry({required this.mood, required this.timestamp});
}