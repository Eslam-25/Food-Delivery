class OrderCardDto {
  final int id;
  int numberOfItem;
  final String imagePath;
  final String title;
  final double price;
  final List<String> items;

  OrderCardDto({this.id, this.numberOfItem, this.imagePath ,this.title, this.price , this.items});
}