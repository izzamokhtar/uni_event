import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class FeedbackPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Feedback'),
        backgroundColor: Color.fromARGB(255, 223, 123, 156),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('Tell us your thoughts about UniEvent Finder',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                labelText: 'Share with us your feedback...',
                border: OutlineInputBorder(),
              ),
              maxLines: 5,
            ),
            SizedBox(height: 10),
            Text('Rate our UniEvent Finder App',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            RatingBar.builder(
              initialRating: 3,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                // Handle rating change
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle feedback submission
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}

// You need to add the dependency for flutter_rating_bar in pubspec.yaml
// flutter_rating_bar: ^4.0.0
