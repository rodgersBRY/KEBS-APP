import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppBar(
              elevation: 0,
              title: Text('Contact Details'),
            ),
            Gap(40),
            ContactItem(
              BoldText('Customer Care'),
              SmallText('254206948000'),
            ),
            Gap(20),
            ContactItem(
              BoldText("Mombasa Region"),
              SmallText('0722202137'),
            ),
            Gap(20),
            ContactItem(
              BoldText("Sample Control"),
              SmallText('0206948613'),
            ),
            Gap(20),
            ContactItem(
              BoldText("Toll Free"),
              SmallText('1545'),
            ),
          ],
        ),
      ),
    );
  }

  Widget ContactItem(Widget bigText, Widget smallText) {
    return SizedBox(
      height: 130,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              child: bigText,
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              width: double.infinity,
              color: Colors.grey[100],
              padding: const EdgeInsets.all(10.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: smallText,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget BoldText(String text) {
    return Text(
      text,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
    );
  }

  Widget SmallText(String text) {
    return Text(
      text,
      style: TextStyle(fontSize: 16),
    );
  }
}
