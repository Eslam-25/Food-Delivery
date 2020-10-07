import 'package:flutter/material.dart';
import 'package:food_delivery/src/home-component/components/bought-food.dart';
import 'package:food_delivery/src/home-component/components/food-category.dart';
import 'package:food_delivery/src/home-component/components/home-title.dart';
import 'package:food_delivery/src/home-component/components/search-field.dart';
import 'package:food_delivery/src/home-component/models/food.model.dart';
import 'package:food_delivery/src/home-component/services/home.service.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.only(top: 50, right: 20, left: 20),
        children: <Widget>[
          HomeTitle(),
          FoodCategory(),
          SizedBox(height: 25,),
          SearchField(),
          SizedBox(height: 25,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Frequently Bought Foods',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              ),
              GestureDetector(
                onTap: (){
                  print('View All');
                },
                child: Text('View All',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.orangeAccent
                    )
                ),
              )
            ],
          ),
          SizedBox(height: 5,),
          Column(
            children: foods.map((Food food){
              return Container(
                margin: EdgeInsets.only(top: 20, bottom: 5),
                child: BoughtFoods(
                  id: food.id,
                  name: food.name,
                  imagePath: food.imagePath,
                  price: food.price,
                  category: food.category,
                  discount: food.discount,
                  rating: food.rating,
                  stars: food.stars,
                ),
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
