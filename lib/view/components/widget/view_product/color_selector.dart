import 'package:flutter/material.dart';
import 'package:platzi_fake_store/utils/size_config.dart';


class ColorSelector extends StatefulWidget {
  final List<Color> availableColors;
  final List<Color> selectedColors;
  final String label;
  final Function(List<Color>) onClick;

  const ColorSelector(
      {Key? key,
      required this.availableColors,
      required this.selectedColors,
      required this.label,
      required this.onClick})
      : super(key: key);

  @override
  ColorSelectorState createState() => ColorSelectorState();
}

class ColorSelectorState extends State<ColorSelector> {
  List<Color>? selectedColors;

  @override
  void initState() {
    selectedColors = widget.selectedColors;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(children: <Widget>[
      Container(
        margin: const EdgeInsets.only(top: 12),
        width: SizeConfig.width,
        color: Colors.white,
        child: Wrap(
          spacing: 15,
          children: buildColors(context),
        ),
      )
    ]);
  }

  List<Widget> buildColors(BuildContext context) {
    var colorWidgets = <Widget>[];
    for (var i = 0; i < widget.availableColors.length; i++) {
      colorWidgets.add(
        InkWell(
          onTap: (() => {updateSelectedColors(widget.availableColors[i])}),
          child: buildColorWidget(widget.availableColors[i], context),
        ),
      );
    }
    return colorWidgets;
  }

  Container buildColorWidget(Color color, BuildContext context) {
    var _theme = Theme.of(context);
    return Container(
        width: 35,
        height: 35,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(22),
          ),
          border: widget.selectedColors.contains(color)
              ? Border.all(color: _theme.colorScheme.secondary)
              : null,
        ),
        padding: EdgeInsets.all(4),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(18),
              ),
              border: Border.all(color: _theme.primaryColorLight),
              color: color),
        ));
  }

  void updateSelectedColors(Color color) {
    if (selectedColors!.contains(color)) {
      selectedColors!.remove(color);
    } else {
      selectedColors!.add(color);
    }
    setState(() {});
    widget.onClick(selectedColors!);
  }
}
