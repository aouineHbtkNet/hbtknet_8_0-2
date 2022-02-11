
import 'category_model.dart';

class Product{
  int? id;
String? foto_producto;
String? nombre_producto;
String? marca;
String? contenido;
String? typo_impuesto;
String? porciento_impuesto;
String? valor_impuesto;
String? precio_ahora;
String? precio_sin_impuesto;
String? precio_anterior;
String? porciento_de_descuento;
String? descripcion;
int?  categoria_id;
String? category;

Product({this.id,this.foto_producto,this.nombre_producto,this.marca,
  this.contenido,this.typo_impuesto,this.porciento_impuesto,this.valor_impuesto,
  this.precio_ahora,this.precio_sin_impuesto,this.precio_anterior,this.porciento_de_descuento,
  this.descripcion,this.categoria_id ,this.category});

  factory Product.fromJason(Map<String,dynamic> json){

    return Product(
        id: json['id'] ?? null,
      foto_producto: json['foto_producto'] ?? null,
      nombre_producto: json['nombre_producto'] ?? null,
      marca: json['marca'] ?? null,
      contenido: json['contenido'] ?? null,
      typo_impuesto: json['typo_impuesto'] ?? null,
      porciento_impuesto: json['porciento_impuesto'] ?? null,
      valor_impuesto: json['valor_impuesto'] ?? null,
      precio_ahora: json['precio_ahora'] ?? null,
      precio_sin_impuesto: json['precio_sin_impuesto'] ?? null,
      precio_anterior: json['precio_anterior'] ?? null,
      porciento_de_descuento: json['porciento_de_descuento'] ?? null,
      descripcion: json['descripcion'] ?? null,
      categoria_id: json['categoria_id'] ?? null,
      category: json['categoria']?['nombre_categoria']?? null
    );
  }

// other functions that parse jason


  from1Jason(Map<String,dynamic> json){
    Product p = Product();
    p.id= json['productos']['id'];
    p.nombre_producto= json['productos']['nombre_producto'];
    //................ you can do that to all fields ex  :  p.foto_nombre= json['productos']['foto_nombre'];
    return p;
  }// in other classes i neeed to use barckets with Course .i need to make an object of the class : Course().from1Json(json);







  static  from2Jason(Map<String,dynamic> json){
    Product p = Product();
    p.id= json['productos']['id'];
    p.nombre_producto= json['productos']['nombre_producto'];
    //................ you can do that to all fields ex  :  p.foto_nombre= json['productos']['foto_nombre'];
    return p;
  }// in other classes i can do like this: Course.from2Json(json);




  factory   Product.from3jason(Map<String,dynamic> json){
    Product p = Product();
    p.id= json['productos']['id'];
    p.nombre_producto= json['productos']['nombre_producto'];
    //................ you can do that to all fields ex  :  p.foto_nombre= json['productos']['foto_nombre'];
    return p;
  }// in other classes i can do like this: Course.from3Json(json);


}