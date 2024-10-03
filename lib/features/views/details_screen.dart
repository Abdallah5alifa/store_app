import 'package:flutter/material.dart';
import 'package:store_app/core/constants.dart';
import 'package:store_app/features/models/product.dart';
import 'package:store_app/features/views/widgets/details_widgets.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.product});

    final Product product;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPraimaryColor,
      appBar: AppBarDetals(context),
      body:  DetailsBody(product: product,),
    );
  }
}