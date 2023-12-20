import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:journal/views/home/home_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyAeOgrjx0xuryQzgaUXmIJlz_acBTPSuy4",
        authDomain: "mc-database-69.firebaseapp.com",
        projectId: "mc-database-69",
        storageBucket: "mc-database-69.appspot.com",
        messagingSenderId: "498563671027",
        appId: "1:498563671027:web:9b667e737df3c70959e886",
        measurementId: "G-KR6H4FC2QL",
      ),
    );
  }

  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Journal',
      home: HomeView(),
    );
  }
}
