import 'package:flutter/material.dart';
import 'package:sprint_shopping_app_with_bioetrics/core/helpers/assets.dart';

class CustomPositionedHomeOverlay extends StatelessWidget {
  const CustomPositionedHomeOverlay({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      child: Image.asset(
        ImageAssets.homeOverlay,
      ),
    );
  }
}
