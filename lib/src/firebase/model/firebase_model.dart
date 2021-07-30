import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseModel<M> {
  final DocumentSnapshot doc;
  final M model;

  FirebaseModel(this.doc, this.model);
}