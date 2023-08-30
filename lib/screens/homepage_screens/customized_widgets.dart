import 'package:SneakerQuest/screens/bag.dart';
import 'package:flutter/material.dart';

import '../../Data/text_content.dart';

//-------------Custom Named Row---------------------------//
class CustomRow extends StatelessWidget {
  final String title;
  final String linkText;

  const CustomRow({super.key, required this.title, required this.linkText});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              linkText,
              style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: Colors.amber),
            ),
            const Icon(
              Icons.arrow_right,
              size: 28,
              color: Colors.amber,
            ),
          ],
        ),
      ],
    );
  }
}

//---------------------custom shoe container apperiance-------//

class HomepageShoeCard extends StatefulWidget {
  final String shoeName;
  final String shoeImageUrl;
  final Function() onTap;

  const HomepageShoeCard({
    super.key,
    required this.shoeName,
    required this.shoeImageUrl,
    required this.onTap,
  });

  @override
  State<HomepageShoeCard> createState() => _HomepageShoeCardState();
}

class _HomepageShoeCardState extends State<HomepageShoeCard>
    with SingleTickerProviderStateMixin {
  late AnimationController shoeController;
  @override
  void initState() {
    shoeController = AnimationController(vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 380,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(12),
      ),
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
                      horizontal: 10,
                      vertical: 15,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                          widget.shoeName,
                          style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.amber,
                          ),
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xfff6d365),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ShoeBagPage(),
                                ));
                          },
                          child: const Row(
                            children: [
                              Text(
                                'Add to bag',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Icon(
                                Icons.shopping_bag_outlined,
                                size: 18,
                                color: Colors.white,
                              ),
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
                onTap: widget.onTap,
                child: AnimatedBuilder(
                  animation: shoeController,
                  builder: (context, child) {
                    return Transform.rotate(
                      angle: 12.4,
                      child: child,
                    );
                  },
                  child: Image.asset(
                    widget.shoeImageUrl,
                    height: 90,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
