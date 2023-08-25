// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors,, non_constant_identifier_names, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:nike_store/about_Shoe/bag.dart';

import '../Data/constants.dart';

class AboutNikeShoePage extends StatefulWidget {
  int index;
  bool isPopular;
  @override
  State<AboutNikeShoePage> createState() => _AboutNikeShoePageState();
  AboutNikeShoePage(this.index, {this.isPopular = false});
}

class _AboutNikeShoePageState extends State<AboutNikeShoePage>
    with TickerProviderStateMixin {
  late AnimationController shoeController;
  @override
  void initState() {
    shoeController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200))
          ..forward();
    super.initState();
  }

  List shoeSize = ['36', '37', '38', '39', '40', '41', '42'];
  String isSelectedSize = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 12, top: 12, bottom: 12),
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(color: Colors.grey.shade100),
        child: Column(
          children: [
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.zero,
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
                Container(
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
              ],
            ),
            SizedBox(height: 40),
            //---------------- Menu & Profile-----------------------//
            Column(
              children: [
                Row(
                  children: [
                    Text(
                      widget.isPopular
                          ? Constants.popularShoes[widget.index]['name']
                          : Constants.newShoes[widget.index]['name'],
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    SizedBox(width: 10),
                    Text(
                      'Feel the Air',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 15,
                        color: Colors.grey,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            //-----------------------Shoe name-----------------------//
            SizedBox(height: 40),
            Stack(
              children: [
                Container(
                  height: 250,
                  // width: 400,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(255, 229, 193, 72),
                          Color.fromARGB(255, 228, 164, 45),
                        ],
                        begin: Alignment.bottomLeft,
                        end: Alignment.centerRight,
                      ),
                      borderRadius: BorderRadius.circular(12)),
                  child: Opacity(
                    opacity: .3,
                    child:
                        Image.asset('assets/Images/more_images/base_icon.png'),
                  ),
                ),
                AnimatedBuilder(
                  animation: shoeController,
                  builder: (context, child) {
                    return Transform.rotate(
                      angle: 12,
                      child: child,
                    );
                  },
                  child: widget.isPopular
                      ? Image.asset(
                          Constants.popularShoes[widget.index]['imgAdd'])
                      : Image.asset(Constants.newShoes[widget.index]['imgAdd']),
                )
              ],
            ),
            SizedBox(height: 60),
            //-----------------Shoe Container------------------//
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  // color: Colors.green,
                  height: 500,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 30),
                      Text(
                        'Size',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 70,
                        child: GridView.builder(
                          padding: EdgeInsets.zero,
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: shoeSize.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 7,
                                  mainAxisSpacing: 3,
                                  crossAxisSpacing: 3),
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                isSelectedSize = shoeSize[index];
                                setState(() {});
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  color: isSelectedSize == shoeSize[index]
                                      ? Colors.black54
                                      : Colors.grey.shade300,
                                  border: isSelectedSize == shoeSize[index]
                                      ? Border.all(
                                          width: 2, color: Colors.brown)
                                      : null,
                                  borderRadius: BorderRadius.horizontal(
                                      left: Radius.circular(12),
                                      right: Radius.circular(8)),
                                ),
                                child: Text(
                                  '${shoeSize[index]}',
                                  style: TextStyle(
                                      color: isSelectedSize == shoeSize[index]
                                          ? Colors.white
                                          : Colors.black),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      //---------------------Shoe size------------------//
                      Text(
                        widget.isPopular
                            ? Constants.popularShoes[widget.index]['name']
                            : Constants.newShoes[widget.index]['name'],
                        style: TextStyle(fontFamily: 'Poppins'),
                      ),
                      //--------------------About shoe-----------------//
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            'Color Selection: ',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            getColor(Constants.newShoes[widget.index]['name']),
                            style: TextStyle(fontFamily: 'Poppins'),
                          ),
                        ],
                      ),
                      //----------------Color selection----------------//
                      Row(
                        children: [
                          Text(
                            'Style: ',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            getStyle(Constants.newShoes[widget.index]['name']),
                            style: TextStyle(fontFamily: 'Poppins'),
                          ),
                        ],
                      ),
                      SizedBox(height: 40),
                      //-------------------Style---------------------//
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.amber.shade400),
                            onPressed: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (context) => Container(
                                  height: 200,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Item added to bag!',
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22,
                                        ),
                                      ),
                                      Divider(),
                                      Text('Want to go to bag?'),
                                      SizedBox(height: 5),
                                      ElevatedButton(onPressed: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => ShoeBagPage(),));
                                      }, child: Text('Bag',style: TextStyle(fontFamily: 'Poppins'),))
                                    ],
                                  ),
                                ),
                              );
                            },
                            child: Text(
                              'Add to bag',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white),
                            onPressed: () {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text('Added to Favourite '),
                                backgroundColor: Colors.green,
                              ));
                            },
                            child: Text(
                              'Favourite',
                              style: TextStyle(
                                  fontFamily: 'Poppins', color: Colors.black),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  String getAbout(String type) {
    Map<String, String> shoeDescriptions = {
      'Alphafly 2':
          "Once you take a few strides in the Nike Air Zoom Alphafly NEXT% 2, you'll never look at your favorite pair of old racing shoes the same way again. These rocket ships are made to help shave precious time off your personal records without surrendering the foundation you need to go the full distance. A thick, lightweight support system marries the 2 worlds of comfort and speed in holy running matrimony. Enjoy the greatest energy return of all our racing shoes while you chase your personal bests.",
      'Airmax Alpha':
          "Finish your last rep with power and rack it with a roar that stuns the gym floor in the Nike Air Max Alpha Trainer 5. The Max Air cushioning offers comfortable stability for lifting whether it's a light or heavy day. A wide, flat base gives you enhanced stability and grip for all kinds of tough workouts without sacrificing style, as you roam from station to station and set to set.",
      'Freak 4':
          "Giannis is an incessant storm of stamina and skill that keeps coming at opponents for 4 quarters or more. The forward-thinking design of his latest signature shoe helps propel you down the court in a lightweight fit that moves with you. It can handle quick changes in direction on both sides of the floor, giving you side-to-side stability and multi-directional traction as you Euro step to the hoop. This special colorway is inspired by the Greek Freak's towering power and his ability to bring his inner fire to the floor night in and night out.",
      'Cosmic Unity 2':
          "Celebrate the love and joy of the game with the Nike Cosmic Unity 2. Made from at least 20% recycled content by weight, it provides enhanced responsiveness and support. This shoe will help keep you fresh and secure without overloading it with extra grams, so that you can focus on locking down the perimeter defensively or starting the fast break after a rebound.",
      'Precision 6':
          "Hoof it from the bottom of the trail to the top, and handle winding paths, rolling hills, tricky hairpin turns and everything in between in the Nike Precision 6. With an abundance of rugged traction, cushioned responsiveness and trusted containment to help keep you upright, it's made for tough trail runs, the ones with limitless miles and gnarly terrain that are too enticing to turn down."
    };

    return shoeDescriptions[type] ?? 'Not Found';
  }

  String getColor(String type) {
    Map<String, String> shoeColor = {
      'Alphafly 2': "Hyper Pink/Laser Orange/White/Black",
      'Airmax Alpha': "Blue/Dark Bule/Golden",
      'Freak 4': "Indigo Haze/Blue Tint/Baltic Blue",
      'Cosmic Unity 2': "Coconut Milk/Summit White/\nUniversity Red/Team Red",
      'Precision 6': "White/Midnight Navy/Yellow"
    };

    return shoeColor[type] ?? 'Not Found';
  }

  String getStyle(String type) {
    Map<String, String> shoeStyle = {
      'Alphafly 2': "DN3555-600",
      'Airmax Alpha': "DM0829-001",
      'Freak 4': "DJ6149-500",
      'Cosmic Unity 2': "DH1537-102",
      'Precision 6': "CD7069-004"
    };

    return shoeStyle[type] ?? 'Not Found';
  }
}
