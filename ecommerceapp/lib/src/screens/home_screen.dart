import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerceapp/src/data/firestore_repository.dart';
import 'package:ecommerceapp/src/data/job.dart';
import 'package:ecommerceapp/src/routing/app_route.dart';
import 'package:faker/faker.dart' hide Job;
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Jobs'), actions: [
        IconButton(
          icon: const Icon(Icons.person),
          onPressed: () => context.goNamed(AppRoute.profile.name),
        )
      ]),
      body: const JobsListView(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          final user = ref.read(firebaseAuthProvider).currentUser;
          final faker = Faker();
          final title = faker.job.title();
          final company = faker.company.name();
          ref
              .read(firestoreRepositoryProvider)
              .addJob(user!.uid, title, company);
        },
      ),
    );
  }
}

class JobsListView extends ConsumerWidget {
  const JobsListView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final firestoreRepository = ref.watch(firestoreRepositoryProvider);
    return FirestoreListView<Job>(
      query: firestoreRepository.jobsQuery(),
      itemBuilder: (BuildContext context, QueryDocumentSnapshot<Job> doc) {
        final job = doc.data();
        return Dismissible(
          key: Key(doc.id),
          background: const ColoredBox(color: Colors.red),
          direction: DismissDirection.endToStart,
          onDismissed: (direction) {
            final user = ref.read(firebaseAuthProvider).currentUser;
            ref.read(firestoreRepositoryProvider).deleteJob(user!.uid, doc.id);
          },
          child: ListTile(
            title: Text(job.title),
            subtitle: Text(job.company),
            onTap: () {
              final user = ref.read(firebaseAuthProvider).currentUser;
              final faker = Faker();
              final title = faker.job.title();
              final company = faker.company.name();
              ref
                  .read(firestoreRepositoryProvider)
                  .updateJob(user!.uid, doc.id, title, company);
            },
          ),
        );
      },
    );
  }
}
