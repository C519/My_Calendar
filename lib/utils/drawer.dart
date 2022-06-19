import 'package:flutter/material.dart';
import 'package:tes_android/calender.dart';
import 'package:tes_android/event.dart';
import 'package:tes_android/user/profil.dart';
import 'package:tes_android/inf/detail_list.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromARGB(255, 20, 195, 142),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration:
                BoxDecoration(color: Color.fromARGB(225, 227, 252, 191)),
            child: Text(
              "MENU KALENDER",
              style: TextStyle(
                  fontFamily: "poppins", fontSize: 20, color: Colors.black),
            ),
          ),
          ListTile(
            title: Container(
              child: Row(
                children: [
                  const Icon(
                    Icons.home,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Dasboard',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  )
                ],
              ),
            ),
            onTap: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (_) => Calendar()));
            },
          ),
          SizedBox(
            height: 30,
          ),
          Divider(
            color: Colors.white,
          ),
          ListTile(
            title: Container(
              child: Row(
                children: [
                  Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Profil',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  )
                ],
              ),
            ),
            onTap: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (_) => Profil()));
            },
          ),
          SizedBox(
            height: 30,
          ),
          Divider(
            color: Colors.white,
          ),
          ListTile(
              title: Container(
                child: Row(
                  children: [
                    Icon(
                      Icons.other_houses_outlined,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Informasi Hari Besar',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    )
                  ],
                ),
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: ((context) {
                  return EventList();
                })));
              }),
          SizedBox(
            height: 30,
          ),
          Divider(
            color: Colors.white,
          ),
          ListTile(
            title: Container(
              child: Row(
                children: [
                  Icon(
                    Icons.note_add,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Agenda',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  )
                ],
              ),
            ),
            onTap: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (_) => For()));
            },
          ),
        ],
      ),
    );
  }
}
