class Item {
  String imgPath;
  double price;
  String loaction;
  String name;

  Item(
      {required this.imgPath,
      required this.price,
      required this.loaction ,
      required this.name});
}

final List<Item> items = [
  Item(
      name: "Product 1",
      imgPath: "assets/img/1.webp",
      price: 12.99,
      loaction: "Aaref"),
  Item(
      name: "Product 2",
      imgPath: "assets/img/2.webp",
      price: 12.99,
      loaction: "Tabaasi"),
  Item(
      name: "Product 3",
      imgPath: "assets/img/3.webp",
      price: 12.99,
      loaction: "Carrefour"),
  Item(
      name: "Product 4",
      imgPath: "assets/img/4.webp",
      price: 12.99,
      loaction: "Flower Shop"),
  Item(
      name: "Product 5",
      imgPath: "assets/img/5.webp",
      price: 12.99,
      loaction: "Majnouna"),
  Item(
      name: "Product 6",
      imgPath: "assets/img/6.webp",
      price: 12.99,
      loaction: "Aziza"),
  Item(
      name: "Product 7",
      imgPath: "assets/img/7.webp",
      price: 12.99,
      loaction: "Soug Roubaaa"),
  Item(
      name: "Product 8",
      imgPath: "assets/img/8.webp",
      price: 12.99,
      loaction: "Fleuriste"),
];
