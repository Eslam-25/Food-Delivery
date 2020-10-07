import 'package:food_delivery/src/order-component/components/order-card.dart';

final orderCards = [
  new OrderCard(
    id: 1,
    title: 'Burger',
    price: 2.5,
    numberOfItem: 1,
    imagePath: 'assets/images/burger.jpg',
    items: ['Checken', 'Meat'],
  ),
  new OrderCard(
    id: 2,
    title: 'Burger 2',
    price: 3.5,
    numberOfItem: 1,
    imagePath: 'assets/images/burgercoca.jpg',
    items: ['Checken', 'coca cola'],
  )
];
