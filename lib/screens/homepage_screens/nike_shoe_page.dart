// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

import '../../Data/shoe_constants.dart';
import '../about_page.dart';
import 'customized_widgets.dart';

class New_Shoe_ListView extends StatelessWidget {
  const New_Shoe_ListView({
    super.key,
    required this.shoeController,
  });

  final AnimationController shoeController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 50),
        const CustomRow(title: 'New shoes', linkText: 'See more'),
        SizedBox(
          height: 230,
          width: 380,
          child: ListView.builder(
            // itemCount: Constants.NikenewShoes.length,
            itemCount: NikenewShoe.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              //--------Main Row Text and Image-----------//
              return Row(
                children: [
                  HomepageShoeCard(
                    shoeName: NikenewShoe[index].name!,
                    shoeImageUrl: NikenewShoe[index].imgAdd!,
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return AboutNikeShoePage(index);
                        },
                      ));
                    },
                  ),
                  const SizedBox(width: 30),
                ],
              );
            },
            //------------------ListView----------------------//
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}

class Popular_Shoe_ListView extends StatelessWidget {
  const Popular_Shoe_ListView({
    super.key,
    required this.shoeController,
  });

  final AnimationController shoeController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomRow(title: 'Popular shoes', linkText: 'See more'),
        SizedBox(
          height: 230,
          width: 380,
          child: ListView.builder(
            itemCount: NikepopularShoe.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Row(
                children: [
                  HomepageShoeCard(
                    shoeName: NikepopularShoe[index].name!,
                    shoeImageUrl: NikepopularShoe[index].imgAdd!,
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return AboutNikeShoePage(index, isPopular: true);
                        },
                      ));
                    },
                  ),
                  const SizedBox(width: 30),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
