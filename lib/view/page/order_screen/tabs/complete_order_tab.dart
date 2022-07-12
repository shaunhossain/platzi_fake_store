import 'package:flutter/material.dart';

class CompleteOrderTab extends StatelessWidget {
  const CompleteOrderTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Scaffold(
      body: Center(
        child: Text('complete'),
      ),
    ));
  }
}
