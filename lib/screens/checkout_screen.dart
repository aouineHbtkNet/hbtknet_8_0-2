import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:simo_v_7_0_1/providers/shopping_cart_provider.dart';
import 'package:simo_v_7_0_1/screens/pagar_ahora_enLinea.dart';
import 'package:simo_v_7_0_1/screens/pagar_contra_entrega.dart';

import 'fill_form_checkout.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({Key? key}) : super(key: key);
  static const String id = '/ checkoutScreen';

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.greenAccent,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Checkout'),
          ),
          body: Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Container(
                  margin: EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                    border: Border.all( width: 2,color: Colors.blue),
                    borderRadius: BorderRadius.circular(10.0)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                      Text('Total a pagar ',style: TextStyle(fontSize: 20,color: Colors.blueGrey),),
                      Text('${context.watch<ShoppingCartProvider>().totalPrice.toStringAsFixed(2)}\$',style: TextStyle(fontSize: 40),)
                      ],),
                  ),
                ),
                Container(
                    margin: EdgeInsets.all(4.0),
                    decoration: BoxDecoration(
                        border: Border.all( width: 2,color: Colors.blue),
                        borderRadius: BorderRadius.circular(10.0)
                    ),

                    child: ExpansionTile(
                        title: Text('Escoger la manera de pagar',
                          style: TextStyle(fontSize: 18,color: Colors.blueGrey),),
                            children:[

                              ListTile(

                                title:  Text('Pagar contra entrega',
                                  style: TextStyle(fontSize: 18,color: Colors.blueGrey),),
                                onTap: (){
                                  Navigator.of(context).pushNamed(FormForPagarContraEntrega.id);},
                              ),
                              ListTile(
                                title:  Text('Pagar ahora en linea',
                                  style: TextStyle(fontSize: 18,color: Colors.blueGrey),),
                                onTap: (){ Navigator.of(context).pushNamed(PagarAhoraEnLinea.id);},
                              ),




                            ]
                    )
                )
              ],
            ),
          ),
        ));
  }
}

