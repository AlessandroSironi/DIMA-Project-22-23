import 'package:cloud_firestore/cloud_firestore.dart';
import '../auth/firebase_auth/auth_util.dart';

void removeFoodTemp() async {
  /* final firestore = FirebaseFirestore.instance;

  QuerySnapshot querySnapshot = await firestore
      .collection('users')
      .doc(currentUserDocument?.uid)
      .collection('temp')
      .where("id", isEqualTo: documentId)
      .limit(1)
      .get();

  if (querySnapshot.docs.length != 0) {
    DocumentSnapshot documentSnapshot1 = querySnapshot.docs.first;
    DocumentReference documentReference = documentSnapshot1.reference;
    await documentReference.delete();
  } */
  final firestore = FirebaseFirestore.instance;

  QuerySnapshot querySnapshot = await firestore
      .collection('users')
      .doc(currentUserDocument?.uid)
      .collection('temp')
      .get();

  if (querySnapshot.docs.isNotEmpty) {
    List<Future<void>> deleteFutures = [];
    for (QueryDocumentSnapshot documentSnapshot in querySnapshot.docs) {
      deleteFutures.add(documentSnapshot.reference.delete());
      print("Deleting a temp food...");
    }
    await Future.wait(deleteFutures);
  }
}
