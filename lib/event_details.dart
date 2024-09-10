import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:uni_event/service/database.dart';
import 'edit_event.dart';

class EventDetailsPage extends StatelessWidget {
  /*final String eventName;
  final String eventDate;
  final String eventTime;
  final String eventLocation;
  final String eventDescription;*/

  /*EventDetailsPage({
    /*required this.eventName,
    required this.eventDate,
    required this.eventTime,
    required this.eventLocation,
    required this.eventDescription,*/
  });*/

  final String? docID;
  final FirestoreService firestoreService = FirestoreService();

  EventDetailsPage({Key? key, required this.docID}) : super(key: key);

  //final FirestoreService firestoreService = FirestoreService();

  //String docID = document.id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Event Details'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => EditEvent(docID: docID)),
                // );
              } //=> EditEvent(),
              ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () => _deleteEvent(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Event Summary',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8), // Add spacing between the text and the box
            Container(
              width: 400,
              decoration: BoxDecoration(
                color: Colors.pink,
                borderRadius: BorderRadius.circular(10.0),
              ),
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  StreamBuilder<DocumentSnapshot>(
                    stream: firestoreService.getEventIndividual(docID!),
                    builder: (context, snapshot) {
                      if (snapshot.hasData && snapshot.data!.data() != null) {
                        DocumentSnapshot document = snapshot.data!;
                        Map<String, dynamic> data =
                            document.data() as Map<String, dynamic>;
                        String eventName = data['eventName'] ?? '';
                        String eventDesc = data['eventDesc'] ?? '';
                        String category = data['category'] ?? '';
                        String type = data['type'] ?? '';
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              data['eventName'] ?? '',
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            Text(
                              data['eventDesc'] ?? '',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            Text(
                              data['category'] ?? '',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ],
                        );
                      } else {
                        return SizedBox.shrink();
                      }
                    },
                    //const SizedBox(height: 16), // Add spacing between the second box and the button
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _deleteEvent(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Delete Event'),
        content: Text('Are you sure you want to delete this event?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              await firestoreService.deleteEvent(docID!);
              Navigator.pop(context);
              Navigator.pop(context); // Navigate back to the previous screen
            },
            child: Text('Delete'),
          ),
        ],
      ),
    );
  }
}
