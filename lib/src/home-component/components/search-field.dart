import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  TextEditingController _searchValue = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30),
      child: TextField(
        controller: _searchValue,
        style: TextStyle(
          decorationColor: Colors.white,
        ),
        decoration: InputDecoration(
          hintText: "Search any food",
          suffixIcon: Material(
            borderRadius: BorderRadius.circular(30),
            elevation: 5,
            child: GestureDetector(
              onTap: (){
                print(_searchValue.text);
              },
              child:  Icon(
                Icons.search,
                color: Colors.black,
              ),
            ),
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 32, vertical: 14)
        ),
      ),
    );
  }
}
