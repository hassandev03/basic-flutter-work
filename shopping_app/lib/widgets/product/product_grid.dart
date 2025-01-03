import 'package:flutter/material.dart';
import 'package:shopping_app/data/products_data.dart';
import 'package:shopping_app/widgets/product/grid_product_item.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({super.key});

  @override
  Widget build(BuildContext context) {
    print(productsData.length);
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 2,
        mainAxisSpacing: 2,
      ),
      itemCount: productsData.length,
      itemBuilder: (context, index) => GridProductItem(
        product: productsData[index],
      ),
      physics: const AlwaysScrollableScrollPhysics(),
    );
  }
}
