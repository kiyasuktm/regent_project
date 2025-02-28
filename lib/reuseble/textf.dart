import 'package:flutter/material.dart';

class Textf extends StatelessWidget {
  const Textf({
    super.key,
    required this.labtext,
    required this.priicon,
  });

  final String labtext;
  final IconData priicon;
  @override
  Widget build(BuildContext context) {
    return TextField(
        decoration: InputDecoration(
            suffix: const Padding(
              padding: EdgeInsets.all(15),
              child: Icon(Icons.email_outlined),
            ),
            contentPadding: const EdgeInsets.only(left: 45),
            prefixIcon: Padding(
              padding: const EdgeInsets.all(15),
              child: Icon(priicon),
            ),
            labelText: labtext,
            enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(80),
                ),
                borderSide: BorderSide(color: Colors.green, width: 1)),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue, width: 1),
              borderRadius: BorderRadius.all(Radius.circular(80)),
            )));
  }
}
