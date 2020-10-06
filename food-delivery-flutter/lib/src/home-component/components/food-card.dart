import 'package:flutter/material.dart';
import 'package:food_delivery/src/home-component/models/food-category.model.dart';

class FoodCard extends StatelessWidget {
  final String categoryName;
  final String imagePath;
  final int numberOfItems;

  FoodCard({this.categoryName, this.imagePath, this.numberOfItems});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 20),
      child: Card(
        elevation: 3,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image(
                  image: AssetImage(this.imagePath),
                  height: 65,
                  width: 65,
                ),
                SizedBox(width: 20,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(this.categoryName, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                    Text('$numberOfItems+ kinds'),
                  ],
                )
              ],
            ),)
      ),
    );
  }
}
