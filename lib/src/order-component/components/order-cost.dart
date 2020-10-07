import 'package:flutter/material.dart';
import 'package:food_delivery/src/order-component/models/order-card.model.dart';
import 'package:food_delivery/src/profile-component/components/sign-in.dart';

class OrderCost extends StatelessWidget {
  final int id;
  final double cartTotal;
  final double discount;
  final double tax;
  final double subTotal;
  List<OrderCardDto> buyOrder;

  OrderCost({this.id, this.cartTotal, this.discount, this.tax, this.subTotal, this.buyOrder});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Cart Total',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.bold)),
              Text(this.cartTotal.toString(),
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold))
            ],
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Discount',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.bold)),
              Text(this.discount.toStringAsFixed(2),
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold))
            ],
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Tax',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.bold)),
              Text(this.tax.toStringAsFixed(2),
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold))
            ],
          ),
          SizedBox(height: 10,),
          Divider(),
          SizedBox(height: 15,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Sub Total',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.bold)),
              Text(this.subTotal.toStringAsFixed(2),
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold))
            ],
          ),
          SizedBox(height: 30,),
          GestureDetector(
            child: Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(30)
              ),
              child: Center(
                child: Text('Proceed To Checkout',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18
                  ),
                ),
              ),
            ),
            onTap: (){
              buyOrder.forEach((order){
                print('you buy # ${order.numberOfItem} from ${order.title} ');
              });
              print('sub total: ${subTotal}');

              Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignIn()));
            },
          )
        ],
      ),
    );
  }
}
