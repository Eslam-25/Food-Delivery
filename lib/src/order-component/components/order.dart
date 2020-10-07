import 'package:flutter/material.dart';
import 'package:food_delivery/src/order-component/components/order-card.dart';
import 'package:food_delivery/src/order-component/components/order-cost.dart';
import 'package:food_delivery/src/order-component/models/order-card.model.dart';
import 'package:food_delivery/src/order-component/services/order-card.service.dart';

class Order extends StatefulWidget {
  _OrderState __orderState;
  List<OrderCard> orders = orderCards;
  List<OrderCardDto> buyOrder = new List<OrderCardDto>();

  double cartTotal = 0;
  double discount = 0;
  double tax = 0;
  double subTotal = 0;

  Order() {
    orders.forEach((order) {
      order.register(this);
      buyOrder.add(order.getCardInfo());
      cartTotal += order.price;
      calcTaxAndDiscountAndSubTotal();
    });
  }

  void increaseItem(int id) {
    OrderCardDto orderCardDto = orders
        .where((i) {
          return i.id == id;
        })
        .first
        .getCardInfo();
    if (buyOrder.where((o) {
          return o.id == id;
        }).first ==
        null)
      buyOrder.add(orderCardDto);
    else
      buyOrder
          .where((o) {
            return o.id == id;
          })
          .first
          .numberOfItem = orderCardDto.numberOfItem;

    __orderState.setState(() {
      cartTotal += orderCardDto.price;
      calcTaxAndDiscountAndSubTotal();
    });
  }

  void decreaseItem(int id) {
    OrderCard orderCard = orders.where((i) {
      return i.id == id;
    }).first;
    buyOrder.removeAt(orders.indexOf(orderCard));

    __orderState.setState(() {
      cartTotal -= orderCard.getCardInfo().price;
      calcTaxAndDiscountAndSubTotal();
    });
  }

  void calcTaxAndDiscountAndSubTotal() {
    discount = cartTotal * 0.05;
    tax = cartTotal * 0.10;
    subTotal = cartTotal + tax + discount;
  }

  @override
  _OrderState createState() {
    final os = new _OrderState();
    __orderState = os;
    return os;
  }
}

class _OrderState extends State<Order> {
  void changeMoneyInfo(id) {
    print(id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Your Food Cart',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 10),
          children: widget.orders),
      bottomNavigationBar: OrderCost(
        id: 1,
        cartTotal: widget.cartTotal,
        discount: widget.discount,
        tax: widget.tax,
        subTotal: widget.subTotal,
        buyOrder: widget.buyOrder,
      ),
    );
  }
}
