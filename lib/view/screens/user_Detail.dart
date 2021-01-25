import 'package:flutter/material.dart';

class UserDetails extends StatelessWidget {
  int id;
  UserDetails(this.id);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(id.toString()),
    );
  }
}
