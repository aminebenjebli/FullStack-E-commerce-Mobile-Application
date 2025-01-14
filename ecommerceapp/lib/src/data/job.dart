import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

/// Model class for documents in the jobs collection
class Job extends Equatable {
  const Job({required this.title, required this.company, this.createdAt});
  final String title;
  final String company;
  final DateTime? createdAt; //we take the as datetime in the ui

  factory Job.fromMap(Map<String, dynamic> map) {
    final createdAt = map['createdAt'];
    return Job(
      title: map['title'] as String,
      company: map['company'] as String,
      createdAt: createdAt != null ? (createdAt as Timestamp).toDate() : null, // the date stored in firestore is timestamp
    );
  }
  Map<String, dynamic> toMap() => {
        'title': title,
        'company': company,
        if(createdAt != null) 'createdAt' : Timestamp.fromDate(createdAt!), // we reverse the timestamp to date to 
      };   
  @override
  List<Object?> get props => [title, company,createdAt];
}
