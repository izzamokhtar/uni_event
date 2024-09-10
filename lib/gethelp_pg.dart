import 'package:flutter/material.dart';

class GetHelpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Get Help'),
        backgroundColor: Color.fromARGB(255, 223, 123, 156),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text('Frequently Asked Questions (FAQs)',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            ExpansionTile(
              title: Text('How to search for a specific event?',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              children: [
                ListTile(
                  title: Text(
                      'Go to Home Page and type the particular title of the event at the search bar or filter events based on your desired category.'),
                ),
              ],
            ),
            ExpansionTile(
              title: Text('Can I edit my profile?',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              children: [
                ListTile(
                  title: Text(
                      'Yes. Go to Profile Page then select edit icon beside user’s name.'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
