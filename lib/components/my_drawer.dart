import 'package:billie_eilish_merch_app/components/list_tile.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
            children: [
              DrawerHeader(
                child: Image.asset('assets/images/hmhas_logo.png'),
              ),
              SizedBox(height: 25,),
              MyListTile(
                icon: Icons.home,
                text: 'S H O P',
                onTap: () => Navigator.pop(context)
              ),
              MyListTile(
                icon: Icons.shopping_cart,
                text: 'C A R T',
                onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/cart_page');
              }),
              MyListTile(
                icon: Icons.local_shipping,
                text: 'O R D E R',
                onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/order_page');
              }),
            ],
           ),
           Padding(
             padding: const EdgeInsets.only(bottom: 25.0),
             child: MyListTile(icon: Icons.logout, text: 'Exit', onTap: () => Navigator.pushNamed(context, '/intro_page')),
           ),
          ],
      ),
    );
  }
}