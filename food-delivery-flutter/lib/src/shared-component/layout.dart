import 'package:flutter/material.dart';
import 'package:food_delivery/src/favorite-component/components/favorite.dart';
import 'package:food_delivery/src/home-component/components/home.dart';
import 'package:food_delivery/src/order-component/components/order.dart';
import 'package:food_delivery/src/profile-component/components/profile.dart';

class Layout extends StatefulWidget {
  @override
  _LayoutState createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {

  List<Widget> pages;
  int currentTab = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pages = new List<Widget>();
    pages.add(new Home());
    pages.add(new Order());
    pages.add(new Favorite());
    pages.add(new Profile());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentTab],
      bottomNavigationBar: BottomNavigationBar(
          onTap: (int index){
            setState((){
              currentTab = index;
            });
          },
          selectedItemColor: Colors.blueAccent,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          currentIndex: currentTab,
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text('Home')
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart),
                title: Text('Orders')
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                title: Text('Favorites')
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                title: Text('Profile')
            )
          ]
      ),
    );
  }
}
