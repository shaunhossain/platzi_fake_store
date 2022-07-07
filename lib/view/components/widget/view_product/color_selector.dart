import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:platzi_fake_store/utils/size_config.dart';
import 'package:platzi_fake_store/view/page/view_product_screen/view_product_controller/view_product_controller.dart';

class ColorSelector extends StatelessWidget {
  final List<Color> availableColors;

  const ColorSelector({Key? key, required this.availableColors})
      : super(key: key);

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
    for (var i = 0; i < availableColors.length; i++) {
      colorWidgets.add(
        InkWell(
          onTap: (() {
            Get.find<ViewProductController>()
                .selectProductColor(availableColors[i]);
          }),
          child: buildColorWidget(availableColors[i], context),
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
          border: Get.find<ViewProductController>().selectedColor == color
              ? Border.all(color: _theme.colorScheme.secondary)
              : null,
        ),
        padding: const EdgeInsets.all(4),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(18),
              ),
              border: Border.all(color: _theme.primaryColorLight),
              color: color),
        ));
  }
}
