class CartData {
  final String dressName;
  final String dressColor;
  final String dressSize;
  final String dressImage;
  int dressPrice;
  int dressQuantity;

  CartData(
      {required this.dressName,
      required this.dressColor,
      required this.dressSize,
      required this.dressImage,
      required this.dressPrice,
      required this.dressQuantity});
}

List<CartData> cart_item = [
  CartData(
      dressName: 'Pullover',
      dressColor: 'Black',
      dressSize: 'L',
      dressImage: 'assets/images/pullover.png',
      dressPrice: 51,
      dressQuantity: 1),
  CartData(
      dressName: 'T-Shirt',
      dressColor: 'Gray',
      dressSize: 'L',
      dressImage: 'assets/images/tshirt.png',
      dressPrice: 30,
      dressQuantity: 1),
  CartData(
      dressName: 'Sport Dress',
      dressColor: 'Black',
      dressSize: 'M',
      dressImage: 'assets/images/sports_dress.png',
      dressPrice: 43,
      dressQuantity: 1),
];
