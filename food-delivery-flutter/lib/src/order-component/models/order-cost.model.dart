class OrderCostDto{
  final int id;
  final double cartTotal;
  final double discount;
  final double tax;
  final double subTotal;

  OrderCostDto({this.id, this.cartTotal, this.discount, this.tax, this.subTotal});
}