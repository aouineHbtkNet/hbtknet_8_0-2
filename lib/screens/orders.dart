import 'package:flutter/material.dart';

class Orders extends StatelessWidget {
  const Orders({Key? key}) : super(key: key);
  static const String id = '/orders';

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: Container(
        child:Center(child: Text('Orders')))

    );
  }
}
