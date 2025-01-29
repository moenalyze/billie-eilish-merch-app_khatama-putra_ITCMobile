import 'package:billie_eilish_merch_app/components/my_button.dart';
import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/hmhas_logo.png'),
            SizedBox(height: 25,),
            Text(
              'BILLIE EILISH',
              style: TextStyle(
                fontFamily: 'Podium Sharp',
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Theme.of(context).colorScheme.secondary
              ),
            ),
            Text(
              'Official Merch App',
              style: TextStyle(
                fontFamily: 'Podium Sharp',
                fontWeight: FontWeight.bold,
                fontSize: 10,
                color: Theme.of(context).colorScheme.secondary
              ),
            ),
             SizedBox(height: 25,),
            Text(
              'Buy. Collect. Obsessed',
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
                fontFamily: 'Helvetica'
              ),
            ),
            SizedBox(
              height: 25,
            ),
            MyButton(
              onTap: () => Navigator.pushReplacementNamed(context, '/shop_page'),
              child: Icon(Icons.arrow_forward)),
          ],
        ),
      ),
    );
  }
}
