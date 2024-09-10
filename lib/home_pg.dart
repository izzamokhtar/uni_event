//import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:uni_event/edit_event.dart';
import 'package:uni_event/service/database.dart';
import 'event_details.dart';
import 'create_event.dart';

class Event {
  final String eventName;
  final String eventDesc;
  final String category;
  final String type;

  Event({
    required this.eventName,
    required this.eventDesc,
    required this.category,
    required this.type,
  });
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //List<Event> events = [],
  String searchQuery = '';
  String sortCriteria = 'Newest';
  String _selectedCategory = '';
  List<Event> filteredEvents = [];
  final FirestoreService firestoreService = FirestoreService();

  @override
  void initState() {
    super.initState();
  }

  void updateSearchQuery(String query) {
    setState(() {
      searchQuery = query;
      // filteredEvents = events
      //    .where((event) =>
      //        event.eventName.toLowerCase().contains(query.toLowerCase()))
      //    .toList();
    });
  }

  void sortEvents(String criteria) {
    setState(() {
      sortCriteria = criteria;
    });
  }

  Stream<QuerySnapshot> getSortedEventsStream() {
    if (sortCriteria == 'Newest') {
      return firestoreService.getEventsSortedByDate();
    } else if (sortCriteria == 'Ascending') {
      return firestoreService.getEventsSortedByNameAsc();
    } else {
      return firestoreService.getEventsSortedByNameDesc();
    }
  }

  void _showCategorySelection() {
    List<String> categories = ['Sports', 'Workshop', 'Conference'];

    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.4,
          child: ListView.builder(
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(categories[index]),
                onTap: () {
                  setState(() {
                    _selectedCategory = categories[index];
                  });
                  Navigator.pop(context);
                  _filterEventsByCategory(categories[index]);
                },
              );
            },
          ),
        );
      },
    );
  }

  void _filterEventsByCategory(String categories) {
    Expanded(
        child: StreamBuilder<QuerySnapshot>(
      stream: firestoreService.getEventsByCategory(_selectedCategory),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List animalsList = snapshot.data!.docs;

          return ListView.builder(
            itemCount: animalsList.length,
            itemBuilder: (context, index) {
              DocumentSnapshot document = animalsList[index];
              String eventDocID = document.id;

              Map<String, dynamic> data =
                  document.data() as Map<String, dynamic>;
              String animalText = data['eventName'];
              String animalDesc = data['eventDesc'];
              String animalCate = data['category'];
              String animalType = data['type'];

              // IconButton(
              //     icon: Icon(Icons.edit),
              //     onPressed: () {
              //       Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //             builder: (context) => EditEvent()),
              //       );
              //     } //=> EditEvent(),
              //     );

              return ListTile(
                  title: Text(animalText),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EventDetailsPage(
                          docID: eventDocID,
                          /*eventName: filteredEvents[index].eventName,
                                eventDate: filteredEvents[index].eventDate,
                                eventTime: filteredEvents[index].eventTime,
                                eventLocation:
                                    filteredEvents[index].eventLocation,
                                eventDescription:
                                    filteredEvents[index].eventDescription,*/
                        ),
                      ),
                    );
                  });
            },
          );
        } else {
          return const Text("Loading");
        }
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) {
                updateSearchQuery(value);
              },
              decoration: InputDecoration(
                labelText: 'Search',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                SizedBox(
                  width: 50,
                ),
                Expanded(
                  child: DropdownButton<String>(
                    value: sortCriteria,
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        sortEvents(newValue);
                      }
                    },
                    items: <String>[
                      'Newest',
                      'Ascending',
                      'Descending',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                Expanded(
                  child: DropdownButton<String>(
                    hint: Text('Category'),
                    value:
                        _selectedCategory.isNotEmpty ? _selectedCategory : null,
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        setState(() {
                          _selectedCategory = newValue;
                          _filterEventsByCategory(_selectedCategory);
                        });
                      }
                    },
                    items: <String>[
                      'Sports',
                      'Workshop',
                      'Conference',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: StreamBuilder<QuerySnapshot>(
            stream: firestoreService.getEventStream(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List animalsList = snapshot.data!.docs;

                return ListView.builder(
                  itemCount: animalsList.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot document = animalsList[index];
                    String eventDocID = document.id;

                    Map<String, dynamic> data =
                        document.data() as Map<String, dynamic>;
                    String animalText = data['eventName'];
                    String animalDesc = data['eventDesc'];
                    String animalCate = data['category'];
                    String animalType = data['type'];

                    // IconButton(
                    //     icon: Icon(Icons.edit),
                    //     onPressed: () {
                    //       Navigator.push(
                    //         context,
                    //         MaterialPageRoute(
                    //             builder: (context) => EditEvent()),
                    //       );
                    //     } //=> EditEvent(),
                    //     );

                    return ListTile(
                        title: Text(animalText),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            //Text(animalDesc),
                            IconButton(
                                icon: Icon(Icons.edit),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => EditEvent(
                                              docID: eventDocID,
                                            )),
                                  );
                                } //=> EditEvent(),
                                ),
                            //update button
                            /*IconButton(
                        //onPressed: () => openNoteBox(docID: docID), 
                        icon: const Icon(Icons.settings),
                      ),*/
                            //delete button
                            /*IconButton(
                        onPressed: () => firestoreService.deleteEvent(docID), 
                        icon: const Icon(Icons.delete),
                      ),*/
                          ],
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EventDetailsPage(
                                docID: eventDocID,
                                /*eventName: filteredEvents[index].eventName,
                                eventDate: filteredEvents[index].eventDate,
                                eventTime: filteredEvents[index].eventTime,
                                eventLocation:
                                    filteredEvents[index].eventLocation,
                                eventDescription:
                                    filteredEvents[index].eventDescription,*/
                              ),
                            ),
                          );
                        });
                  },
                );
              } else {
                return const Text("Loading");
              }
            },
          )
              /*child: ListView.builder(
              itemCount: filteredEvents.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(filteredEvents[index].eventName),
                  subtitle: Text(
                      '${filteredEvents[index].eventDate} at ${filteredEvents[index].eventTime}'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EventDetailsPage(
                          eventName: filteredEvents[index].eventName,
                          eventDate: filteredEvents[index].eventDate,
                          eventTime: filteredEvents[index].eventTime,
                          eventLocation: filteredEvents[index].eventLocation,
                          eventDescription:
                              filteredEvents[index].eventDescription,
                        ),
                      ),
                    );
                  },
                );
              },
            ),*/
              ),
          //SizedBox(height: 350),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CreateEvent()),
                );
                //_showLogoutConfirmationDialog(context);
              },
              child: Text('Create Event',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
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
}
