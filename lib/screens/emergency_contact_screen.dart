import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class EmergencyContactScreen extends StatelessWidget {
  // List of emergency contacts
  final List<Map<String, String>> emergencyContacts = [
    {
      'name': 'University Counseling Center',
      'phone': '+250780177078',
      'email': 'uberenice16@gmail.com',
    },
    {
      'name': 'Campus Safety',
      'phone': '+250780177078',
      'email': 'uberenice16@gmail.com',
    },
    {
      'name': 'National Suicide Prevention Lifeline',
      'phone': '+250780177078',
      'email': 'uberenice16@gmail.com',
    },
  ];

  // Function to launch phone dialer
  Future<void> _callContact(String phoneNumber) async {
    final Uri phoneUri = Uri.parse('tel:$phoneNumber');
    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    } else {
      debugPrint('No phone app available to make a call.');
    }
  }


  // Function to launch email app
  Future<void> _emailContact(String email) async {
    final Uri emailUri = Uri.parse('mailto:$email?subject=Emergency Assistance');
    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    } else {
      debugPrint('No email app available.');
    }
  }


  // Function to launch SMS app
  Future<void> _smsContact(String phoneNumber) async {
    final Uri smsUri = Uri.parse('sms:$phoneNumber');
    if (await canLaunchUrl(smsUri)) {
      await launchUrl(smsUri);
    } else {
      debugPrint('No SMS app available.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Emergency Contacts'),
      ),
      body: ListView.builder(
        itemCount: emergencyContacts.length,
        itemBuilder: (context, index) {
          final contact = emergencyContacts[index];
          return ListTile(
            title: Text(contact['name']!),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (contact['phone']!.isNotEmpty)
                  Text('Phone: ${contact['phone']}'),
                if (contact['email']!.isNotEmpty)
                  Text('Email: ${contact['email']}'),
              ],
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (contact['phone']!.isNotEmpty)
                  IconButton(
                    icon: Icon(Icons.phone),
                    onPressed: () => _callContact(contact['phone']!),
                  ),
                if (contact['phone']!.isNotEmpty)
                  IconButton(
                    icon: Icon(Icons.message),
                    onPressed: () => _smsContact(contact['phone']!),
                  ),
                if (contact['email']!.isNotEmpty)
                  IconButton(
                    icon: Icon(Icons.email),
                    onPressed: () => _emailContact(contact['email']!),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}