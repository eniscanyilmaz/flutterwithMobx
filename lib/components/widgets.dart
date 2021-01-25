import 'package:flutter/material.dart';

Widget infoWindowRow(String title, String text) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "$title ",
        style: TextStyle(
            color: Colors.white, fontSize: 16, fontFamily: "Raleway-Bold"),
      ),
      Container(
        constraints: BoxConstraints(maxWidth: 220),
        child: Text(
          text,
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontFamily: "Raleway-Regular"),
        ),
      ),
    ],
  );
}
