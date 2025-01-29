import 'package:billie_eilish_merch_app/data/product.dart';
import 'package:billie_eilish_merch_app/pages/cart_page.dart';
import 'package:billie_eilish_merch_app/pages/intro_page.dart';
import 'package:billie_eilish_merch_app/pages/order_page.dart';
import 'package:billie_eilish_merch_app/pages/payment_page.dart';
import 'package:billie_eilish_merch_app/pages/shop_page.dart';
import 'package:billie_eilish_merch_app/theme/hmhas_mode.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int cartQuantity = 0; // Jumlah keranjang awal

  @override
  void initState() {
    super.initState();
    updateCartQuantity(); // Hitung jumlah keranjang saat inisialisasi
  }

  void updateCartQuantity() {
    setState(() {
      cartQuantity = 0; // Reset jumlah keranjang
      for (var item in cart) {
        cartQuantity += item.quantity; // Hitung jumlah total
      }
    });
  }

  void clearCart() {
    setState(() {
      for(var item in cart){
        order.add(Product.copy(item));
        item.quantity = 0; // Mereset jumlah item
        updateCartQuantity(); // Memperbarui jumlah keranjang
      }
      cart.clear(); // Mengosongkan item di keranjang
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/intro_page', // Seperti home
      theme: hmhasMode, // Tema warna HIT ME HARD AND SOFT
      routes: {
        '/intro_page': (context) => IntroPage(),
        '/shop_page': (context) => ShopPage(
          updateCartQuantity: (int quantity) {updateCartQuantity();}, cartQuantity: cartQuantity
        ),
        '/cart_page': (context) => CartPage(
          updateCartQuantity: (int quantity) {updateCartQuantity();},
          clearCart: clearCart,
        ),
        '/payment_page': (context) => PaymentPage(clearCart: clearCart),
        '/order_page': (context) => OrderPage(),
      },
    );
  }
}