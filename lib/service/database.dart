import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirestoreService {
  //final FirebaseFirestore db = FirebaseFirestore.instance;
  final CollectionReference test =
      FirebaseFirestore.instance.collection('test');

//create
  Future<void> addEvent(
      String eventName, String eventDesc, String category, String type) {
    return test.add({
      'eventName': eventName,
      'eventDesc': eventDesc,
      'category': category,
      'type': type,
    });
  }

//read
  Stream<QuerySnapshot> getEventStream() {
    final eventStream = test.snapshots();
    return eventStream;
  }

  Stream<DocumentSnapshot> getEventIndividual(String docID) {
    final eventIndividual = test.doc(docID).snapshots();
    return eventIndividual;
  }

  Future<String?> getEventName(String docID) async {
    try {
      DocumentSnapshot snapshot = await test.doc(docID).get();

      if (snapshot.exists && snapshot.data() != null) {
        Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
        return data['eventName'] as String?;
      }
      return null; // Return null if the document does not exist or data is not available
    } catch (e) {
      print("Failed to fetch event description: $e");
      return null;
    }
  }

  Future<String?> getEventDesc(String docID) async {
    try {
      DocumentSnapshot snapshot = await test.doc(docID).get();

      if (snapshot.exists && snapshot.data() != null) {
        Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
        return data['eventDesc'] as String?;
      }
      return null; // Return null if the document does not exist or data is not available
    } catch (e) {
      print("Failed to fetch event description: $e");
      return null;
    }
  }

  Future<String?> getCategory(String docID) async {
    try {
      DocumentSnapshot snapshot = await test.doc(docID).get();

      if (snapshot.exists && snapshot.data() != null) {
        Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
        return data['category'] as String?;
      }
      return null; // Return null if the document does not exist or data is not available
    } catch (e) {
      print("Failed to fetch event description: $e");
      return null;
    }
  }

  Future<String?> getType(String docID) async {
    try {
      DocumentSnapshot snapshot = await test.doc(docID).get();

      if (snapshot.exists && snapshot.data() != null) {
        Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
        return data['type'] as String?;
      }
      return null; // Return null if the document does not exist or data is not available
    } catch (e) {
      print("Failed to fetch event description: $e");
      return null;
    }
  }

//update
  Future<void> updateEvent(String docID, String eventNameNew,
      String eventDescNew, String categoryNew, String typeNew) {
    return test.doc(docID).update({
      'eventName': eventNameNew,
      'eventDesc': eventDescNew,
      'category': categoryNew,
      'type': typeNew,
    });
  }

  //delete
  Future<void> deleteEvent(String docID) {
    return test.doc(docID).delete();
  }

  Stream<QuerySnapshot> getEventsSortedByNameAsc() {
    return test.orderBy('eventName').snapshots();
  }

  Stream<QuerySnapshot> getEventsSortedByNameDesc() {
    return test.orderBy('eventName', descending: true).snapshots();
  }

  Stream<QuerySnapshot> getEventsSortedByDate() {
    return test.orderBy('eventDate', descending: true).snapshots();
  }

  Stream<QuerySnapshot> getEventsByCategory(String category) {
    return test.where('category', isEqualTo: category).snapshots();
  }

  Stream<QuerySnapshot> getEventsByType(String type) {
    return test.where('type', isEqualTo: type).snapshots();
  }
}
