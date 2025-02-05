import 'package:billie_eilish_merch_app/components/my_drawer.dart';
import 'package:billie_eilish_merch_app/components/my_product_tile.dart';
import 'package:billie_eilish_merch_app/data/product.dart';
import 'package:flutter/material.dart';

class ShopPage extends StatefulWidget {
  final int cartQuantity;
  final Function(int) updateCartQuantity; // Callback untuk perubahan jumlah
  const ShopPage({
    super.key,
    required this.updateCartQuantity,
    required this.cartQuantity
  });

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  void onQuantityChanged(int quantity) {
    setState(() {
      widget.updateCartQuantity(quantity); // Refresh ShopPage
    });
  }

  @override
  Widget build(BuildContext context) {
    final hmhasProduct = products.where((product) => product.type == 'hmhas').toList();

    final newProduct = products.where((product) => product.type == 'newCollection').toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Shop Page',
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.bold
          ),
        ),
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.primary,
        actions: [
          Stack(
            children: [
              IconButton(
                color: Theme.of(context).colorScheme.secondary,
                onPressed: () => Navigator.pushNamed(context, '/cart_page'),
                icon: Icon(Icons.shopping_cart_outlined),
              ),
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red,
                ),
                child: Center(
                  child: Text(
                    widget.cartQuantity.toString(),
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
      drawer: MyDrawer(),
      body: ListView(
        children: [
          SizedBox(height: 25,),
          Center(
            child: Text(
              'Merch from the greatest singer',
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 5.0),
            // margin: EdgeInsets.symmetric(vertical: 5.0),
            child: Text(
              'HIT ME HARD AND SOFT',
              style:TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          SizedBox(
            height: 550,
            child: ListView.builder(
              itemCount: hmhasProduct.length,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.all(15),
              itemBuilder: (context, index) {
                final product = hmhasProduct[index];
            
                return MyProductTile(
                  product: product,
                  updateCartQuantity: (int quantity) {
                    onQuantityChanged(quantity); // Update cart quantity setiap kali ada perubahan
                  },
                );
              }
            ),
          ),
          SizedBox(
            height: 550,
            child: ListView.builder(
              itemCount: newProduct.length,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.all(15),
              itemBuilder: (context, index) {
                final product = newProduct[index];
            
                return MyProductTile(
                  product: product,
                  updateCartQuantity: (int quantity) {
                    onQuantityChanged(quantity); // Update cart quantity setiap kali ada perubahan
                  },
                );
              }
            ),
          ),
        ],
      ),
    );
  }
}