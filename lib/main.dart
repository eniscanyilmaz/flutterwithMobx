import 'package:flutter/material.dart';
import 'package:flutterwith_mobx/view/screens/post_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: PostView(),
    );
  }
}
