import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

AppBar contactsAppBar() {
  return AppBar(
      backgroundColor: Color(0xFF0bc8a7),
      title: Text('CONTACTS',
        style: TextStyle(
            color: Colors.white,
            letterSpacing: 3.0,
            fontSize: 16.0
        ),
      ),
      centerTitle: true,
      automaticallyImplyLeading: false,
      leading: IconButton(
        icon: Icon(Icons.sort, color: Colors.white),
        onPressed: () {
          // opens menu list
        },
      )
  );
}