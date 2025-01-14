import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerceapp/src/data/job.dart';
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

  // A method to add a new job to Firestore. Create
  Future<void> addJob(String uid, String title, String company) =>
      _firestore.collection('jobs').add({
        'uid': uid,
        'title': title,
        'company': company,
      });
  // A method to update a job in Firestore. Update
  Future<void> updateJob(
          String uid, String jobId, String title, String company) =>
      _firestore.doc('jobs/$jobId').update({
        'uid': uid,
        'title': title,
        'company': company,
      });
  // A method to delete a job from Firestore. delete
  Future<void> deleteJob(String uid, String jobId) =>
      _firestore.doc('jobs/$jobId').delete();

  // A query to fetch all jobs from Firestore. Read
  Query<Job> jobsQuery() {
    return _firestore.collection('jobs').withConverter(
        fromFirestore: (snapshot, _) => Job.fromMap(snapshot.data()!),
        toFirestore: (job, _) => job.toMap());
  }
}

/// A provider for the `FirestoreRepository` instance.
///
/// This provider creates and returns a new instance of `FirestoreRepository`
/// using the default `FirebaseFirestore` instance.
final firestoreRepositoryProvider = Provider<FirestoreRepository>((ref) {
  return FirestoreRepository(FirebaseFirestore.instance);
});
