import 'package:flutter/material.dart';
import 'package:food_delivery/src/home-component/components/food-card.dart';
import 'package:food_delivery/src/home-component/services/home.service.dart';

class FoodCategory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: ListView.builder(
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index){
          return FoodCard(
            categoryName: categories[index].categoryName,
            imagePath: categories[index].imagePath,
            numberOfItems: categories[index].numberOfItems,
          );
        },
      ),
    );
  }
}
