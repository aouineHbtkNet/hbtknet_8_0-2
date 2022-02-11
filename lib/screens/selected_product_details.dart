import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simo_v_7_0_1/modals/cart_model.dart';
import 'package:simo_v_7_0_1/modals/json_products_plus_categories.dart';
import 'package:simo_v_7_0_1/modals/product_model.dart';
import 'package:simo_v_7_0_1/providers/shopping_cart_provider.dart';
import 'package:simo_v_7_0_1/screens/user_home.dart';
import 'package:simo_v_7_0_1/widgets_utilities/user_app_bar.dart';
import 'package:http/http.dart' as http;

import 'cart_screen.dart';

class SelectedProductDetails extends StatefulWidget {
  const SelectedProductDetails({Key? key}) : super(key: key);
  static const String id = '/ selectedProductDetails';
  @override
  _SelectedProductDetailsState createState() => _SelectedProductDetailsState();
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

var selectedMap;
 int quantityLocal =1;

class _SelectedProductDetailsState extends State<SelectedProductDetails> {
  @override
  Widget build(BuildContext context) {
    selectedMap = ModalRoute.of(context)!.settings.arguments;

    quantityLocal = context.watch<ShoppingCartProvider>().quantity;

    return selectedMap == null
        ? Text('Loading')
        : Scaffold(
            appBar:AppBar(
             title: Text('${selectedMap['nombre_producto']}'),
              centerTitle: true,
              leading:  IconButton(onPressed:(){
                Navigator.of(context).pop();


              }, icon:Icon( Icons.arrow_back_outlined,size: 30,),
              ),
              actions: [

                Row(children: [

                  Text('${context.watch<ShoppingCartProvider>().count}',
                    style: TextStyle(fontSize: 20),),
                  IconButton(onPressed:(){
                    Navigator.of(context).pushNamed(UserCart.id);
                  }, icon:Icon( Icons.shopping_cart_outlined),
                  ),],),],),

            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Expanded(
                    child: Card(
                      elevation: 12,
                      child: SingleChildScrollView(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(
                              height: MediaQuery.of(context).size.height / 3,
                              child: selectedMap['foto_producto'] == null
                                  ? FittedBox(
                                      fit: BoxFit.fill,
                                      child: ClipRect(
                                        child: Image.asset(
                                            'assets/iconPlaceholder12.png'),
                                      ),
                                    )
                                  : FittedBox(
                                      fit: BoxFit.fill,
                                      child: ClipRRect(
                                        child: Image.network(
                                            'http://192.168.1.22/api_v_1/storage/app/public/notes/${selectedMap['foto_producto']}'),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                    )),
                          selectedMap['categoria'] == null ||
                                  selectedMap['categoria'] == ''
                              ? Text('')
                              : SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Categoria :',
                                        style: TextStyle(
                                            color: Colors.blueGrey,
                                            fontSize: 20),
                                      ),
                                      Text(
                                        '${selectedMap['categoria']['nombre_categoria']}',
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 20),
                                      ),
                                    ],
                                  ),
                                ),
                          selectedMap['marca'] == null ||
                                  selectedMap['marca'] == ''
                              ? Text('')
                              : SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Marca: ',
                                        style: TextStyle(
                                            color: Colors.blueGrey,
                                            fontSize: 20),
                                      ),
                                      Text(
                                        '${selectedMap['marca']}',
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 20),
                                      ),
                                    ],
                                  ),
                                ),
                          selectedMap['nombre_producto'] == null ||
                                  selectedMap['nombre_producto'] == ''
                              ? Text('')
                              : SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Nombre: ',
                                        style: TextStyle(
                                            color: Colors.blueGrey,
                                            fontSize: 20),
                                      ),
                                      Text(
                                        '${selectedMap['nombre_producto']}',
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 20),
                                      ),
                                    ],
                                  ),
                                ),
                          selectedMap['precio_ahora'] == null ||
                                  selectedMap['precio_ahora'] == ''
                              ? Text('')
                              : SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Precio: ',
                                        style: TextStyle(
                                            color: Colors.blueGrey,
                                            fontSize: 20),
                                      ),
                                      Text(
                                        '${selectedMap['precio_ahora']}\$',
                                        style: TextStyle(
                                            color: Colors.blue, fontSize: 30),
                                      ),
                                    ],
                                  ),
                                ),
                          '${selectedMap['precio_anterior']}' == "0.00"
                              ? SizedBox(
                                  height: 0.0,
                                )
                              : SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Precio anterior: ',
                                        style: TextStyle(
                                            color: Colors.blueGrey,
                                            fontSize: 20),
                                      ),
                                      RichText(
                                        text: TextSpan(
                                          text:
                                              '${selectedMap['precio_anterior']} \$',
                                          style: new TextStyle(
                                            fontSize: 30,
                                            color: Colors.red,
                                            decoration:
                                                TextDecoration.lineThrough,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                          '${selectedMap['porciento_de_descuento']}' == "0.00"
                              ? SizedBox(
                                  height: 0.0,
                                )
                              : SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Descuento: ',
                                        style: TextStyle(
                                            color: Colors.blueGrey,
                                            fontSize: 20),
                                      ),
                                      Text(
                                        '${selectedMap['porciento_de_descuento']} %',
                                        style: TextStyle(
                                            color: Colors.green, fontSize: 30),
                                      ),
                                    ],
                                  ),
                                ),
                          '${selectedMap['descripcion :']}' == null
                              ? Text('')
                              : Text(
                                  'Descripcion',
                                  style: TextStyle(
                                      color: Colors.blueGrey, fontSize: 20),
                                ),
                          '${selectedMap['descripcion']}' == null
                              ? Text('')
                              : Text(
                                  '${selectedMap['descripcion']} ',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 20),
                                ),
                        ],
                      )),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent),
                      borderRadius: BorderRadius.circular(
                        8.0,
                      ),
                    ),
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(onPressed: () {
                                    context.read<ShoppingCartProvider>().increaseQuantity();},
                                    icon:Icon(Icons.add,size: 50,color: Colors.blueGrey,),),
                                  Text(context.watch<ShoppingCartProvider>().quantity.toString(),
                                    style: TextStyle(fontSize: 50,color: Colors.blueGrey),),
                                  IconButton(onPressed: () {
                                    context.read<ShoppingCartProvider>().decreaseQuantity();},
                                      icon:Icon(Icons.remove,size: 50,color: Colors.blueGrey,)),


                                ],),










                            ])),
                  ),



                  Container(
                    margin: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent),
                      borderRadius: BorderRadius.circular(
                        8.0,
                      ),
                    ),
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [




                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [

                                  IconButton(
                                      onPressed: () {
                                        CartModel cartModel = CartModel(
                                          item: Item(
                                            productId: selectedMap['id'],
                                            productName: selectedMap['nombre_producto'] ?? '',
                                            productImage: selectedMap['foto_producto'] ?? '',
                                            precio_ahora: double.parse(selectedMap['precio_ahora']),
                                            precio_sin_impuesto: double.parse(selectedMap['precio_sin_impuesto']),
                                            valor_impuesto: double.parse(selectedMap['valor_impuesto']),
                                            valor_de_descuento: double.parse(selectedMap['porciento_de_descuento']),),


                                          quantity: quantityLocal,
                                          productoPrecioTotal: (double.parse(selectedMap['precio_ahora']) * quantityLocal),
                                          producto_precio_sinimpuesto_total: double.parse(selectedMap['precio_sin_impuesto']) * quantityLocal,
                                          producto_valor_impuesto_total: double.parse(selectedMap['valor_impuesto']) * quantityLocal,
                                          producto_valor_descuento_total: double.parse(selectedMap['porciento_de_descuento']) * quantityLocal,);

                                        context.read<ShoppingCartProvider>().add(cartModel);
                                        // context.read<ShoppingCartProvider>().setQuantityToDefault();



                                        Navigator.of(context).pop();
                                        },
                                      icon: Icon(Icons.add_shopping_cart_outlined, size: 50, color: Colors.blueGrey,)),

                                ],
                              ),






                            ])),
                  ),



          ]
    ))

  );
}}
