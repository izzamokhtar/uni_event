import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:uni_event/event_details.dart';
import 'package:uni_event/service/database.dart';

String name = 'Winter Jeong';
String email = 'dminjeong@gmail.com';
String password = 'diana123';

// void main() {
//   runApp(const Profile());
// }

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final FirestoreService firestoreService = FirestoreService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 235, 138, 190),
        title: const Center(
          child: Text(
            'Profile',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Container(
            color: const Color.fromARGB(255, 241, 142, 205),
            height: 250,
            child: Center(
              child: Column(
                children: <Widget>[
                  const Text(
                    'User Details',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Image.asset(
                    'images/winter.png',
                    height: 100,
                    width: 100,
                  ),
                  Row(
                    children: <Widget>[
                      const SizedBox(
                        width: 50,
                      ),
                      Text(
                        name,
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.edit_square),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const EditProfilePage(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  Text(
                    email,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: const Color.fromARGB(255, 255, 255, 255),
              child: Column(
                children: <Widget>[
                  const Text(
                    'Events',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      const SizedBox(
                        width: 30,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 220, 127, 234),
                          foregroundColor: const Color.fromARGB(255, 0, 0, 0),
                          fixedSize: const Size(150, 40),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => Profile(),
                            ),
                          );
                        },
                        child: const Text(
                          'Ongoing',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 220, 127, 234),
                          foregroundColor: const Color.fromARGB(255, 0, 0, 0),
                          fixedSize: const Size(150, 40),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => Profile(),
                            ),
                          );
                        },
                        child: const Text(
                          'Upcoming',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                    ],
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
                  )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  //final _formKey = GlobalKey<FormState>();
  String newName = '';
  String newEmail = '';
  String newPassword = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 235, 138, 190),
        title: const Text('Edit Profile'),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 20.0, top: 30.0, right: 20.0),
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'images/winter.png',
                height: 200,
                width: 200,
              ),
              const SizedBox(height: 30),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Name',
                  hintText: name,
                  border: const OutlineInputBorder(),
                ),
                onChanged: (value) {
                  newName = value;
                },
              ),
              const SizedBox(height: 30),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  hintText: email,
                  border: const OutlineInputBorder(),
                ),
                onChanged: (value) {
                  newEmail = value;
                },
              ),
              const SizedBox(height: 30),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: password,
                  border: const OutlineInputBorder(),
                ),
                obscureText: true,
                onChanged: (value) {
                  newPassword = value;
                },
              ),
              const SizedBox(height: 50),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (newName.isNotEmpty) name = newName;
                    if (newEmail.isNotEmpty) email = newEmail;
                    if (newPassword.isNotEmpty) {
                      password = newPassword;
                    }
                  });
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Profile(),
                    ),
                  );
                },
                child: const Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
