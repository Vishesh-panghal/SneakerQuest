// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, use_build_context_synchronously, unused_element
import 'package:flutter/material.dart';

import 'Data/constants.dart';
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
    shoeController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
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
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 20),
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(color: Colors.grey.shade100),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 50),
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
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(66, 0, 0, 0),
                            blurRadius: 12,
                          ),
                        ],
                      ),
                      child: Icon(Icons.dehaze),
                    ),
                    InkWell(
                      onTap: () async{
                        
                       
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                          return LoginPage();
                        },));
                      },
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
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
                SizedBox(height: 20),
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
                            hintStyle: TextStyle(
                              color: Colors.grey,
                            ),
                            prefixIcon: Icon(Icons.search),
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
                      margin: EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 246, 212, 101),
                          borderRadius: BorderRadius.horizontal(
                              left: Radius.elliptical(8, 12),
                              right: Radius.elliptical(8, 12))),
                      child: Icon(
                        Icons.sort,
                        size: 40,
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 30),
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
                SizedBox(height: 40),
                //--------------Slider to brand-----------------//
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.arrow_left,
                      color: Colors.grey,
                      size: 38,
                    ),
                    SizedBox(width: 10),
                    Container(
                      height: 35,
                      width: 35,
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(8)),
                      child: Image.network(
                          'https://cdn.icon-icons.com/icons2/3914/PNG/512/puma_logo_icon_248754.png'),
                    ),
                    SizedBox(width: 40),
                    Container(
                      height: 65,
                      width: 65,
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        color: Colors.amber.shade300,
                        border: Border.symmetric(
                            horizontal: BorderSide(width: 0.4),
                            vertical: BorderSide(width: 1)),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Image.network(
                        'https://img.freepik.com/free-icon/nike_318-565950.jpg',
                      ),
                    ),
                    SizedBox(width: 40),
                    Container(
                      height: 35,
                      width: 35,
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(8)),
                      child: Image.network(
                          'https://cdn-icons-png.flaticon.com/512/731/731962.png'),
                    ),
                    SizedBox(width: 10),
                    Icon(
                      Icons.arrow_right,
                      color: Colors.grey,
                      size: 38,
                    ),
                  ],
                ),
                SizedBox(height: 50),
                //---------------New shoe-----------------------//
                Row(
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
                SizedBox(height: 20),
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
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 15),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Text(
                                                'Nike',
                                                style: TextStyle(
                                                  fontFamily: 'Poppins',
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                newShoe[index].name!,
                                                style: TextStyle(
                                                    fontFamily: 'Poppins',
                                                    fontSize: 22,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.amber),
                                              ),
                                              SizedBox(height: 20),
                                              ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        Color(0xfff6d365)),
                                                onPressed: () {
                                              
                                                },
                                                child: Row(
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
                                            'assets/Images/more_images/base_icon.png',
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
                          SizedBox(width: 30),
                        ],
                      );
                    },
                    //------------------ListView----------------------//
                  ),
                ),
                SizedBox(height: 40),
                //------------------Popular Shoe-------------------//
                Row(
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
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 15),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              //------Shoe Name-------//
                                              Text(
                                                'Nike',
                                                style: TextStyle(
                                                  fontFamily: 'Poppins',
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                popularShoe[index].name!,
                                                style: TextStyle(
                                                    fontFamily: 'Poppins',
                                                    fontSize: 22,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.amber),
                                              ),
                                              SizedBox(height: 20),
                                              //---Popular shoe btn---//
                                              ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        Color(0xfff6d365)),
                                                onPressed: () {
                                                  print('object2');
                                                },
                                                child: Row(
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
                                            'assets/Images/more_images/base_icon.png',
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
                          SizedBox(width: 30),
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
