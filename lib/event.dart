// import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:tes_android/utils/allert.dart';
import 'package:tes_android/utils/item_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tes_android/utils/drawer.dart';

class For extends StatefulWidget {
  const For({Key? key}) : super(key: key);

  @override
  State<For> createState() => _FromState();
}

enum Survive { formal, nonFormal, semiFormal }

class _FromState extends State<For> {
  Future<void> showInformationDialog(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: const Color.fromARGB(22, 0, 0, 0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 15),
              const Text(
                "Data di simpan",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
          actions: <Widget>[
            const SizedBox(height: 15),
            InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                width: double.infinity,
                height: 40,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  "OK",
                  style: TextStyle(fontSize: 17, color: Colors.white),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  TextEditingController controllernama = TextEditingController();
  TextEditingController controllerwaktu = TextEditingController();
  final TextEditingController _myController = TextEditingController();

  String namaAgenda = '', waktuAgenda = '';

  bool nilaiCheckbox = false;
  List<String> survive = ["Formal", "NonFormal", "SemiFormal"];
  String survivee = "";

  @override
  void dispose() {
    controllernama.dispose();
    controllerwaktu.dispose();
    super.dispose();
  }

  void hapusValue() {
    controllernama.text = "";
    controllerwaktu.text = "";
  }

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference agenda = firestore.collection("Agenda");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 76, 227, 177),
        title: const Text("AGENDA"),
        centerTitle: true,
      ),
      body: Container(
        color: const Color.fromARGB(255, 219, 216, 218),
        child: ListView(
          children: [
            Container(
              margin: const EdgeInsets.all(23),
              child: Column(
                children: [
                  TextFormField(
                    controller: controllernama,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Color.fromARGB(255, 29, 202, 202),
                      )),
                      hintText: "Nama Agenda",
                      labelText: "Nama Agenda",
                    ),
                  ),
                  const SizedBox(height: 25),
                  TextFormField(
                    controller: controllerwaktu,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Color.fromARGB(255, 29, 202, 202),
                      )),
                      hintText: "Waktu Agenda",
                      labelText: "Waktu Agenda",
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 25),
                    child: Row(
                      children: [
                        Checkbox(
                            value: nilaiCheckbox,
                            onChanged: (bool? value) {
                              setState(() {
                                nilaiCheckbox = value!;
                              });
                            }),
                        const Text(
                          "Nyalakan Notifikasi?",
                          style: TextStyle(
                            color: Color.fromARGB(255, 200, 5, 21),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        for (var item in survive)
                          Column(
                            children: [
                              Radio(
                                  value: item,
                                  groupValue: survivee,
                                  onChanged: (newValue) {
                                    setState(() {
                                      survivee = newValue.toString();
                                    });
                                  }),
                              Text(item),
                            ],
                          ),
                      ],
                    ),
                  ),
                  Container(
                    width: 250,
                    height: 40,
                    margin: const EdgeInsets.only(top: 20),
                    child: ElevatedButton(
                      onPressed: () async {
                        await showInformationDialog(context);
                        setState(() {
                          agenda.add({
                            'NamaAgenda': controllernama.text,
                            'WaktuAgenda': controllerwaktu.text,
                            'DilaksanakanSecara': survivee,
                            'NyalakanNotifikasi': nilaiCheckbox,
                          });

                          namaAgenda = controllernama.text;
                          waktuAgenda = controllerwaktu.text;

                          hapusValue();
                        });
                        customAlert(context, _myController.text);
                      },
                      child: const Text("Tambah"),
                      style: ElevatedButton.styleFrom(
                        primary: const Color.fromARGB(255, 76, 227, 177),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            StreamBuilder<QuerySnapshot>(
              stream: agenda.snapshots(),
              builder: (context, snapshot) {
                return (snapshot.hasData)
                    ? Column(
                        children: snapshot.data!.docs
                            .map(
                              (e) => ItemCard(
                                e.get('NamaAgenda'),
                                e.get('WaktuAgenda'),
                                e.get('DilaksanakanSecara'),
                                e.get('NyalakanNotifikasi'),
                                onUpdate: () {
                                  agenda.doc(e.id).update({
                                    'NamaAgenda': controllernama.text,
                                    'WaktuAgenda': controllerwaktu.text,
                                    'DilaksanakanSecara': survivee,
                                    'NyalakanNotifikasi': nilaiCheckbox,
                                  });
                                  namaAgenda = controllernama.text;
                                  waktuAgenda = controllerwaktu.text;

                                  hapusValue();
                                },
                                onDelete: () {
                                  agenda.doc(e.id).delete();
                                },
                              ),
                            )
                            .toList(),
                      )
                    : const Text('Loading');
              },
            ),
          ],
        ),
      ),
      drawer: const MyDrawer(),
    );
  }
}
