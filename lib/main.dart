import 'dart:async';
import 'package:simo_v_7_0_1/providers/products_provider.dart';
import 'package:simo_v_7_0_1/providers/provider_two.dart';
import 'package:simo_v_7_0_1/providers/provider_one.dart';
import 'package:simo_v_7_0_1/providers/shared_preferences_provider.dart';
import 'package:simo_v_7_0_1/providers/shopping_cart_provider.dart';
import 'package:simo_v_7_0_1/screens/admin_accounts.dart';
import 'package:simo_v_7_0_1/screens/admin_add_new_admins.dart';
import 'package:simo_v_7_0_1/screens/admin_dash_board.dart';
import 'package:simo_v_7_0_1/screens/admin_add_products.dart';
import 'package:simo_v_7_0_1/screens/admin_show_products_edit_delet.dart';
import 'package:simo_v_7_0_1/screens/admin_edit_product.dart';
import 'package:simo_v_7_0_1/screens/cart_screen.dart';
import 'package:simo_v_7_0_1/screens/checkout_screen.dart';
import 'package:simo_v_7_0_1/screens/fill_form_checkout.dart';
import 'package:simo_v_7_0_1/screens/orders.dart';
import 'package:simo_v_7_0_1/screens/pagar_ahora_enLinea.dart';
import 'package:simo_v_7_0_1/screens/pagar_contra_entrega.dart';
import 'package:simo_v_7_0_1/screens/selected_product_details.dart';
import 'package:simo_v_7_0_1/screens/user_profile_screen.dart';
import 'package:simo_v_7_0_1/screens/user_register_new_users.dart';
import 'package:simo_v_7_0_1/screens/admin_inventory.dart';
import 'package:simo_v_7_0_1/screens/login_screen.dart';
import 'package:simo_v_7_0_1/screens/user_home.dart';
import 'package:simo_v_7_0_1/widgets_utilities/authContainer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simo_v_7_0_1/widgets_utilities/statefulWidget_textFormField.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(
    providers: [ //SharedPrefrencedProvider
      ChangeNotifierProvider<ProviderOne>(create: (_) => ProviderOne()),
      ChangeNotifierProvider<ProviderTwo>(create: (_) => ProviderTwo()),
      ChangeNotifierProvider<ShoppingCartProvider>(create: (_) => ShoppingCartProvider()),
      ChangeNotifierProvider<SharedPrefrencedProvider>(create: (_) => SharedPrefrencedProvider()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'hHBTKNET',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color:Colors.amberAccent,
        ),
        brightness: Brightness.light,
        primaryColor: Colors.amberAccent,
        primarySwatch: Colors.blue,
      ),


       initialRoute: AdminDashBoard.id ,// ===============> original
      //initialRoute: UserHomeTest.id,


      // initialRoute: AddProduct.id ,
      // onGenerateRoute: (parameterthatcarryingdataintheroute){
      //
      // if(parameterthatcarryingdataintheroute.name == DetailsOfProducto.id)// this is the condition to navigate to one route which is here :DetailsOfProducto.id
      //
      //   {
      // var   data =  parameterthatcarryingdataintheroute.arguments ; // puting the data sent in a variable type var named data
      //   return MaterialPageRoute(builder: (context)=>DetailsOfProducto(data: data,));// returning data inside the constructor}// },



      routes: {

        LoginScreen.id: (context) => LoginScreen(),
        AdminAddProduct.id: (context) => AdminAddProduct(),
        AdminDashBoard.id:(context)=>AuthContainer(),
        AdminInventory.id:(context)=>AdminInventory(),
        RegisterNewUsers.id:(context)=>RegisterNewUsers(),
        AdminEditProduct.id:(context)=>AdminEditProduct(),
        AdminShowProductsEditDelete.id:(context)=>AdminShowProductsEditDelete(),
        UserHome.id:(context)=>UserHome(),
        RegisterNewAdmins.id:(context)=>RegisterNewAdmins(),
        AdminManagingAccounts.id:(context)=>AdminManagingAccounts(),
        UserCart.id:(context)=>UserCart(),
        SelectedProductDetails.id:(context)=>SelectedProductDetails(),
        CheckoutScreen.id:(context)=> CheckoutScreen(),
        PagarContraEntrega.id:(context)=>PagarContraEntrega(),
        PagarAhoraEnLinea.id:(context)=>PagarAhoraEnLinea(),
        FormForPagarContraEntrega.id:(context)=>FormForPagarContraEntrega(),
        UserProfileScreen.id:(context)=>UserProfileScreen(),
        Orders.id:(context)=>Orders(),





      },
    );
  }
}



