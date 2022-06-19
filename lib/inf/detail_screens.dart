import 'package:flutter/material.dart';
import 'lainn.dart';
import 'package:tes_android/utils/color_utils.dart';

class EventDetailsScreen extends StatelessWidget {
  final Lainn lainn;

  const EventDetailsScreen(this.lainn);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 76, 227, 177),
        title: Text(lainn.title),
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
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                lainn.imageurl,
                height: 500,
              ),
              Padding(
                // untuk tampilan setelah dipencet
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  lainn.tgl,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 25.0,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  lainn.desc,
                  textAlign: TextAlign.justify,
                  style: const TextStyle(fontSize: 20.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
