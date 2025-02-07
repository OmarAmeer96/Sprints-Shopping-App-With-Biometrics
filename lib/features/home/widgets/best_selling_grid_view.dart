import 'package:flutter/material.dart';
import 'package:sprint_shopping_app_with_bioetrics/core/helpers/assets.dart';
import 'package:sprint_shopping_app_with_bioetrics/features/home/widgets/product_item.dart';

class BestSellingGridView extends StatelessWidget {
  const BestSellingGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16.0,
        mainAxisSpacing: 16.0,
      ),
      itemCount: 8,
      itemBuilder: (context, index) {
        return ProductItem(
          image: ImageAssets.camera7,
        );
      },
    );
  }
}
