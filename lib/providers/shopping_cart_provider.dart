import 'package:flutter/cupertino.dart';
import 'package:simo_v_7_0_1/modals/cart_model.dart';
import 'package:simo_v_7_0_1/modals/product_model.dart';


class ShoppingCartProvider extends ChangeNotifier{

 //variables
  int get count {return _itemList.length;}
  List<CartModel> _itemList=[];
      int _quantity =1;
      double _totalPrice = 0.0;
      double _totalPriceWithNotaxes=0.0;
      double _Totaltaxvalue =0.0;
      double _totalDiscount=0.0;

    //Functions

   void add(CartModel cartModel){
     _itemList.add(cartModel);
     _totalPrice += cartModel.productoPrecioTotal;
     _totalPriceWithNotaxes +=cartModel.producto_precio_sinimpuesto_total;
     _Totaltaxvalue +=cartModel.producto_valor_impuesto_total;
     _totalDiscount +=cartModel.producto_valor_descuento_total;
     _quantity=1;
   notifyListeners();
   }

  void remove(CartModel cartModel){
    _itemList.remove(cartModel);
    _totalPrice -= cartModel.productoPrecioTotal;
    _totalPriceWithNotaxes -=cartModel.producto_precio_sinimpuesto_total;
    _Totaltaxvalue -=cartModel.producto_valor_impuesto_total;
    _totalDiscount -=cartModel.producto_valor_descuento_total;
    _quantity=1;
    notifyListeners();
  }

  increaseQuantity(){if (_quantity<9) { _quantity++;}notifyListeners();}
  decreaseQuantity() {if (_quantity > 1) {_quantity--;}notifyListeners();}
  //Getters
  List<CartModel>  get itemList { return _itemList;}
  double get totalPrice {return  _totalPrice;}
  double get totalPriceWithNotaxes {return  _totalPriceWithNotaxes;}
  double get Totaltaxvalue{return _Totaltaxvalue;}
  double get totalDiscount{return _totalDiscount;}
  int get quantity {return _quantity;}

}