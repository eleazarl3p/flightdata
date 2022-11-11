import 'package:flutter/material.dart';

AppBar appbar = AppBar(
    // backgroundColor: Colors.grey,
    title: Text('Flight'),
    backgroundColor: Colors.blueGrey.shade200);

Drawer appdrawer = Drawer(
    backgroundColor: Colors.blueGrey.shade300,
    child: ListView(
      children: [
        DrawerHeader(
          decoration: BoxDecoration(color: Colors.blueGrey.shade600),
          child: const Icon(Icons.home),
        ),
        const ListTile(
          leading: Icon(Icons.house),
        ),
        const ListTile(
          leading: Icon(Icons.abc),
          title: Text("kf"),
        )
      ],
    ));
