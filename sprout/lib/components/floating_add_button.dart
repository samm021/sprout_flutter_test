import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

FloatingActionButton floatingAddButton() {
  return FloatingActionButton(
    child: Icon(Icons.add),
    backgroundColor: Color(0xFF0bc8a7),
    onPressed: () {
      // opens add_contact page
    },
  );
}