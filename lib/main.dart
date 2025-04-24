import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThayDoiSo(),
      child: MaterialApp(
        home: ManChinh(),
      ),
    ),
  );
}

class ThayDoiSo extends ChangeNotifier {
  int _soDem = 50;

  int get soDem => _soDem;

  void tang() {
    _soDem++;
    notifyListeners();
  }
}

class ManChinh extends StatelessWidget {
  const ManChinh({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Màn hình chính',
          style: TextStyle(
            fontSize: 20,
            color: Color.fromARGB(255, 7, 114, 255),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              context.watch<ThayDoiSo>().soDem.toString(),
              style: const TextStyle(
                fontSize: 50,
                color: Colors.red,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ManHinh2()),
                );
              },
              child: const Text('Chuyển đến màn hình 2'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<ThayDoiSo>().tang();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class ManHinh2 extends StatelessWidget {
  const ManHinh2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Màn hình 2'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              context.watch<ThayDoiSo>().soDem.toString(),
              style: const TextStyle(
                fontSize: 50,
                color: Colors.red,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Quay về màn hình chính'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<ThayDoiSo>().tang();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
