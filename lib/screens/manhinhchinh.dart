import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';
import 'home.dart';
import 'dangki.dart';

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

class ManChinh extends StatelessWidget {
  const ManChinh({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          color: Colors.white,
          child: Column(
            children: const [
              SizedBox(height: 30),
              _LogoSection(),
              SizedBox(height: 40),
              _LoginForm(),
              SizedBox(height: 20),
              _ActionButtons(),
              SizedBox(height: 10),
              Text('Đăng nhập với ',
              style: TextStyle(color: Colors.blueAccent),),
              SizedBox(height: 20),
              _FooterActions(),
            ],
          ),
        ),
      ),
    );
  }
}

// Logo và tiêu đề
class _LogoSection extends StatelessWidget {
  const _LogoSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
            Image.asset('assets/photo/wifi.png', width: 60, height: 60),
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
      ],
    );
  }
}

// Form nhập tài khoản và mật khẩu
class _LoginForm extends StatelessWidget {
  const _LoginForm();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 50),
          child: TextField(
            decoration: InputDecoration(
              hintText: "Nhập tài khoản",
              prefixIcon: Icon(Icons.email, color: Colors.blueAccent),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                borderSide: BorderSide(color: Colors.black),
              ),
            ),
            style: TextStyle(
              fontSize: 18,
              fontFamily: 'Roboto',
              color: Color.fromARGB(255, 1, 12, 7),
            ),
          ),
        ),
        SizedBox(height: 30),
        PasswordField(),
      ],
    );
  }
}

// Các nút Đăng nhập, Quên mật khẩu, Đăng ký
class _ActionButtons extends StatelessWidget {
  const _ActionButtons();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            print('nút đăng nhập được nhấn ');
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => Home()),
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
              context,
              MaterialPageRoute(builder: (_) => const dangki()),
            );
            print("Nút đăng kí được nhấn!");
          },
          child: const Text(
            "Chưa có tài khoản. Đăng ký",
            style: TextStyle(fontSize: 16, color: Colors.blueAccent),
          ),
        ),
      ],
    );
  }
}

// Icon tìm kiếm và gọi
class _FooterActions extends StatelessWidget {
  const _FooterActions();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center, // đưa icon vào giữa
      children: [
        IconButton(
          onPressed: timkiem,
          icon: const Icon(Icons.email, size: 40, color: Colors.blueAccent),
        ),
        const SizedBox(width: 20), // chỉnh khoảng cách tùy ý
        IconButton(
          onPressed: () {
            goi();
            fb();
          },
          icon: const Icon(Icons.facebook, size: 40, color: Colors.blueAccent),
        ),
      ],
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
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: TextField(
        obscureText: _isObscure,
        decoration: InputDecoration(
          hintText: "Nhập mật khẩu",
          prefixIcon: const Icon(Icons.lock, color: Colors.blueAccent),
          suffixIcon: IconButton(
            icon: Icon(
              _isObscure ? Icons.visibility_off : Icons.visibility,
              color: Colors.grey,
            ),
            onPressed: () {
              setState(() {
                _isObscure = !_isObscure;
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
