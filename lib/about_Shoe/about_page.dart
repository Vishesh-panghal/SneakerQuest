// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:nike_store/Data/text_content.dart';
import 'package:nike_store/about_Shoe/bag.dart';

import '../Data/constants.dart';

class AboutNikeShoePage extends StatefulWidget {
  int index;
  bool isPopular;
  @override
  State<AboutNikeShoePage> createState() => _AboutNikeShoePageState();
  AboutNikeShoePage(this.index, {super.key, this.isPopular = false});
}

class _AboutNikeShoePageState extends State<AboutNikeShoePage>
    with TickerProviderStateMixin {
  late AnimationController shoeController;
  @override
  void initState() {
    shoeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    )..forward();
    super.initState();
  }

  List shoeSize = ['36', '37', '38', '39', '40', '41', '42'];
  String isSelectedSize = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(left: 12, top: 12, bottom: 12),
        constraints: const BoxConstraints.expand(),
        decoration: BoxDecoration(color: Colors.grey.shade100),
        child: Column(
          children: [
            const SizedBox(height: 50),
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
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromARGB(66, 0, 0, 0),
                        blurRadius: 12,
                      ),
                    ],
                  ),
                  child: const Icon(Icons.dehaze),
                ),
                Container(
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
              ],
            ),
            const SizedBox(height: 40),
            //---------------- Menu & Profile-----------------------//
            Column(
              children: [
                Row(
                  children: [
                    Text(
                      widget.isPopular
                          ? popularShoe[widget.index].name!
                          : newShoe[widget.index].name!,
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                const Row(
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
            const SizedBox(height: 40),
            Stack(
              children: [
                Container(
                  height: 250,
                  // width: 400,
                  decoration: BoxDecoration(
                      gradient: const LinearGradient(
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
                    child: Image.asset(ImageConstants.baseIc),
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
                      ? Image.asset(popularShoe[widget.index].imgAdd!)
                      : Image.asset(
                          newShoe[widget.index].aboutShoe!,
                        ),
                )
              ],
            ),
            const SizedBox(height: 60),
            //-----------------Shoe Container------------------//
            Expanded(
              child: SingleChildScrollView(
                child: SizedBox(
                  height: 500,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 30),
                      const Text(
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
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: shoeSize.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
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
                                  borderRadius: const BorderRadius.horizontal(
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
                            ? popularShoe[widget.index].aboutShoe!
                            : newShoe[widget.index].aboutShoe!,
                        style: const TextStyle(fontFamily: 'Poppins'),
                      ),
                      //------------------About shoe-----------------//
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          const Text(
                            'Color Selection: ',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            widget.isPopular
                                ? popularShoe[widget.index].colorSelection!
                                : newShoe[widget.index].colorSelection!,
                            style: const TextStyle(fontFamily: 'Poppins'),
                          ),
                        ],
                      ),
                      //--------------Color selection----------------//
                      Row(
                        children: [
                          const Text(
                            'Style: ',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            widget.isPopular
                                ? popularShoe[widget.index].style!
                                : newShoe[widget.index].style!,
                            style: const TextStyle(fontFamily: 'Poppins'),
                          ),
                        ],
                      ),
                      const SizedBox(height: 40),
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
                                builder: (context) => SizedBox(
                                  height: 200,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Text(
                                        'Item added to bag!',
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22,
                                        ),
                                      ),
                                      const Divider(),
                                      const Text('Want to go to bag?'),
                                      const SizedBox(height: 5),
                                      ElevatedButton(
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      const ShoeBagPage(),
                                                ));
                                          },
                                          child: const Text(
                                            'Bag',
                                            style: TextStyle(
                                                fontFamily: 'Poppins'),
                                          ))
                                    ],
                                  ),
                                ),
                              );
                            },
                            child: const Text(
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
                                  .showSnackBar(const SnackBar(
                                content: Text('Added to Favourite '),
                                backgroundColor: Colors.green,
                              ));
                            },
                            child: const Text(
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
}
