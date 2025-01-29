import 'package:intl/intl.dart';

class Product {
  final String name;
  final double price;
  final String description;
  final String imagePath;
  int quantity;
  
  Product({
    required this.name,
    required this.price,
    required this.description,
    required this.imagePath,
    required this.quantity
  });

  // Copy constructor
  Product.copy(Product product) :
    name = product.name,
    price = product.price,
    description = product.description,
    imagePath = product.imagePath,
    quantity = product.quantity;
}

final List<Product> products = [
  Product(
    name: 'HIT ME HARD AND SOFT Excl. Vinyl',
    price: 29.99 * 16000,
    description: 'Made of 100% recycled black vinyl',
    imagePath: 'assets/images/hmhas_vinyl.png',
    quantity: 0
  ),
  Product(
    name: 'Blue & Red Zip Hoodie',
    price: 99.00 * 16000,
    description: 'Produced using 100% organic cotton',
    imagePath: 'assets/images/hmhas_hoodie.png',
    quantity: 0
  ),
  Product(
    name: 'HIT ME HARD AND SOFT Standard CD',
    price: 12.99 * 16000,
    description: 'Made of 100% recycled black CD',
    imagePath: 'assets/images/hmhas_cd.png',
    quantity: 0
  ),
  Product(
    name: 'Hit Me Hard And Soft Blue Blohsh Necklace',
    price: 60.00 * 16000,
    description: 'Sterling Silver Rhinestone Blohsh pendant. 16” Chain with 3” extender',
    imagePath: 'assets/images/hmhas_necklace.png',
    quantity: 0
  ),
];

final List<Product> cart = [];
final List<Product> order = [];
String formatToRupiah(double amount) {
    final NumberFormat currencyFormatter = NumberFormat.currency(
      locale: 'id_ID', // Menggunakan locale Indonesia
      symbol: 'Rp', // Simbol mata uang
      decimalDigits: 2, // Jumlah digit desimal
    );
    return currencyFormatter.format(amount);
  }