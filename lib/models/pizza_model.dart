class Pizza {
  String? name;
  String image;
  String? desc;
  double? rating;
  double? spiciness;
  int? portion;
  String? size;
  String? crust;
  String? flavour;
  bool fav;
  int? price;

  Pizza(
      {required this.name,
      required this.image,
      required this.desc,
      required this.price,
      required this.flavour,
      required this.rating,
      required this.fav});
}



List<Pizza> pizzaList = [
  Pizza(
      name: 'Sicilian Margherita Tomato pizza',
      image: "assets/images/img_rectangle_58.png",
      desc: 'Sicilian pizza California-style with Margherita Tomato',
      flavour: 'Margherita Tomato',
      rating: 4.7,
      price: 699,
      fav: true),
  Pizza(
      name: 'Hawaiian Tandoori Chicken Pizza',
      image: "assets/images/pngegg (25) 1.png",
      desc: 'Hawaiian  Tandoori flavored with chicken',
      flavour: 'Tandoori Chicken',
      rating: 4.8,
      price: 999,
      fav: true),
  Pizza(
      name: 'Chicago-style Pepperoni Pizza',
      image: "assets/images/pngegg (26) 1.png",
      desc: 'Chicago-style pizza Pepperoni roll Lahmajoun.',
      flavour: 'Pepperoni',
      rating: 4.6,
      price: 1499,
      fav: false),
  Pizza(
      name: 'Hot Barbecue chicken pizza ',
      image: "assets/images/pngegg (28) 1.png",
      desc: 'Hot Barbecue chicken wings with capsicum and tomato.',
      flavour: 'Barbecue chicken',
      rating: 4.5,
      price: 1199,
      fav: false),
];
