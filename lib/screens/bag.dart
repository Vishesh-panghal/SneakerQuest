// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:SneakerQuest/Data/text_content.dart';

class ShoeBagPage extends StatefulWidget {
  const ShoeBagPage({super.key});

  @override
  State<ShoeBagPage> createState() => _ShoeBagPageState();
}

class _ShoeBagPageState extends State<ShoeBagPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber.shade400,
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //----------------Cart--------------------//
              SizedBox(height: 20),
              Container(
                margin: EdgeInsets.only(left: 15),
                child: Text(
                  'Cart',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              //---------------Quote-------------------------//
              Text(
                'Feel the Air. . .',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  wordSpacing: 2,
                  // letterSpacing: 1,
                ),
              ),
              SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 5),
                      height: 150,
                      width: 200,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        // border: Border.all(width: 0.3),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      //---------------Base Icon-------------------//
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Opacity(
                            opacity: 0.7,
                            child: Image.asset(ImageConstants.baseIc),
                          ),
                          //----------Shoe Image------------------//
                          Image.asset(
                            'assets/Images/nike_store/Newest/lis4.png',
                            height: 70,
                          ),
                        ],
                      ),
                    ),
                    //-----------About shoe-------------------------//
                    Padding(
                      padding: const EdgeInsets.only(right: 42.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Shoe Name',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'price',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'color',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
