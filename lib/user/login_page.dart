import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tes_android/calender.dart';
import 'package:tes_android/user/regis_page.dart';
import 'package:tes_android/utils/color_utils.dart';
import 'package:tes_android/reusable/reusable_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          hexStringToColor("00FFAB"),
          hexStringToColor("14C38E"),
          hexStringToColor("B8F1B0")
        ], begin: Alignment.topLeft, end: Alignment.bottomCenter)),
        child: SingleChildScrollView(
            child: Padding(
          padding: EdgeInsets.fromLTRB(
              20, MediaQuery.of(context).size.height * 0.2, 20, 0),
          child: Column(
            children: <Widget>[
              logoWidget("assets/logo1.png"),
              const SizedBox(
                height: 30,
              ),
              reusableTextField(
                  " Email ", Icons.person_outline, false, _emailTextController),
              const SizedBox(
                height: 20,
              ),
              reusableTextField(" Password ", Icons.lock_outline, true,
                  _passwordTextController),
              const SizedBox(
                height: 10,
              ),
              loginUIButton(context, "Masuk", () async {
                try {
                  await FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: _emailTextController.text,
                      password: _passwordTextController.text);
                  Fluttertoast.showToast(
                      msg: "Berhasil Masuk ", gravity: ToastGravity.TOP);
                  //sukses
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const Calendar(),
                  ));
                } on FirebaseAuthException {
                  Fluttertoast.showToast(
                      msg: "Periksa kembali Email dan Password Anda",
                      gravity: ToastGravity.TOP);
                }
              }),
              signUpOption(context),
            ],
          ),
        )),
      ),
    );
  }
}

class RegisOption extends StatelessWidget {
  const RegisOption({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

Row signUpOption(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Text("Tidak Punya Aun ?",
          style: TextStyle(color: Colors.white70, fontWeight: FontWeight.bold)),
      GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const RegisPage()),
          );
        },
        child: const Text(
          " DAFTAR ",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      )
    ],
  );
}
