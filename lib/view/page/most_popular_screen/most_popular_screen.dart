import 'package:flutter/material.dart';

class MostPopularScreen extends StatelessWidget {
  const MostPopularScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Scaffold(
          body: Center(
            child: Text("Most Popular"),
          ),
        ));
  }
}
