import 'package:flutter/material.dart';
import 'gethelp_pg.dart';
import 'feedback_pg.dart';
import 'main_pg.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' '),
        backgroundColor: Color.fromARGB(255, 223, 123, 156),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text(
              'Support',
              style: TextStyle(fontSize: 30),
            ),

            //trailing: Icon(Icons.arrow_forward),
            onTap: () {
              /*Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => GetHelpPage()),
              );*/
            },
          ),
          ListTile(
            title: Text('About UniEvent Finder'),
            trailing: Icon(Icons.arrow_forward_ios_rounded),
            onTap: () {
              // Handle account deletion
            },
          ),
          ListTile(
            title: Text('Get Help'),
            trailing: Icon(Icons.arrow_forward_ios_rounded),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => GetHelpPage()),
              );
            },
          ),
          ListTile(
            title: Text('Feedback'),
            trailing: Icon(Icons.arrow_forward_ios_rounded),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FeedbackPage()),
              );
            },
          ),
          SizedBox(height: 350),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                _showLogoutConfirmationDialog(context);
              },
              child: Text('Log out',
                  style: TextStyle(
                      fontSize: 18,
                      color: Color.fromARGB(255, 68, 50, 42),
                      fontWeight: FontWeight.bold)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 223, 123, 156),
                minimumSize: Size(50, 50), // Button width and height
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showLogoutConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Log Out'),
          content: Text('Are you sure you want to log out?'),
          actions: <Widget>[
            TextButton(
              child: Text(
                'Cancel',
                style: TextStyle(color: Colors.black),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text(
                'Log Out',
                style: TextStyle(color: Colors.red),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MainPage()),
                );
                // Handle logout logic here
                //Navigator.of(context).pop();
                // Optionally navigate to a different page after logging out
                // Navigator.pushReplacementNamed(context, '/login');
              },
            ),
          ],
        );
      },
    );
  }
}
