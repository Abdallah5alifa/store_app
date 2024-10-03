import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:store_app/core/constants.dart';
import 'package:store_app/features/models/product.dart';
import 'package:store_app/features/views/widgets/color_dot.dart';

class DetailsBody extends StatelessWidget {
  const DetailsBody({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          padding:const EdgeInsets.symmetric(horizontal: kDefaultPadding * 1.5),
          decoration:const BoxDecoration(
            color: kBackgroundColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50),
            )
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: ProductImage(
                  size: size,
                  image: product.image,
                ),
              ),
             const Padding(
                padding:  EdgeInsets.symmetric(horizontal: kDefaultPadding ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ColorDot(
                      fillColor: kTextLightColor,
                      isSelected: true,
                    ),
                    ColorDot(
                      fillColor: Colors.blue,
                      isSelected: false,
                    ),
                    ColorDot(
                      fillColor: Colors.red,
                      isSelected: false,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
                child: Text(product.title,
                style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
               Text('السعر: \$ ${product.price}',
              style: const TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.w600,
                color: kSacondaryColor
              ),
              ),
              const SizedBox(height: kDefaultPadding,)
            ],
          ),
        ),
         Container(
          margin: const EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
          padding: const EdgeInsets.symmetric(
            horizontal: kDefaultPadding * 1.5,
            vertical: kDefaultPadding / 2,
          ),
          child:  Text(product.description,
          style:const TextStyle(color: Colors.white,
          fontSize: 19,
          ),
          ),
        )
      ],
    );
  }
}

class ProductImage extends StatelessWidget {
  const ProductImage({
    super.key,
    required this.size, 
    required this.image,
  });

  final Size size;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.symmetric(vertical: kPagingTouchSlop),
      height: size.width *0.8,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: size.height *0.7,
            width: size.width *0.7,
            decoration:const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle
            ),
          ),
          Image.asset(
          image,
          height: size.width * 0.75,
          width: size.width * 0.75,
          fit: BoxFit.cover,
          )
        ],
      ),
    );
  }
}



  AppBar AppBarDetals(BuildContext context) {
    return AppBar(
      backgroundColor: kBackgroundColor,
      elevation: 0,
      leading: IconButton(
        padding: const EdgeInsets.only(right: kDefaultPadding),
        onPressed: (){
          Navigator.pop(context);
        }, 
        icon: const Icon(
          Icons.arrow_back,
          color: kPraimaryColor,
        ),
        ),
        centerTitle: false,
        title: Text('رجوع',
        style: Theme.of(context).textTheme.bodyLarge,),
    );
  }
