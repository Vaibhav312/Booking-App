import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService{

  final String uid;
  DatabaseService({this.uid});
  final CollectionReference notesCollection= Firestore.instance.collection('notes');

  Future updateUserData(String notesData) async{
    return await notesCollection.document(uid).setData({
      'notes':notesData,
    });
  }
}