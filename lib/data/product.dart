import 'package:intl/intl.dart';

class Product {
  final String name;
  final double price;
  final String description;
  final String imagePath;
  final String type;
  int quantity;
  
  Product({
    required this.name,
    required this.price,
    required this.description,
    required this.imagePath,
    required this.quantity,
    required this.type
  });

  // Copy constructor
  Product.copy(Product product) :
    name = product.name,
    price = product.price,
    description = product.description,
    imagePath = product.imagePath,
    quantity = product.quantity,
    type = product.type;
}

final List<Product> products = [
  // hmhas
  Product(
    name: 'HIT ME HARD AND SOFT Excl. Vinyl',
    price: 37.99 * 16000,
    description: 'Made of 100% recycled black vinyl',
    imagePath: 'assets/images/hmhas_vinyl.png',
    quantity: 0,
    type: 'hmhas'
  ),
  Product(
    name: 'Blue & Red Zip Hoodie',
    price: 125.00 * 16000,
    description: 'Produced using 100% organic cotton',
    imagePath: 'assets/images/hmhas_hoodie.png',
    quantity: 0,
    type: 'hmhas'
  ),
  Product(
    name: 'HIT ME HARD AND SOFT Standard CD',
    price: 16.99 * 16000,
    description: 'Made of 100% recycled black CD',
    imagePath: 'assets/images/hmhas_cd.png',
    quantity: 0,
    type: 'hmhas'
  ),
  Product(
    name: 'HIT ME HARD AND SOFT Blue Blohsh Necklace',
    price: 78.00 * 16000,
    description: 'Sterling Silver Rhinestone Blohsh pendant. 16” Chain with 3” extender',
    imagePath: 'assets/images/hmhas_necklace.png',
    quantity: 0,
    type: 'hmhas'
  ),
  // new collection
  Product(
    name: 'Blohsh Polo Long Sleeve',
    price: 106.00 * 16000,
    description: 'Produced using: 100% recycled cotton',
    imagePath: 'assets/images/new_polo.png',
    quantity: 0,
    type: 'newCollection'
  ),
  Product(
    name: 'L\'amour Caribiner Clip Set',
    price: 13.00 * 16000,
    description: 'Produced using: 100% aluminum/metal',
    imagePath: 'assets/images/new_clip-set.png',
    quantity: 0,
    type: 'newCollection'
  ),
  Product(
    name: 'Thermal Be Collage Photo Tee',
    price: 44.00 * 16000,
    description: 'Produced using: 100% recycled cotton',
    imagePath: 'assets/images/new_t-shirt.png',
    quantity: 0,
    type: 'newCollection'
  ),
  Product(
    name: 'HIT ME HARD AND SOFT Mesh Shorts',
    price: 69.00 * 16000,
    description: 'Produced using: 100% recycled polyester',
    imagePath: 'assets/images/new_shorts.png',
    quantity: 0,
    type: 'newCollection'
  ),
  // hte
  Product(
    name: 'Happier Than Ever: Excl. Recycled Vinyl 2LP',
    price: 45.99 * 16000,
    description: 'This waste free swirl variant is made from recycled vinyl scraps from all the colors of the first pressing of the record',
    imagePath: 'assets/images/hte_vinyl-2lp.png',
    quantity: 0,
    type: 'hte'
  ),
  Product(
    name: 'Happier Than Ever: CD',
    price: 12.99 * 16000,
    description: 'This waste free swirl variant is made from recycled vinyl scraps from all the colors of the first pressing of the record',
    imagePath: 'assets/images/hte_cd.png',
    quantity: 0,
    type: 'hte'
  ),
  Product(
    name: 'Happier Than Ever: Vinyl LP',
    price: 43.99 * 16000,
    description: 'This waste free swirl variant is made from recycled vinyl scraps from all the colors of the first pressing of the record',
    imagePath: 'assets/images/hte_vinyl-lp.png',
    quantity: 0,
    type: 'hte'
  ),
  // wwafawdwg
  Product(
    name: 'WWAFAWDWG Anniversary Layered Ls Tee In Black',
    price: 72.00 * 16000,
    description: 'Black 2-fer Longsleeve T-Shirt featuring art from When WHEN WE ALL FALL ASLEEP, WHERE DO WE GO?',
    imagePath: 'assets/images/ww_ls-tee.png',
    quantity: 0,
    type: 'ww'
  ),
  Product(
    name: 'WWAFAWDWG Anniversary T-Shirt Dress In White',
    price: 65.00 * 16000,
    description: 'White t-shirt dress featuring illustration screenprinted on front.',
    imagePath: 'assets/images/ww_t-shirt.png',
    quantity: 0,
    type: 'ww'
  ),
  Product(
    name: 'WWAFAWDWG Anniversary Tank In Black',
    price: 46.00 * 16000,
    description: 'Cropped ribbed tank featuring art from WHEN WE ALL FALL ASLEEP, WHERE DO WE GO',
    imagePath: 'assets/images/ww_tank.png',
    quantity: 0,
    type: 'ww'
  ),
  Product(
    name: 'WWAFAWDWG Anniversary Tee In Black',
    price: 46.00 * 16000,
    description: 'Black t-shirt featuring art from WHEN WE ALL FALL ASLEEP, WHERE DO WE GO?',
    imagePath: 'assets/images/ww_tee.png',
    quantity: 0,
    type: 'ww'
  ),

];

final List<Product> cart = [];
final List<Product> order = [];

final List<String> paymentMethod = [
  'GoPay',
  'BCA Virtual Account',
  'OVO',
  'BRI Virtual Account',
];

String formatToRupiah(double amount) {
  final NumberFormat currencyFormatter = NumberFormat.currency(
    locale: 'id_ID', // Menggunakan locale Indonesia
    symbol: 'Rp', // Simbol mata uang
    decimalDigits: 2, // Jumlah digit desimal
  );
  return currencyFormatter.format(amount);
}