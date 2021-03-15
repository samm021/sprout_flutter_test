import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sprout/services/contacts.dart';
import 'package:sprout/screens/contacts_screen.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getContactsData();
  }

  void getContactsData() async {
    var contactsData = await ContactModel().getContactsData();

    print(contactsData);

    Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return ContactsScreen(
            contactsData: contactsData,
        );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.greenAccent,
          size: 100.0,
        ),
      ),
    );
  }
}
