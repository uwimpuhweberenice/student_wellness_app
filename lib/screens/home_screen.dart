import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mindfulness/screens/history_screen.dart';
import 'package:mindfulness/screens/journal_screen.dart';
import 'package:mindfulness/screens/mood_tracker.dart';
import 'package:mindfulness/screens/chat_screen.dart';
import 'package:mindfulness/screens/meditation_screen.dart';
import 'package:mindfulness/screens/emergency_contact_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Wellness App'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            'assets/home_animation.json',
            width: 250,
            height: 250,
            repeat: true,
          ),
          SizedBox(height: 20),

          // Buttons Centered in the Screen
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MoodTrackerScreen(),
                      ),
                    ),
                    child: Text('Track Mood'),
                  ),
                  ElevatedButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => JournalScreen()),
                    ),
                    child: Text('Write Journal'),
                  ),
                  ElevatedButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HistoryScreen()),
                    ),
                    child: Text('View History'),
                  ),
                  ElevatedButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MeditationScreen()),
                    ),
                    child: Text('Guided Meditation & Stress Relief'),
                  ),
                  ElevatedButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => EmergencyContactScreen()),
                    ),
                    child: Text('Emergency Contacts'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ChatScreen()),
          );
        },
        child: Icon(Icons.chat),
        tooltip: 'Chat with peers',
      ),
    );
  }
}
