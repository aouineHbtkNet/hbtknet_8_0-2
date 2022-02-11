import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:simo_v_7_0_1/providers/shopping_cart_provider.dart';
import 'package:simo_v_7_0_1/screens/user_home.dart';

class PagarContraEntrega extends StatelessWidget {
  const PagarContraEntrega({Key? key}) : super(key: key);
  static const String id = '/ PagarContraEntrega';

  void showstuff(context, String  myString) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(myString) ,
            actions: [
              ElevatedButton(
                  onPressed: () async {
                   // Navigator.of(context).pop();
                    Navigator.of(context).pushNamedAndRemoveUntil(UserHome.id , (route) => false);
                  },
                  child: Center(child: Text('Ok')))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.greenAccent,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Pagar contra entrega'),
          ),
          body: Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Colors.blue),
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Total a pagar ',
                          style:
                              TextStyle(fontSize: 20, color: Colors.blueGrey),
                        ),
                        Text(
                          '${context.watch<ShoppingCartProvider>().totalPrice.toStringAsFixed(2)}\$',
                          style: TextStyle(fontSize: 40),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                    margin: EdgeInsets.all(4.0),
                    decoration: BoxDecoration(
                        border: Border.all(width: 2, color: Colors.blue),
                        borderRadius: BorderRadius.circular(10.0)),
                    child: ExpansionTile(
                        title: Text(
                          'Escoger una de las opciones ',
                          style:
                              TextStyle(fontSize: 18, color: Colors.blueGrey),
                        ),
                        children: [
                          ListTile(
                            title: Text(
                              'Pagar con effectivo',
                              style: TextStyle(
                                  fontSize: 18, color: Colors.blueGrey),
                            ),
                            onTap: () {
                              showstuff(
                                  context,
                                  'Listo,tu pedido pedido ha sido enviado.puedes verificar '
                                  'tu pedido en la area de ordenes en este applicacion');
                            },
                          ),
                          ListTile(
                              title: Text(
                                'Pagar con datafono',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.blueGrey),
                              ),
                              onTap: () {
                                showstuff(
                                    context,
                                    'Listo,tu pedido pedido ha sido enviado.puedes verificar '
                                    'tu pedido en la area de ordenes en este applicacion');
                              }),
                          ListTile(
                              title: Text(
                                'Pagar en linea desde la applicacion',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.blueGrey),
                              ),
                              onTap: () {
                                showstuff(
                                    context,
                                    'Listo,tu pedido pedido ha sido enviado.puedes verificar '
                                    'tu pedido en la area de ordenes en este applicacion');
                              }),
                        ]))
              ],
            ),
          ),
        ));
  }
}
