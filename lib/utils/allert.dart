import 'package:flutter/material.dart';

Future<dynamic> CustomAlert(BuildContext context, String text) {
  return showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: Color.fromARGB(144, 183, 183, 223),
        actions: [
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  text,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 20),
                Image.asset(
                  "assets/calenderlogo2.png",
                  height: 200,
                  width: 200,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: double.infinity,
                    height: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 73, 255, 173),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      "Berhasil Dibuat",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    },
  );
}
