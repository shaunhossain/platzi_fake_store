import 'package:flutter/material.dart';

class ViewProductScreen extends StatelessWidget {
  const ViewProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Scaffold(
          body: Center(
            child: Text("View Product"),
          ),
        ));
  }
}
