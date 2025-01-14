import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FirestoreRepository {
  // / A repository class that interacts with Firestore.
  // /
  // / This class provides methods to perform CRUD operations on Firestore
  // / collections and documents.
  // /
  // / The FirestoreRepository requires an instance of FirebaseFirestore
  // / to be passed to its constructor.
  // / Properties:
  // / - `_firestore`: An instance of FirebaseFirestore used to interact with Firestore.
  FirestoreRepository(this._firestore);
  final FirebaseFirestore _firestore;

  Future<void> addJob(String uid, String title, String company) async {
    final docRef = await _firestore.collection('jobs').add({
      'uid': uid,
      'title': title,
      'company': company,
    });
    debugPrint(docRef.id);
  }
}

/// A provider for the `FirestoreRepository` instance.
///
/// This provider creates and returns a new instance of `FirestoreRepository`
/// using the default `FirebaseFirestore` instance.
final firestoreRepositoryProvider = Provider<FirestoreRepository>((ref) {
  return FirestoreRepository(FirebaseFirestore.instance);
});
