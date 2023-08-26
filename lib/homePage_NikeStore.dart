// ignore_for_file: file_names

import 'package:flutter/material.dart';

import 'Data/constants.dart';
import 'Data/text_content.dart';
import 'about_Shoe/about_page.dart';
import 'authentication/login.dart';

class NikeHomePage extends StatefulWidget {
  const NikeHomePage({super.key});

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
    return SafeArea(
      bottom: false,
      child: Scaffold(
        //-------------------Background Color----------------//
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
          constraints: const BoxConstraints.expand(),
          decoration: BoxDecoration(color: Colors.grey.shade100),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 50),
                //---------------------Top Button------------------//
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromARGB(66, 0, 0, 0),
                            blurRadius: 12,
                          ),
                        ],
                      ),
                      child: const Icon(Icons.dehaze),
                    ),
                    InkWell(
                      onTap: () async {
                        Navigator.pushReplacement(context, MaterialPageRoute(
                          builder: (context) {
                            return LoginPage();
                          },
                        ));
                      },
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromARGB(17, 0, 0, 0),
                              blurRadius: 12,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
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
                const SizedBox(height: 30),
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
                const SizedBox(height: 50),
                //---------------New shoe-----------------------//
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Newest nike shoes',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'See more',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                              color: Colors.amber),
                        ),
                        Icon(
                          Icons.arrow_right,
                          size: 28,
                          color: Colors.amber,
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 20),
                //--------------New Shoe ListView--------------------//
                SizedBox(
                  height: 230,
                  width: 380,
                  child: ListView.builder(
                    // itemCount: Constants.newShoes.length,
                    itemCount: newShoe.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      //--------Main Row Text and Image-----------//
                      return Row(
                        children: [
                          Container(
                            height: 200,
                            width: 380,
                            decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(12)),
                            //---------Text Column----------------//
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Stack(
                                  alignment: Alignment.centerRight,
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 15),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              const Text(
                                                'Nike',
                                                style: TextStyle(
                                                  fontFamily: 'Poppins',
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                newShoe[index].name!,
                                                style: const TextStyle(
                                                    fontFamily: 'Poppins',
                                                    fontSize: 22,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.amber),
                                              ),
                                              const SizedBox(height: 20),
                                              ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        const Color(
                                                            0xfff6d365)),
                                                onPressed: () {},
                                                child: const Row(
                                                  children: [
                                                    Text(
                                                      'Add to bag',
                                                      style: TextStyle(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.white),
                                                    ),
                                                    Icon(
                                                      Icons
                                                          .shopping_bag_outlined,
                                                      size: 18,
                                                      color: Colors.white,
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.centerRight,
                                          child: Image.asset(
                                            ImageConstants.baseIc,
                                            height: 70,
                                          ),
                                        ),
                                      ],
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                          builder: (context) {
                                            return AboutNikeShoePage(index);
                                          },
                                        ));
                                      },
                                      child: AnimatedBuilder(
                                        animation: shoeController,
                                        builder: (context, child) {
                                          return Transform.rotate(
                                            angle: 12.4,
                                            child: child,
                                          );
                                        },
                                        child: Image.asset(
                                          newShoe[index].imgAdd!,
                                          height: 90,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                //-----------------Stack--------------//
                              ],
                            ),
                          ),
                          const SizedBox(width: 30),
                        ],
                      );
                    },
                    //------------------ListView----------------------//
                  ),
                ),
                const SizedBox(height: 40),
                //------------------Popular Shoe-------------------//
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Popular shoes',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'See more',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                              color: Colors.amber),
                        ),
                        Icon(
                          Icons.arrow_right,
                          size: 28,
                          color: Colors.amber,
                        ),
                      ],
                    )
                  ],
                ),
                //-------------- Popular ListView-------------------//
                SizedBox(
                  height: 230,
                  width: 380,
                  child: ListView.builder(
                    itemCount: popularShoe.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          Container(
                            height: 200,
                            width: 380,
                            decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(12)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Stack(
                                  alignment: Alignment.centerRight,
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 15),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              //------Shoe Name-------//
                                              const Text(
                                                'Nike',
                                                style: TextStyle(
                                                  fontFamily: 'Poppins',
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                popularShoe[index].name!,
                                                style: const TextStyle(
                                                    fontFamily: 'Poppins',
                                                    fontSize: 22,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.amber),
                                              ),
                                              const SizedBox(height: 20),
                                              //---Popular shoe btn---//
                                              ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        const Color(
                                                            0xfff6d365)),
                                                onPressed: () {},
                                                child: const Row(
                                                  children: [
                                                    Text(
                                                      'Add to bag',
                                                      style: TextStyle(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.white),
                                                    ),
                                                    Icon(
                                                      Icons
                                                          .shopping_bag_outlined,
                                                      size: 18,
                                                      color: Colors.white,
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        //----Base Nike icon---//
                                        Container(
                                          alignment: Alignment.centerRight,
                                          child: Image.asset(
                                            ImageConstants.baseIc,
                                            height: 70,
                                          ),
                                        ),
                                      ],
                                    ),
                                    //---Popular Soe Img-----//
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                          builder: (context) {
                                            return AboutNikeShoePage(
                                              index,
                                              isPopular: true,
                                            );
                                          },
                                        ));
                                      },
                                      child: AnimatedBuilder(
                                        animation: shoeController,
                                        builder: (context, child) {
                                          return Transform.rotate(
                                            angle: 12.4,
                                            child: child,
                                          );
                                        },
                                        child: Image.asset(
                                          popularShoe[index].imgAdd!,
                                          height: 90,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 30),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
