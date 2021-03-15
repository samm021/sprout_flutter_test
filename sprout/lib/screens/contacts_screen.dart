import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:sprout/components/contacts_app_bar.dart';
import 'package:sprout/components/floating_add_button.dart';

class ContactsScreen extends StatefulWidget {
  ContactsScreen({this.contactsData});

  final contactsData;

  @override
  _ContactsScreenState createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  int _selectedIndex;
  
  _onSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: contactsAppBar(),
      floatingActionButton: floatingAddButton(),
      body: ListView.builder(
        itemCount: widget.contactsData.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                _onSelected(index);
              });
            },
            child: Container(
              height: 90.0,
              color: (_selectedIndex != null && _selectedIndex == index)
                  ? Colors.purple[100]
                  : (index + 1).isOdd ? Colors.grey[200] : Colors.white,
              child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 4,
                      child: Container(
                        decoration: BoxDecoration(
                            color: (_selectedIndex != null && _selectedIndex == index)
                                ? Colors.grey[800]
                                : Colors.purple[200],
                          image: DecorationImage(
                            image: NetworkImage(
                                widget.contactsData[index]['avatar']),
                            fit: BoxFit.fill,
                            colorFilter: ColorFilter.mode(
                                Colors.black.withOpacity(0.5),
                                BlendMode.dstATop
                            )
                          ),
                        ),
                      ),
                    ),
                    Spacer(
                      flex: 1,
                    ),
                    Expanded(
                      flex: 8,
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                                '${widget.contactsData[index]['first_name']} ${widget.contactsData[index]['last_name']}',
                                style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                  color: (_selectedIndex != null && _selectedIndex == index)
                                      ? Colors.white
                                      : null
                                )
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              widget.contactsData[index]['email'],
                              style: TextStyle(
                                  fontSize: 13.0,
                                  color: (_selectedIndex != null && _selectedIndex == index)
                                      ? Colors.white
                                      : null
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Spacer(
                      flex: 1,
                    ),
                    Expanded(
                      flex: 5,
                      child: Container(
                        child:
                        (_selectedIndex != null && _selectedIndex == index)
                            ? Row(
                              children: <Widget>[
                              IconButton(
                                  icon: Icon(
                                    Icons.call,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    // call selected contact
                                    print('call: ${widget.contactsData[index]['first_name']}');
                                  }
                              ),
                              IconButton(
                                  icon: Icon(
                                    Icons.message_outlined,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    // message selected contact
                                    print('message: ${widget.contactsData[index]['first_name']}');
                                  }
                              )
                            ],
                          )
                          : Icon(
                              Icons.stop_circle,
                              color: Colors.green[300],
                              size: 15.0
                        )
                      ),
                    )
                ]
              ),
            ),
          );
        }
      )
    );
  }
}
