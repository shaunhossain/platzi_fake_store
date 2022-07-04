import 'package:flutter/material.dart';

class ViewSingleCategoryScreen extends StatelessWidget {
  const ViewSingleCategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Scaffold(
          body: Center(
            child: Text("view single category product"),
          ),
        ));
  }
}
