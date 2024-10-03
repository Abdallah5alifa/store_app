import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:store_app/core/constants.dart';
import 'package:store_app/features/models/product.dart';
import 'package:store_app/features/views/details_screen.dart';

AppBar appBarBudy() {
    return AppBar(
      backgroundColor: kPraimaryColor,
      elevation: 0,
      title: Text(
        'مرحباً بكم بمتجر الالكترزنيات',
      style: GoogleFonts.getFont('Almarai',
      color: kBackgroundColor,
      fontWeight: FontWeight.w700),
      
      ),
      centerTitle: false,
      actions: [
        IconButton(
          color: kBackgroundColor,
        onPressed: (){}, 
        icon:const Icon(Icons.menu),
        ),
      ],
    );
  }


class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key, 
  required this.itemIndex, 
  required this.product, 
  required this.pressIndex});

  final int itemIndex;
  final Product product;
  final int pressIndex;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
                margin:const EdgeInsets.symmetric(
                  horizontal: kDefaultPadding,
                  vertical: kDefaultPadding / 2,
                ),
                height: 190,
                child: InkWell(
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>  DetailsScreen(product: products[pressIndex],)),
                      );
                  },
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Container(
                        height: 166.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(22),
                          color: Colors.white,
                          boxShadow:const [
                            BoxShadow(
                            offset: Offset(0, 15),
                            blurRadius: 25,
                            color: Colors.black12
                          )
                          ]
                        ),
                      ),
                      Positioned(
                        top: 0.0,
                        left: 0.0,
                        child: Container(
                          padding:const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                          height: 160,
                          width: 200,
                          child: Image.asset(
                            product.image,
                          fit: BoxFit.cover,
                          ),
                        ),
                        ),
                        deitalsOfProduct(size, context),
                    ],
                  ),
                ),
              );
  }

  Positioned deitalsOfProduct(Size size, BuildContext context) {
    return Positioned(
                      bottom: 0.0,
                      right: 0.0,
                      child: SizedBox(
                        height: 136.0,
                        width: size.width -200,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Spacer(),
                          Padding(padding:const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                          child: Text(product.title,
                          style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          ),
                          const Spacer(),
                          Padding(padding:const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                          child: Text(product.subTitle,
                          style: Theme.of(context).textTheme.labelLarge,
                          ),
                          ),
                          Padding(padding:const EdgeInsets.all(kDefaultPadding),
                          child: Container(
                            padding:const EdgeInsets.symmetric(
                              horizontal: kDefaultPadding *1.5,
                              vertical: kDefaultPadding /5
                            ),
                            decoration: BoxDecoration(
                              color: kSacondaryColor,
                              borderRadius: BorderRadius.circular(22),
                            ),
                            child: Text('السعر :\$ ${product.price}'),
                          ),
                          )
                        ],
                      ),
                      ),

                      );
  }
}
