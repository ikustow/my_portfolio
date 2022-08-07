
import 'package:flutter/material.dart';
import 'package:portfolio/core/models/contacts.dart';

class DesktopContactsColumn extends StatelessWidget {

  final List<Contacts> contacts;

  const DesktopContactsColumn({
    Key? key,

    required this.contacts,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.greenAccent.shade100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          for (Contacts element in contacts)
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ColumnContactWidget(
                  element: element,
                ),
              ),
            )
        ],
      ),
    );
  }
}


class ColumnContactWidget extends StatelessWidget {
  final Contacts element;

  const ColumnContactWidget({Key? key, required this.element})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "${element.name.toString()}: ${element.link.toString()}",
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    );
  }
}