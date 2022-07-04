import 'package:flutter/material.dart';

class SpecialOfferScreen extends StatelessWidget {
  const SpecialOfferScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Scaffold(
      body: Center(
        child: Text("Special offer"),
      ),
    ));
  }
}
