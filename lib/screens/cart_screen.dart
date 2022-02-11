import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simo_v_7_0_1/modals/json_products_plus_categories.dart';
import 'package:simo_v_7_0_1/modals/product_model.dart';
import 'package:simo_v_7_0_1/providers/shopping_cart_provider.dart';
import 'package:simo_v_7_0_1/screens/user_home.dart';
import 'package:simo_v_7_0_1/widgets_utilities/user_app_bar.dart';
import 'package:http/http.dart' as http;

import 'checkout_screen.dart';

class UserCart extends StatefulWidget {
  const UserCart({Key? key}) : super(key: key);
  static const String id = '/ usercart';
  @override
  _UserCartState createState() => _UserCartState();
}

void showstuff(context, var myString) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: myString == '' || myString == null
              ? ClipRect(
                  child: Image.asset('assets/iconPlaceholder12.png'),
                )
              : ClipRect(
                  child: Image.network(
                      'http://192.168.1.22/api_v_1/storage/app/public/notes/$myString'),
                ),
          actions: [
            ElevatedButton(
                onPressed: () async {
                  Navigator.of(context).pop();
                },
                child: Center(child: Text('Ok')))
          ],
        );
      });
}

class _UserCartState extends State<UserCart> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [


            Text('${context.watch<ShoppingCartProvider>().count}',
              style: TextStyle(fontSize: 40),),
            IconButton(
              onPressed: (){


                Navigator.of(context). pushNamedAndRemoveUntil(UserHome.id, (Route<dynamic> route) => false);




                },
              icon:Icon(Icons.add_shopping_cart_outlined,size: 60,))
            ,],
          ),
        ),

        centerTitle: true,
        leading:  IconButton(onPressed:(){
          Navigator.of(context). pushNamedAndRemoveUntil(UserHome.id, (Route<dynamic> route) => false);
        }, icon:Icon( Icons.arrow_back_outlined,size: 30,),
        ),


      ),
         body: Column(
        children: [

          '${context.watch<ShoppingCartProvider>().totalPrice}'=='0.0'?SizedBox(height: 0,): Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size.fromHeight(40),
                  primary: Colors.green
                ),
                onPressed: () {

                  Navigator.of(context).pushNamed(CheckoutScreen.id);
                },
                child: Text("Pagar",style: TextStyle(fontSize: 20),),
              ),),
          ),





          Expanded(
            child: ListView.builder(
                itemCount: context.watch<ShoppingCartProvider>().count,
                itemBuilder: (BuildContext context, int index) {
                  var list = context.watch<ShoppingCartProvider>().itemList[index];
                  return Card(
                      elevation: 8,
                      child: ListTile(
                        leading: TextButton(
                          onPressed: () {
                            showstuff(context, list.item.productImage);
                          },
                          child: Container(
                            child: '${list.item.productImage}'.isEmpty ||
                                    '${list.item.productImage}' == null
                                ? CircleAvatar(
                                    backgroundImage: AssetImage(
                                        'assets/iconPlaceholder12.png'),
                                    backgroundColor: Colors.transparent,
                                    radius: 30.0,
                                  )
                                : CircleAvatar(
                                    radius: 30.0,
                                    backgroundImage: NetworkImage(
                                        'http://192.168.1.22/api_v_1/storage/app/public/notes/${list.item.productImage}'),
                                    backgroundColor: Colors.transparent,
                                  ),
                          ),
                        ),
                        title: Column(
                          children: [

                            Text('${list.item.productName}' ,style: TextStyle(
                              fontSize: 20
                            ),),

                            Text('${list.item.precio_ahora}\$ X${list.quantity}',
                              style: TextStyle(fontSize: 20,color: Colors.blueGrey),
                            ),
                            Text('${'${list.productoPrecioTotal}'}\$ ',
                              style: TextStyle(fontSize: 20,color: Colors.blueGrey),
                            ),
                          ],
                        ),






                        trailing: IconButton(onPressed: (){
                          context.read<ShoppingCartProvider>().remove(list);
                        },
                          icon: Icon(Icons.clear,size: 20,color: Colors.red,),),
                      ));
                }),
          ),



          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total a pagar ',
                        style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black, fontSize: 20),
                      ),
                      Text(
                        '${context.watch<ShoppingCartProvider>().totalPrice.toStringAsFixed(2)}\$',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 36),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Precio sin impuestos ',
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                      Text(
                        '${context.watch<ShoppingCartProvider>().totalPriceWithNotaxes.toStringAsFixed(2)}\$',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                            fontSize: 16),
                      ),
                    ],
                  ),
                ),
                Container(

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Valor impuestos ',
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                      Text(
                        '${context.watch<ShoppingCartProvider>().Totaltaxvalue.toStringAsFixed(2)}\$',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                            fontSize: 16),
                      ),
                    ],
                  ),
                ),
                Container(

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total discuento',
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                      Text(
                        '${context.watch<ShoppingCartProvider>().totalDiscount.toStringAsFixed(2)}\$',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                            fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
