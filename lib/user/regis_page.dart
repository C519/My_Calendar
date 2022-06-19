import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tes_android/reusable/reusable_widget.dart';
import 'package:tes_android/user/login_page.dart';
import 'package:tes_android/utils/color_utils.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegisPage extends StatefulWidget {
  const RegisPage({Key? key}) : super(key: key);

  @override
  State<RegisPage> createState() => _RegisPageState();
}

class _RegisPageState extends State<RegisPage> {
  final TextEditingController _usernameTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          " Registrasi ",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          hexStringToColor("00FFAB"),
          hexStringToColor("14C38E"),
          hexStringToColor("B8F1B0")
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.height * 0.15, 20, 0),
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 30,
                ),
                reusableTextField("Masukkan Nama ", Icons.person_outline, false,
                    _usernameTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Masukkan Email ", Icons.email_outlined,
                    false, _emailTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Masukkan Kata Sandi ", Icons.lock, true,
                    _passwordTextController),
                const SizedBox(
                  height: 20,
                ),
                loginUIButton(context, "DAFTAR", () async {
                  try {
                    await FirebaseAuth.instance.createUserWithEmailAndPassword(
                        email: _emailTextController.text,
                        password: _passwordTextController.text);
                    Fluttertoast.showToast(
                        msg: "Berhasil DAFTAR ", gravity: ToastGravity.TOP);
                    //sukses
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    ));
                  } on FirebaseAuthException {
                    Fluttertoast.showToast(
                        msg: "GAGAL DAFTAR ", gravity: ToastGravity.TOP);
                  }
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
