import 'package:flutter/material.dart';
import 'lainn.dart';
import 'detail_screens.dart';
import 'package:tes_android/utils/drawer.dart';

class EventList extends StatelessWidget {
  const EventList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 76, 227, 177),
        title: const Text(' Informasi Hari Besar '),
      ),
      body: ListView.builder(
        itemCount: lainnList.length,
        itemBuilder: (context, index) {
          Lainn lainn = lainnList[index];
          return Card(
            child: ListTile(
              tileColor: const Color.fromARGB(255, 0, 255, 171),
              title: Text(lainn.title),
              subtitle: Text(lainn.tgl),
              leading: Image.network(lainn.imageurl),
              trailing: const Icon(Icons.arrow_forward_rounded),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EventDetailsScreen(lainn)));
              },
            ),
          );
        },
      ),
      drawer: const MyDrawer(),
    );
  }
}
