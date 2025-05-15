import 'package:app1/firebase_options.dart';
import 'package:flutter/material.dart';
import 'screens/manhinhchinh.dart'; // <-- Import đúng đường dẫn
import 'package:firebase_core/firebase_core.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IOT',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ManChinh(), // <-- đây là màn hình bạn muốn hiện đầu tiên
    );
  }
}
