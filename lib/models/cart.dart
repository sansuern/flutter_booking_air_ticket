class CartModel {
  final int id;
  final String image;
  final String place;
  final String destination;
  final int price;

  CartModel(
      {required this.id,
      required this.image,
      required this.place,
      required this.destination,
      required this.price});
}
