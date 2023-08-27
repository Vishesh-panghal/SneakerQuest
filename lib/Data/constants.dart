// ignore_for_file: non_constant_identifier_names

class ShoeItem {
  late String? name;
  late String? imgAdd;
  late String? aboutShoe;
  late String? colorSelection;
  late String? style;
  late bool isPopular;
  late String? price;

  ShoeItem({
    required this.name,
    required this.imgAdd,
    required this.aboutShoe,
    required this.colorSelection,
    required this.style,
    this.isPopular = false,
    required this.price,
  });
}

ShoeItem sh1 = ShoeItem(
  name: 'Alphafly 2',
  imgAdd: 'assets/Images/nike_store/Newest/list1.png',
  aboutShoe:
      "Once you take a few strides in the Nike Air Zoom Alphafly NEXT% 2, you'll never look at your favorite pair of old racing shoes the same way again. These rocket ships are made to help shave precious time off your personal records without surrendering the foundation you need to go the full distance. A thick, lightweight support system marries the 2 worlds of comfort and speed in holy running matrimony. Enjoy the greatest energy return of all our racing shoes while you chase your personal bests.",
  colorSelection: 'Hyper Pink/Laser Orange/White/Black',
  style: 'DN3555-600',
  price: '22795'
);
ShoeItem sh2 = ShoeItem(
  name: 'Airmax Alpha',
  imgAdd: 'assets/Images/nike_store/Newest/list2.png',
  aboutShoe:
      "Finish your last rep with power and rack it with a roar that stuns the gym floor in the Nike Air Max Alpha Trainer 5. The Max Air cushioning offers comfortable stability for lifting whether it's a light or heavy day. A wide, flat base gives you enhanced stability and grip for all kinds of tough workouts without sacrificing style, as you roam from station to station and set to set.",
  colorSelection: 'Blue/Dark Bule/Golden',
  style: 'DM0829-001',
  price: '7495'
);
ShoeItem sh3 = ShoeItem(
  name: 'Freak 4',
  imgAdd: 'assets/Images/nike_store/Newest/list3.png',
  aboutShoe:
      "Giannis is an incessant storm of stamina and skill that keeps coming at opponents for 4 quarters or more. The forward-thinking design of his latest signature shoe helps propel you down the court in a lightweight fit that moves with you. It can handle quick changes in direction on both sides of the floor, giving you side-to-side stability and multi-directional traction as you Euro step to the hoop. This special colorway is inspired by the Greek Freak's towering power and his ability to bring his inner fire to the floor night in and night out.",
  colorSelection: 'Indigo Haze/Blue Tint/Baltic Blue',
  style: 'DJ6149-500',
  price: '11295'
);
ShoeItem sh4 = ShoeItem(
  name: 'Cosmic Unity 2',
  imgAdd: 'assets/Images/nike_store/Newest/lis4.png',
  aboutShoe:
      "Celebrate the love and joy of the game with the Nike Cosmic Unity 2. Made from at least 20% recycled content by weight, it provides enhanced responsiveness and support. This shoe will help keep you fresh and secure without overloading it with extra grams, so that you can focus on locking down the perimeter defensively or starting the fast break after a rebound.",
  colorSelection: 'Coconut Milk/Summit White/\nUniversity Red/Team Red',
  style: 'White/Midnight Navy/Yellow',
  price: '13297'
);
ShoeItem sh5 = ShoeItem(
  name: 'Precision 6',
  imgAdd: 'assets/Images/nike_store/Newest/list5.png',
  aboutShoe:
      "Hoof it from the bottom of the trail to the top, and handle winding paths, rolling hills, tricky hairpin turns and everything in between in the Nike Precision 6. With an abundance of rugged traction, cushioned responsiveness and trusted containment to help keep you upright, it's made for tough trail runs, the ones with limitless miles and gnarly terrain that are too enticing to turn down.",
  colorSelection: 'White/Midnight Navy/Yellow',
  style: 'CD7069-004',
  price: '5696'
);
ShoeItem sh6 = ShoeItem(
  name: 'Go FlyEase',
  imgAdd: 'assets/Images/nike_store/popular/list1.png',
  aboutShoe:
      "Ditch the laces and get outside. These kicks feature Nike's revolutionary FlyEase technology, making on-and-off a breeze. With a heel that pivots open for a totally hands-free entry, they're great for people with limited mobility—or anyone who wants a quicker way to get going.",
  colorSelection: 'Photon Dust/Summit White\n/Mineral/Geode Teal',
  style: 'DR5540-013',
  isPopular: true,
  price: '11895'
);
ShoeItem sh7 = ShoeItem(
  name: 'Nike Air \nForce 1',
  imgAdd: 'assets/Images/nike_store/popular/list2.png',
  aboutShoe:
      "Let your design shine in satin, keep it classic in canvas or get luxe with leather. No matter what you choose, these AF-1s are all about you. 12 colour choices and an additional Gum option for the sole mean your design is destined to be one of a kind, just like you",
  colorSelection: 'Multi-Colour/Multi-Colour',
  style: 'DV3908-900',
  isPopular: true,
  price: '12895'
);
ShoeItem sh8 = ShoeItem(
  name: 'Air Jordan \n13 Retro',
  imgAdd: 'assets/Images/nike_store/popular/list3.png',
  aboutShoe:
      "Michael Jordan earned the nickname \"Black Cat\" for his superior athletic ability and prowess at both ends of the court. That nickname became the muse for the Tinker Hatfield-designed Air Jordan 13. Featuring a panther-paw-like sole and \"cat eye\" holograph, Michael rode the mid-top shoe all the way to his 6th ring in '98, the last triumph of his legendary career. The Air Jordan 13 Retro brings back the stealthy, shrouded design with a fresh mix of colours and textures",
  colorSelection: 'Black/Flint Grey/White/University Red',
  style: 'DJ5982-060',
  isPopular: true,
  price: '16995'
);
ShoeItem sh9 = ShoeItem(
  name: 'SuperRep \nCycle 2',
  imgAdd: 'assets/Images/nike_store/popular/list4.png',
  aboutShoe:
      "Designed to be more breathable than its predecessor, the Nike SuperRep Cycle 2 Next Nature lets you work towards your next PR during high-heat, fast-paced indoor cycling. An improved adjustable strap helps secure your feet during intense movement.",
  colorSelection: 'Game Royal/Baltic Blue\n/Black/Picante Red',
  style: 'DH3396-401',
  isPopular: true,
  price: '9777'
);
ShoeItem sh10 = ShoeItem(
  name: 'Luka 1 PF',
  imgAdd: 'assets/Images/nike_store/popular/list5.png',
  aboutShoe:
      "Designed for No. 77 and made for every athlete craving speed and efficiency, Luka's debut delivers the goods. The first shoe with full-length Formula 23 foam, it has an ultra-supportive fit crafted with the step-back in mind. Meanwhile, strong and lightweight Flight Wire embroidery keeps you feeling contained, whether you're playing indoors or out. This is the assist you've been waiting for—get out there and make your shot. This version is designed wider and made for play on outdoor courts.",
  colorSelection: "White/Dynamic Turquoise\n/Laser Orange/Fire Pink",
  style: 'DQ6510-164',
  isPopular: true,
  price: '7832'
);

List<ShoeItem> shoes = [sh1, sh2, sh3, sh4, sh5, sh6, sh7, sh8, sh9, sh10];

List<ShoeItem> NikepopularShoe = [sh6, sh7, sh8, sh9, sh10];

List<ShoeItem> NikenewShoe = [sh1, sh2, sh3, sh4, sh5];
