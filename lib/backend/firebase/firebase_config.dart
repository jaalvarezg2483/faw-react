import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAhkWCcoIh8mpa9wl1e1fS-7dnMC8997oI",
            authDomain: "faw-cms.firebaseapp.com",
            projectId: "faw-cms",
            storageBucket: "faw-cms.appspot.com",
            messagingSenderId: "693191174572",
            appId: "1:693191174572:web:d34b46510bbf8b1f0e3209"));
  } else {
    await Firebase.initializeApp();
  }
}
