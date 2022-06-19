import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tes_android/user/login_page.dart';
import 'package:tes_android/utils/color_utils.dart';
import 'package:tes_android/utils/drawer.dart';

class Profil extends StatefulWidget {
  const Profil({Key? key}) : super(key: key);

  @override
  State<Profil> createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 76, 227, 177),
        elevation: 0,
        title: const Text(
          " Profil  ",
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
                20, MediaQuery.of(context).size.height * 0.2, 20, 0),
            child: ElevatedButton(
              child: const Text("Keluar"),
              onPressed: () {
                FirebaseAuth.instance.signOut().then((value) {
                  Fluttertoast.showToast(
                      msg: "Berhasil Keluar", gravity: ToastGravity.TOP);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ));
                });
              },
            ),
          ),
        ),
      ),
      drawer: const MyDrawer(),
    );
  }
}
