import 'package:flutter/material.dart';

class UsedWidgets {



  Widget buildListTile(
      {IconData? leadingIcon, VoidCallback? voidCallback, String? title}) {
    return ListTile(
      onTap: voidCallback,
      leading: Icon(
        leadingIcon,
        color: Colors.amberAccent,
      ),
      title: Text(
        title!,
        style: TextStyle(
            fontSize: 20, color: Colors.blueGrey, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget buildRowNoSpaceScrollable({
    required String title,
    required String data,
  }) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 20, color: Colors.blueGrey),
          ),
          Text(
            data,
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
        ],
      ),
    );
  }


  Widget buildRowSpaceBetween({
    required String title,
    required String data,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 20, color: Colors.blueGrey),
        ),
        Text(
          data,
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
      ],
    );
  }






































}













