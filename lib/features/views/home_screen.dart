import 'package:flutter/material.dart';
import 'package:store_app/core/constants.dart';
import 'package:store_app/features/views/home_body.dart';
import 'package:store_app/features/views/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: kPraimaryColor,
      appBar: appBarBudy(),
      body:const HomeBody(),
    );
  }

  
}