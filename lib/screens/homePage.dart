// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Data/text_content.dart';
import 'homepage_screens/nike_shoe_page.dart';

class NikeHomePage extends StatefulWidget {
  const NikeHomePage({super.key});

  @override
  State<NikeHomePage> createState() => _NikeHomePageState();
}

class _NikeHomePageState extends State<NikeHomePage>
    with TickerProviderStateMixin {
  //-------------------Animation Controller----------------//
  late AnimationController shoeController;
  String storedFirstName = 'user';

  @override
  //----------------------init State-----------------------//
  void initState() {
    shoeController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    shoeController.forward();
    getUserName();
    super.initState();
  }

  Future getUserName() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
     storedFirstName = sharedPreferences.getString('firstName')!;
     setState(() {
       
     });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                //---------------------Top Button------------------//
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome',
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: size.width * .06,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    SizedBox(width: size.width * 0.02),
                    Text(
                      storedFirstName,
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: size.width * .06,
                        fontWeight: FontWeight.bold,
                        color: Colors.amber.shade400,
                      ),
                    ),
                    SizedBox(width: size.width * 0.269),
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
                SizedBox(height: size.width * 0.04),
                //---------------------Search Menu---------------//
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(12)),
                        height: size.width * .13,
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
                      height: size.height * .05,
                      width: size.width * .1,
                      margin: const EdgeInsets.only(left: 10),
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 246, 212, 101),
                          borderRadius: BorderRadius.horizontal(
                              left: Radius.elliptical(8, 12),
                              right: Radius.elliptical(8, 12))),
                      child: Icon(
                        Icons.sort,
                        size: size.height * .035,
                        color: Colors.black,
                      ),
                    )
                  ],
                ),

                SizedBox(height: size.width * 0.04),
                const Divider(thickness: 1),
                SizedBox(height: size.width * 0.04),
                //------------------Pamplate--------------------//
                SizedBox(
                  height: size.height * .15,
                  width: size.width * 1,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      'assets/Images/more_images/quote.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(height: size.width * 0.1),
                //--------------Slider to brand-----------------//
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.arrow_left,
                      color: Colors.grey,
                      size: size.height * .035,
                    ),
                    Container(
                      height: size.height * .07,
                      width: size.width * .12,
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(8)),
                      child: Image.network(
                        ImageConstants.pumaIc,
                        height: size.height * 1,
                      ),
                    ),
                    SizedBox(width: size.width * .1),
                    Container(
                      height: size.height * .07,
                      width: size.width * .12,
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
                    SizedBox(width: size.width * .1),
                    Container(
                      height: size.height * .07,
                      width: size.width * .12,
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(8)),
                      child: Image.network(ImageConstants.adiIc),
                    ),
                    Icon(
                      Icons.arrow_right,
                      color: Colors.grey,
                      size: size.height * .035,
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
