// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_final_fields

import 'package:SneakerQuest/cubit/fav_state.dart';
import 'package:SneakerQuest/cubit/favourite_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class ShoeBagPage extends StatefulWidget {
  const ShoeBagPage({super.key});

  @override
  State<ShoeBagPage> createState() => _ShoeBagPageState();
}

class _ShoeBagPageState extends State<ShoeBagPage>
    with SingleTickerProviderStateMixin {
  bool isShipped = false;
  double _subTotal = 0.0;
  var _tax = 0.0;
  var _total = 0.0;

  late AnimationController buyBtnController;
  @override
  void initState() {
    buyBtnController = AnimationController(vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.amber.shade400,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
            ),
            child: SafeArea(
              bottom: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //----------------Cart------------------//
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
                  Container(
                    height: 400,
                    decoration: BoxDecoration(
                      color: Colors.amber.shade400,
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: BlocBuilder<FavouriteCubitCubit, FavDB>(
                      builder: (context, state) {
                        for(var item in state.fav){
                          _subTotal += double.parse(item.price!);
                        }
                        return ListView.builder(
                          itemCount: state.fav.length,
                          itemBuilder: (context, index) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      '${state.fav[index].imgAdd}',
                                      height: 70,
                                      width: 180,
                                    ),
                                    SizedBox(width: 75),
                                    Column(
                                      children: [
                                        Text(
                                          '${state.fav[index].name}',
                                          style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          '${state.fav[index].style}',
                                          style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: 12,
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              '  \u{20B9}${state.fav[index].price}',
                                              style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(width: 20),
                                            Icon(
                                              Icons.delete,
                                              color: Colors.red,
                                            ),
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                ),
                                Divider(thickness: 2),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        'Apply Coupon: ',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 5),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: TextField(
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),

                  SizedBox(height: 25),
                  Divider(thickness: 1.2),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                      ),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 38.0,
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'SubTotal:',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '$_subTotal',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Tax:',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '$_tax',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total:',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              ' $_total',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                  // SizedBox(height: 70),
                ],
              ),
            ),
          ),
          Container(
            height: 80,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
            ),
            child: isShipped
                ? LottieBuilder.asset(
                    'assets/lottie/ic_shipp.json',
                    onLoaded: (p0) {
                      print('Lottie');
                      buyBtnController.duration = p0.duration;
                      buyBtnController.forward();
                      isShipped = !isShipped;
                      setState(() {});
                    },height: 60,
                  )
                : TextButton(
                    onPressed: () {
                      isShipped = !isShipped;
                      print(isShipped);
                      setState(() {});
                    },
                    child: Text(
                      'Continue',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
