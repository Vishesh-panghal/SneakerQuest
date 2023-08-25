// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class ShoeBagPage extends StatefulWidget {
  const ShoeBagPage({super.key});

  @override
  State<ShoeBagPage> createState() => _ShoeBagPageState();
}

class _ShoeBagPageState extends State<ShoeBagPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: Column(
          children: [
            Text(
              'Cart',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30),
            Text(
              'Feel the Air',
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 15,
                  fontStyle: FontStyle.italic,
                  color: Colors.grey),
            ),
            SizedBox(height: 50),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 5),
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(width: 0.3),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Opacity(
                          opacity: 0.3,
                          child: Image.asset(
                              'assets/Images/nike_store/base_icon.png')),
                      Image.asset('assets/Images/nike_store/Newest/lis4.png'),
                    ],
                  ),
                ),
                Column(
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
              ],
            )
          ],
        ),
      ),
    );
  }
}
