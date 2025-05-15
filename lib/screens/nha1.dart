import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import "package:firebase_database/firebase_database.dart";
import 'home.dart'; // Đảm bảo bạn đã tạo file home.dart với lớp Home

class Nha1 extends StatelessWidget {
  const Nha1({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NHÀ 1',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late DatabaseReference _ledRef;
  int _ledStatus = 0;

  @override
  void initState() {
    super.initState();
    _ledRef = FirebaseDatabase.instanceFor(
      app: Firebase.app(),
      databaseURL: 'https://smart-home1-c7725-default-rtdb.firebaseio.com/',
    ).ref().child('led');

    // lấy dữ liệu từ firebase 
    _ledRef.onValue.listen((event) {
      final value = event.snapshot.value;
      if (value is int || value is double) {
        setState(() {
          _ledStatus = (value as num).toInt();
        });
      }
    });
  }

  void _toggleLed() {
    final newStatus = _ledStatus == 0 ? 1 : 0;
    _ledRef.set(newStatus);
  }

  @override
  Widget build(BuildContext context) {
    final isLedOn = _ledStatus == 1;
    
    return Scaffold(
      appBar: AppBar(
  leading: IconButton(
    icon: const Icon(Icons.arrow_back),
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const Home()),
      );


      
    },
  ),
  title: const Text("Nhà 1"),
  centerTitle: true, // Căn giữa tiêu đề
),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              isLedOn ? Icons.lightbulb : Icons.lightbulb_outline,
              color: isLedOn ? Colors.yellow : Colors.grey,
              size: 100,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _toggleLed,
              child: Text(isLedOn ? 'Tắt LED' : 'Bật LED'),
            ),
            const SizedBox(height: 10),
            Text("Trạng thái hiện tại: ${isLedOn ? "BẬT" : "TẮT"}"),
          ],
        ),
      ),
    );
  }
}
