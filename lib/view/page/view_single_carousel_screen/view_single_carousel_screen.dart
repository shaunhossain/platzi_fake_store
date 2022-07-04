import 'package:flutter/material.dart';

class ViewSingleCarouselScreen extends StatelessWidget {
  const ViewSingleCarouselScreen({Key? key}) : super(key: key);

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
