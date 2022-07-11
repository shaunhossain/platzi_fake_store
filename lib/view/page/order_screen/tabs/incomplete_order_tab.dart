import 'package:flutter/material.dart';

class InCompleteOrderTab extends StatelessWidget {
  const InCompleteOrderTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Scaffold(
      body: Center(
        child: Text('incomplete'),
      ),
    ));
  }
}
