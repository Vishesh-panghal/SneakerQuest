// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:SneakerQuest/Data/constants.dart';
import 'package:SneakerQuest/cubit/fav_state.dart';
import 'package:SneakerQuest/cubit/favourite_cubit.dart';
import 'package:flutter/material.dart';
import 'package:SneakerQuest/Data/text_content.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShoeBagPage extends StatefulWidget {
  const ShoeBagPage({super.key});

  @override
  State<ShoeBagPage> createState() => _ShoeBagPageState();
}

class _ShoeBagPageState extends State<ShoeBagPage> {
  var _subTotal = 0.0;
  var _tax = 0.0;
  var _total = 0.0;
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
                    decoration: BoxDecoration(color: Colors.amber.shade400),
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: BlocBuilder<FavouriteCubitCubit, FavDB>(
                      builder: (context, state) {
                        return ListView.builder(
                          itemCount: state.fav.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: Stack(
                                children: [
                                  Image.asset(
                                    ImageConstants.baseIc,
                                    width: 100,
                                    color: Colors.yellow,
                                  ),
                                  Image.asset(
                                    '${state.fav[index].imgAdd}',
                                    height: 80,
                                  ),
                                ],
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    '${state.fav[index].name}',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black
                                    ),
                                  ),
                                  Text(
                                    '${state.fav[index].style}',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        '${state.fav[index].price}',
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          color: Colors.black
                                        ),
                                      ),
                                      SizedBox(width: 50),
                                      InkWell(
                                        onTap: () {
                                          context
                                              .read<FavouriteCubitCubit>()
                                              .removeFromFav(
                                                shoe: ShoeItem(
                                                  name: state.fav[index].name,
                                                  imgAdd:
                                                      state.fav[index].imgAdd,
                                                  aboutShoe: state
                                                      .fav[index].aboutShoe,
                                                  colorSelection: state
                                                      .fav[index]
                                                      .colorSelection,
                                                  style: state.fav[index].style,
                                                  price: state.fav[index].price
                                                ),
                                              );
                                        },
                                        child: Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
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
            child: TextButton(
              onPressed: () {},
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
