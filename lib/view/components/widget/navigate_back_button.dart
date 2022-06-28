import 'package:flutter/material.dart';

class NavigateBackButton extends StatelessWidget {
  const NavigateBackButton({Key? key, required this.icon, required this.onPress}) : super(key: key);

  final IconData icon;
  final Function () onPress;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: FittedBox(
        fit: BoxFit.cover,
        child: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.all(10),
          child: IconButton(
            icon: Icon(
              icon,
              color: Colors.black,
              size: 24,
            ),
            onPressed: onPress,
          ),
        ),
      ),
    );
  }
}
