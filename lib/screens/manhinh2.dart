import 'package:app1/screens/manhinhchinh.dart';
import 'package:flutter/material.dart';

class ManHinh2 extends StatelessWidget {
  const ManHinh2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Màn hình 2'),
        backgroundColor: const Color.fromARGB(255, 112, 255, 68),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Đây là màn hình 2',
              style: TextStyle(fontSize: 30, color: Colors.red),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Khi nhấn nút, chuyển về màn hình ManChinh
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ManChinh()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent, // Màu nền của nút
                padding: const EdgeInsets.symmetric(horizontal: 80),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text(
                'Quay về Màn hình chính',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
