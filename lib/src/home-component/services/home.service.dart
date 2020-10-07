import 'package:food_delivery/src/home-component/models/food-category.model.dart';
import 'package:food_delivery/src/home-component/models/food.model.dart';

final categories = [
  FoodCategory(categoryName: 'Buger' , imagePath: 'assets/images/burger.jpg' , numberOfItems: 20),
  FoodCategory(categoryName: 'Burger Coca' , imagePath: 'assets/images/burgercoca.jpg' , numberOfItems: 10),
];

final foods = [
  Food(id: '1',name: 'Burger', imagePath:'assets/images/burgercoca.jpg',category: 'Hot',discount: 1.5,price: 20,rating: 3,stars: 3),
  Food(id: '2',name: 'Burger', imagePath:'assets/images/burgercoca.jpg',category: 'Hot',discount: 1.5,price: 30,rating: 10,stars: 5),
  Food(id: '3',name: 'Burger', imagePath:'assets/images/burgercoca.jpg',category: 'Hot',discount: 1.5,price: 15,rating: 25,stars: 2),
];