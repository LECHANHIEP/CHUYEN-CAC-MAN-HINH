import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';
import 'manhinh2.dart'; // <-- import màn hình 2 nằm cùng thư mục
import 'dangki.dart';
// Các hàm tiện ích
void dangnhap() {
  print("Đăng nhập thành công!");
}

void goi() {
  Fluttertoast.showToast(
    msg: "Đang gọi...",
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    backgroundColor: const Color.fromARGB(137, 5, 2, 2),
    textColor: Colors.white,
    fontSize: 16.0,
  );
}

void timkiem() {
  Fluttertoast.showToast(
    msg: "Đang tìm...",
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    backgroundColor: const Color.fromARGB(137, 5, 2, 2),
    textColor: Colors.white,
    fontSize: 16.0,
  );
}

void fb() async {
  const url = "https://www.facebook.com/chanhiep.le.39/";
  if (await canLaunchUrl(Uri.parse(url))) {
    await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
  } else {
    print("Không thể mở liên kết!");
  }
}

// Màn hình chính
class ManChinh extends StatelessWidget {
  const ManChinh({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: Column(
          children: [
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'IoT',
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(width: 10),
                Image.asset(
                  'assets/photo/wifi.png',
                  width: 60,
                  height: 60,
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Text(
              'Internet of Things',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w400,
                fontFamily: 'kieu1',
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 60),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Nhập tài khoản",
                  prefixIcon: const Icon(Icons.email, color: Colors.blueAccent),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(color: Colors.black),
                  ),
                ),
                style: const TextStyle(
                  fontSize: 18,
                  fontFamily: 'Roboto',
                  color: Color.fromARGB(255, 1, 12, 7),
                ),
              ),
            ),
            const SizedBox(height: 30),
            const PasswordField(),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ManHinh2()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                padding: const EdgeInsets.symmetric(horizontal: 80),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text(
                "Đăng nhập",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
            TextButton(
              onPressed: () {
                print("Nút quên mật khẩu được nhấn!");
              },
              child: const Text(
                "Quên mật khẩu?",
                style: TextStyle(fontSize: 16, color: Colors.blueAccent),
              ),
            ),
            TextButton(
              onPressed: () {
               Navigator.push(
                context, MaterialPageRoute(builder: (_)=> const dangki()),
               );

                
                print("Nút đăng kí được nhấn!");
              },
              child: const Text(
                "Chưa có tài khoản. Đăng ký",
                style: TextStyle(fontSize: 16, color: Colors.blueAccent),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: timkiem,
                  icon: const Icon(Icons.search_sharp, size: 40, color: Colors.blueAccent),
                ),
                IconButton(
                  onPressed: () {
                    goi();
                    fb();
                  },
                  icon: const Icon(Icons.phone, size: 40, color: Colors.blueAccent),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Widget nhập mật khẩu
class PasswordField extends StatefulWidget {
  const PasswordField({super.key});
  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool tt = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: TextField(
        obscureText: tt,
        decoration: InputDecoration(
          hintText: "Nhập mật khẩu",
          prefixIcon: const Icon(Icons.lock, color: Colors.blueAccent),
          suffixIcon: IconButton(
            icon: Icon(
              tt ? Icons.visibility_off : Icons.visibility,
              color: Colors.grey,
            ),
            onPressed: () {
              setState(() {
                tt = !tt;
              });
            },
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: Colors.black),
          ),
        ),
        style: const TextStyle(
          fontSize: 18,
          fontFamily: 'Roboto',
          color: Color.fromARGB(255, 1, 12, 7),
        ),
      ),
    );
  }
}
