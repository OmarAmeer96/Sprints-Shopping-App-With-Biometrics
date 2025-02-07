import 'package:flutter/material.dart';
import 'package:sprint_shopping_app_with_bioetrics/core/theming/styles.dart';

class CustomHomeBannerButton extends StatelessWidget {
  const CustomHomeBannerButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
          side: const BorderSide(
            width: 1.04,
            color: Color(0xFF2d3036),
          ),
        ),
        shadowColor: const Color(0x66000000),
        elevation: 10,
        backgroundColor: Color(0xFF515662),
      ).copyWith(
        foregroundColor: WidgetStateProperty.all(Colors.white),
      ),
      child: Text(
        'Explore now',
        style: Styles.font12HomeBanner,
      ),
    );
  }
}
