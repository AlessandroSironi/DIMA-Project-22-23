import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyClmP1pAGe6y4qJZTNoy6p5lctkj0UmhPg",
            authDomain: "macrotracker-863f3.firebaseapp.com",
            projectId: "macrotracker-863f3",
            storageBucket: "macrotracker-863f3.appspot.com",
            messagingSenderId: "696417648981",
            appId: "1:696417648981:web:23bb619cdcbdb5442befdc",
            measurementId: "G-79NGYK0JDX"));
  } else {
    await Firebase.initializeApp();
  }
}
