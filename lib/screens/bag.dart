// ignore_for_file: no_leading_underscores_for_local_identifiers, must_be_immutable

import 'package:SneakerQuest/Data/text_content.dart';
import 'package:SneakerQuest/cubit/fav_state.dart';
import 'package:SneakerQuest/cubit/favourite_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class ShoeBagPage extends StatefulWidget {
  var shoeSize = '';
  ShoeBagPage({super.key, required this.shoeSize});

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
              borderRadius: const BorderRadius.only(
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
                  const SizedBox(height: 20),
                  Container(
                    margin: const EdgeInsets.only(left: 15),
                    child: const Text(
                      'Cart',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  //---------------Quote-------------------------//
                  const Text(
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
                  const SizedBox(height: 50),
                  //---------------------Shoe list----------------//
                  Container(
                      height: 400,
                      decoration: BoxDecoration(color: Colors.amber.shade400),
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Shoe_list_cart()),
                  //--------------------Coupon area-----------------//
                  const Row(
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
                          padding: EdgeInsets.symmetric(
                            horizontal: 4.0,
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),

                  const SizedBox(height: 25),
                  const Divider(thickness: 1.2),
                  //--------------------Amount cart--------------------//
                  Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 38.0,
                    ),
                    child: Amount_cart(),
                  ), // SizedBox(height: 70),
                ],
              ),
            ),
          ),
          //------------------Continue button----------------------//
          StatefulBuilder(
            builder: (context, setState) {
              return Container(
                height: 80,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                ),
                child: isShipped
                    ? LottieBuilder.asset(
                        'assets/lottie/ic_packing.json',
                        onLoaded: (p0) {
                          buyBtnController.duration = p0.duration;
                          buyBtnController.forward();
                          buyBtnController.addStatusListener((status) {
                            if (status == AnimationStatus.completed) {
                              setState(() {
                                isShipped = false;
                                // Navigator.pushReplacement(
                                //     context,
                                //     MaterialPageRoute(
                                //       builder: (context) => NikeHomePage(),
                                //     ));
                              });
                            }
                          });
                        },
                        height: 60,
                        repeat: false,
                      )
                    : TextButton(
                        onPressed: () {
                          isShipped = !isShipped;
                          setState(() {});
                        },
                        child: const Text(
                          'Continue',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
              );
            },
          ),
        ],
      ),
    );
  }

//-------------------------Amount cart🔻-----------------------------//
  BlocBuilder<FavouriteCubitCubit, FavDB> Amount_cart() {
    return BlocBuilder<FavouriteCubitCubit, FavDB>(
      builder: (context, state) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'SubTotal:',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  '$_subTotal',
                  style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'other:',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '{Estimated Delivery, Handling & Tax}',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 10,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Text(
                  '$_tax',
                  style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total:',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  ' $_total',
                  style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        );
      },
    );
  }

//-------------------------Shoe list🔻-----------------------------//
  BlocBuilder<FavouriteCubitCubit, FavDB> Shoe_list_cart() {
    return BlocBuilder<FavouriteCubitCubit, FavDB>(
      builder: (context, state) {
        for (var item in state.fav) {
          _subTotal += double.tryParse(item.price ?? '0.0') ?? 0.0;
        }
        _tax = _subTotal * 4 / 100;
        _total = _subTotal + _tax;

        return ListView.builder(
          itemCount: state.fav.length,
          itemBuilder: (context, index) {
            var shoeItem = state.fav[index];

            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset(
                      state.fav[index].imgAdd ?? ImageConstants.baseIc,
                      height: 70,
                      width: 180,
                    ),
                    const SizedBox(width: 75),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          state.fav[index].name ?? 'Shoe name',
                          style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Size:${widget.shoeSize}',
                          style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 13,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              '  \u{20B9}${shoeItem.price}',
                              style: const TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 20),
                            InkWell(
                              onTap: () {
                                context
                                    .read<FavouriteCubitCubit>()
                                    .removeFromFav(shoe: shoeItem);
                              },
                              child: const Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
                const Divider(thickness: 2),
                const SizedBox(height: 5),
              ],
            );
          },
        );
      },
    );
  }
}
