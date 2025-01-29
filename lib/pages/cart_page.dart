import 'package:billie_eilish_merch_app/components/my_button.dart';
import 'package:billie_eilish_merch_app/data/product.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  final Function(int) updateCartQuantity; // Callback untuk perubahan jumlah
  final Function() clearCart;
  const CartPage({
    super.key,
    required this.updateCartQuantity,
    required this.clearCart
  });

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  void incrementQuantity(Product item) {
    setState(() {
      item.quantity++;
      widget.updateCartQuantity(item.quantity); // Panggil callback untuk memperbarui jumlah keranjang
    });
  }

  void decrementQuantity(Product item) {
    setState(() {
      item.quantity--;
      if (item.quantity == 0) {
        cart.remove(item);
      }
      widget.updateCartQuantity(item.quantity); // Panggil callback untuk memperbarui jumlah keranjang
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cart Page',
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.bold
          ),
        ),
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.primary,
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Column(
        children: [
          Expanded(
            child: cart.isEmpty ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'YOUR CART IS EMPTY',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: 25,),
                  MyButton(
                    onTap: () => Navigator.pushNamed(context, '/shop_page'),
                    child: Text('Continue Shopping')
                  )
                ],
              )
            ) :
            ListView.builder(
              itemCount: cart.length,
              itemBuilder: (context, index) {
                final item = cart[index];

                return Container(
                  padding: EdgeInsets.all(12),
                  margin: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Theme.of(context).colorScheme.secondary),
                    borderRadius: BorderRadius.circular(12)
                  ),
                  child: ListTile(
                    leading: Image.asset(
                      item.imagePath,
                      width: 75,
                    ),
                    title: Text(
                      item.name,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    subtitle: Expanded(
                      child: Row(
                        children: [
                          Text(
                            formatToRupiah(item.quantity * item.price),
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                Expanded(
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.remove,
                                      color: Theme.of(context).colorScheme.primary,
                                    ),
                                    onPressed: () => decrementQuantity(item),
                                  ),
                                ),
                                Text(
                                  item.quantity.toString(),
                                  style: TextStyle(
                                    color: Theme.of(context).colorScheme.primary,
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(
                                    Icons.add,
                                    color: Theme.of(context).colorScheme.primary,
                                  ),
                                  onPressed: () => incrementQuantity(item),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            )
          ),

          if(cart.isNotEmpty)
            Container(
              padding: const EdgeInsets.all(50.0),
              child: MyButton(
                onTap: () => Navigator.pushNamed(context,'/payment_page'),
                child: Text('Checkout')
              ),
            )
        ],
      ),
    );
  }
}