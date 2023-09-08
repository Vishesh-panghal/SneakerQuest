// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import '../Data/text_content.dart';
import 'homepage_screens/nike_shoe_page.dart';

class NikeHomePage extends StatefulWidget {
  String? name = '';
  NikeHomePage({super.key, this.name});

  @override
  State<NikeHomePage> createState() => _NikeHomePageState();
}

class _NikeHomePageState extends State<NikeHomePage>
    with TickerProviderStateMixin {
  //-------------------Animation Controller----------------//
  late AnimationController shoeController;

  @override
  //----------------------init State-----------------------//
  void initState() {
    shoeController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    shoeController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //-------------------Background Color----------------//
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
        constraints: const BoxConstraints.expand(),
        decoration: BoxDecoration(color: Colors.grey.shade100),
        child: SingleChildScrollView(
          child: SafeArea(
            bottom: false,
            child: Column(
              children: [
                // const SizedBox(height: 50),
                //---------------------Top Button------------------//
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      'Welcome',
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      widget.name ?? 'User',
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.amber.shade400,
                      ),
                    ),
                    const SizedBox(width: 130),
                    InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return Container();
                          },
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.only(right: 5.0),
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Icon(Icons.dehaze),
                      ),
                    ),
                  ],
                ),
                const Divider(thickness: 1),
                const SizedBox(height: 25),
                //---------------------Search Menu---------------//
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(12)),
                        height: 48,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Search your shoe..',
                            hintStyle: const TextStyle(
                              color: Colors.grey,
                            ),
                            prefixIcon: const Icon(Icons.search),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 48,
                      width: 48,
                      margin: const EdgeInsets.only(left: 10),
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 246, 212, 101),
                          borderRadius: BorderRadius.horizontal(
                              left: Radius.elliptical(8, 12),
                              right: Radius.elliptical(8, 12))),
                      child: const Icon(
                        Icons.sort,
                        size: 40,
                        color: Colors.black,
                      ),
                    )
                  ],
                ),

                const SizedBox(height: 25),
                const Divider(thickness: 1),
                const SizedBox(height: 5),
                //------------------Pamplate--------------------//
                SizedBox(
                  height: 150,
                  width: 400,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      'assets/Images/more_images/quote.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                //--------------Slider to brand-----------------//
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(
                      Icons.arrow_left,
                      color: Colors.grey,
                      size: 38,
                    ),
                    const SizedBox(width: 10),
                    Container(
                      height: 35,
                      width: 35,
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(8)),
                      child: Image.network(ImageConstants.pumaIc),
                    ),
                    const SizedBox(width: 40),
                    Container(
                      height: 65,
                      width: 65,
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        color: Colors.amber.shade300,
                        border: const Border.symmetric(
                            horizontal: BorderSide(width: 0.4),
                            vertical: BorderSide(width: 1)),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Image.network(ImageConstants.nikeIc),
                    ),
                    const SizedBox(width: 40),
                    Container(
                      height: 35,
                      width: 35,
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(8)),
                      child: Image.network(ImageConstants.adiIc),
                    ),
                    const SizedBox(width: 10),
                    const Icon(
                      Icons.arrow_right,
                      color: Colors.grey,
                      size: 38,
                    ),
                  ],
                ),
                //--------------New Shoe ListView--------------------//
                New_Shoe_ListView(shoeController: shoeController),
                //-------------- Popular ListView-------------------//
                Popular_Shoe_ListView(shoeController: shoeController),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
