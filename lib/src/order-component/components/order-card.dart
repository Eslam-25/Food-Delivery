import 'package:flutter/material.dart';
import 'package:food_delivery/src/order-component/components/order.dart';
import 'package:food_delivery/src/order-component/models/order-card.model.dart';

class OrderCard extends StatefulWidget {
  final int id;
  int numberOfItem;
  final String imagePath;
  final String title;
  final double price;
  final List<String> items;
  Order order;

  OrderCard(
      {this.id,
      this.numberOfItem,
      this.imagePath,
      this.title,
      this.price,
      this.items});
  OrderCardDto getCardInfo() {
    return new OrderCardDto(
      id: this.id,
      title: this.title,
      numberOfItem: this.numberOfItem,
      price: this.price,
      imagePath: this.imagePath,
      items: this.items,
    );
  }

  void register(Order order) {
    this.order = order;
  }

  @override
  _OrderCardState createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.symmetric(vertical: 5),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 80,
                padding: EdgeInsets.only(left: 10, right: 10),
                decoration: BoxDecoration(
                    border: Border.all(width: 2, color: Colors.grey),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                        child: Icon(
                          Icons.keyboard_arrow_up,
                          color: widget.numberOfItem > 0
                              ? Colors.black
                              : Colors.black12,
                        ),
                        onTap: () {
                          setState(() {
                              widget.numberOfItem += 1;
                              widget.order.increaseItem(widget.id);
                          });
                        }),
                    Text(
                      widget.numberOfItem.toString(),
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                    GestureDetector(
                        child: Icon(Icons.keyboard_arrow_down,
                            color: widget.numberOfItem > 0
                                ? Colors.black
                                : Colors.black12),
                        onTap: () {
                          setState(() {
                            if (widget.numberOfItem > 0) {
                              widget.numberOfItem -= 1;
                              widget.order.decreaseItem(widget.id);
                            }
                          });
                        }),
                  ],
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(widget.imagePath),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(35),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black,
                          blurRadius: 5,
                          offset: Offset(4, 5))
                    ]),
              ),
              SizedBox(
                width: 20,
              ),
              Container(
                height: 70,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      widget.title,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                        '\u00A2 ' + widget.price.toString(),
                      style:
                          TextStyle(color: Colors.orangeAccent, fontSize: 16),
                    ),
                    Container(
                      height: 25,
                      width: 130,
                      child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: widget.items.map((String item) {
                            return Row(children: <Widget>[
                              Text(
                                item,
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                'X',
                                style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                            ]);
                          }).toList()),
                    )
                  ],
                ),
              ),
              Spacer(),
              GestureDetector(
                child: Icon(
                  Icons.cancel,
                  color: Colors.grey,
                ),
                onTap: () {},
              )
            ],
          ),
        ));
  }
}
