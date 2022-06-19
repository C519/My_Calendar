import 'dart:ffi';

import 'package:flutter/material.dart';

class ItemCard extends StatefulWidget {
  final String namaAgenda, waktuAgenda, Survive;
  final bool checkbox;
  //// Pointer to Update Function
  final Function? onUpdate;
  //// Pointer to Delete Function
  final Function? onDelete;

  ItemCard(this.namaAgenda, this.waktuAgenda, this.Survive, this.checkbox,
      {this.onUpdate, this.onDelete});

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          // border: Border.all(color: Color(0xFFdb9caf))),
          border: Border.all(color: Color.fromARGB(255, 23, 179, 179))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Text(
                  widget.namaAgenda,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ),
              Text(
                widget.waktuAgenda,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              Text(
                widget.Survive,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              Text(
                "${widget.checkbox}",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(
                height: 40,
                width: 60,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      primary: Colors.green[900],
                    ),
                    child: Center(
                        child: Icon(
                      Icons.update,
                      color: Colors.white,
                    )),
                    onPressed: () {
                      if (widget.onUpdate != null) widget.onUpdate!();
                    }),
              ),
              SizedBox(
                height: 40,
                width: 60,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      primary: Colors.red[900],
                    ),
                    child: Center(
                        child: Icon(
                      Icons.delete,
                      color: Colors.white,
                    )),
                    onPressed: () {
                      if (widget.onDelete != null) widget.onDelete!();
                    }),
              )
            ],
          )
        ],
      ),
    );
  }
}
