import 'package:cloud_firestore/cloud_firestore.dart';

import '../../log.dart';

typedef FireStoreCollectionDecoder<T> = T? Function(Map<String, dynamic> map);

enum FireStoreCollections {
  USER,
}

extension FireStoreCollectionsExtension on FireStoreCollections {
  String get id {
    switch(this) {
      case FireStoreCollections.USER:
        return 'user';
    }
  }

  CollectionReference get collection => FirebaseFirestore.instance.collection(id);

  Future<Map<String, dynamic>?> data([String? path]) async {
    try {
      final data = (await doc(path).get()).data();
      if(data is Map<String, dynamic>) {
        return data;
      }
    } catch(_) {
      Log.i('Error: FireStoreCollections data : $_');
    }
    return null;
  }

  Future<T?> dataWithDecode<T>({String? path, required FireStoreCollectionDecoder<T> decoder}) async {
    final data = await this.data(path);
    if(data is Map<String, dynamic>) {
      return decoder(data);
    }
    throw NullThrownError();
  }

  DocumentReference doc([String? path]) {
    return collection.doc(path);
  }

  Future<List<QueryDocumentSnapshot>?> docs() async {
    try {
      return (await collection.get()).docs;
    } catch(_) {
      Log.i('Error: FireStoreCollections docs : $_');
    }
    return null;
  }

  Future<DocumentSnapshot> snapshot([String? path]) => collection.doc(path).get();

}