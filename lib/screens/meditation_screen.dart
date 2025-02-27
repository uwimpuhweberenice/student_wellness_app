import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:lottie/lottie.dart';

class MeditationScreen extends StatefulWidget {
  @override
  _MeditationScreenState createState() => _MeditationScreenState();
}

class _MeditationScreenState extends State<MeditationScreen> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool _isPlaying = false;
  int _selectedMeditation = 0;

  final List<String> _meditationTitles = [
    'Guided Meditation',
    'Deep Breathing',
    'Stress Relief',
  ];

  final List<String> _meditationDescriptions = [
    'A 10-minute guided meditation to help you relax.',
    'Follow the animation to practice deep breathing.',
    'A 5-minute stress relief exercise.',
  ];

  final List<String> _meditationAudios = [
    'meditation1.mp3',
    'breathing.mp3',
    'stress_relief.mp3',
  ];

  final List<String> _animationFiles = [
    'assets/guided_meditation.json',  // Animation for Guided Meditation
    'assets/breathing_animation.json', // Animation for Deep Breathing
    'assets/stress_relief.json',       // Animation for Stress Relief
  ];

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Guided Meditation & Stress Relief'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              _meditationTitles[_selectedMeditation],
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              _meditationDescriptions[_selectedMeditation],
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 20),

            // Display Lottie Animation Based on Selection
            Lottie.asset(
              _animationFiles[_selectedMeditation],
              width: 250,
              height: 250,
              repeat: true,
            ),

            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(_isPlaying ? Icons.pause : Icons.play_arrow),
                  iconSize: 50,
                  onPressed: () => _togglePlayPause(),
                ),
                IconButton(
                  icon: Icon(Icons.stop),
                  iconSize: 50,
                  onPressed: () => _stopAudio(),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text('Select a Meditation:'),
            DropdownButton<int>(
              value: _selectedMeditation,
              onChanged: (value) {
                setState(() {
                  _selectedMeditation = value!;
                  _stopAudio();
                });
              },
              items: List.generate(
                _meditationTitles.length,
                    (index) => DropdownMenuItem(
                  value: index,
                  child: Text(_meditationTitles[index]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _togglePlayPause() async {
    if (_isPlaying) {
      await _audioPlayer.pause();
    } else {
      await _audioPlayer.setSource(AssetSource(_meditationAudios[_selectedMeditation]));
      await _audioPlayer.resume();
    }
    setState(() {
      _isPlaying = !_isPlaying;
    });
  }

  void _stopAudio() async {
    await _audioPlayer.stop();
    setState(() {
      _isPlaying = false;
    });
  }
}
