import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDjbj8f64knnx2LWSXHXgZ_ZPMLBzZKXlA",
            authDomain: "sr-group-stays-4cdb3.firebaseapp.com",
            projectId: "sr-group-stays-4cdb3",
            storageBucket: "sr-group-stays-4cdb3.appspot.com",
            messagingSenderId: "585262537421",
            appId: "1:585262537421:web:c577fec58dc3316e2a6784",
            measurementId: "G-9NDCYLBDY7"));
  } else {
    await Firebase.initializeApp();
  }
}
