import 'package:simo_v_7_0_1/modals/product_model.dart';

class CartModel{


    Item item;
    int? quantity=1;
   double productoPrecioTotal =0.0;
   double producto_precio_sinimpuesto_total=0.0;
   double producto_valor_impuesto_total =0.0;
    double producto_valor_descuento_total =0.0;



CartModel({
  required this.item,
  required this.quantity,
  required this.productoPrecioTotal,
  required this.producto_precio_sinimpuesto_total,
  required this.producto_valor_impuesto_total,
  required this.producto_valor_descuento_total

});





}
class Item {

  int? productId;
  String? productName;
  String? productImage;
  double? precio_ahora;
  double precio_sin_impuesto;
  double valor_impuesto;
  double valor_de_descuento;



  Item( {
  required this.productId,
  required this.productName,
    this.productImage,
   this.precio_ahora,
  required this.precio_sin_impuesto,
    required this.valor_impuesto,
    required this.valor_de_descuento,


   });

}






