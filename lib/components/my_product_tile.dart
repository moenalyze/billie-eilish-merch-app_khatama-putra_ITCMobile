import 'package:billie_eilish_merch_app/data/product.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyProductTile extends StatefulWidget {
  final Product product;
  final Function(int) updateCartQuantity; // Callback untuk perubahan jumlah
  const MyProductTile({
    super.key,
    required this.product,
    required this.updateCartQuantity
  });

  @override
  State<MyProductTile> createState() => _MyProductTileState();
}

class _MyProductTileState extends State<MyProductTile> {
  void addToCart(Product item, BuildContext context) {
    setState(() {
      item.quantity++;
      if(!cart.contains(item)){
        cart.add(item);
      }
      widget.updateCartQuantity(item.quantity); // Panggil callback untuk memperbarui jumlah keranjang
    });

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Color.fromRGBO(21, 22, 46, 1),
        content: Text(
          'Item added!',
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
          ),
          textAlign: TextAlign.center,
        ),
      )
    );
  }

  // Untuk format ke Rupiah
  String formatToRupiah(double amount) {
    final NumberFormat currencyFormatter = NumberFormat.currency(
      locale: 'id_ID', // Menggunakan locale Indonesia
      symbol: 'Rp', // Simbol mata uang
      decimalDigits: 2, // Jumlah digit desimal
    );
    return currencyFormatter.format(amount);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromRGBO(21, 22, 46, 1),
        borderRadius: BorderRadius.circular(12)
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(25),
      width: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  width: double.infinity,
                  padding: EdgeInsets.all(25),
                  child: Image.asset(widget.product.imagePath),
                ),
              ),
              SizedBox(height: 25,),
              Text(
                widget.product.name,
                style: TextStyle(
                  fontFamily: 'Helvetica Neue',
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 20
                ),
              ),
              SizedBox(height: 10,),
              Text(
                widget.product.description,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                formatToRupiah(widget.product.price),
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(12)
                ),
                child: IconButton(
                  onPressed: () => addToCart(widget.product, context),
                  icon: Icon(Icons.add),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}