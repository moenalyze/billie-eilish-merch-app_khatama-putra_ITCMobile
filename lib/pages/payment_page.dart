import 'package:billie_eilish_merch_app/components/my_text_form_field.dart';
import 'package:billie_eilish_merch_app/data/customer.dart';
import 'package:billie_eilish_merch_app/data/product.dart';
import 'package:billie_eilish_merch_app/main.dart';
import 'package:flutter/material.dart';

class PaymentPage extends StatefulWidget {
  final Function() clearCart; // Callback untuk perubahan jumlah
  const PaymentPage({
    super.key,
    required this.clearCart
  });

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final _formGloBalKey = GlobalKey<FormState>();

  void payNow(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Color.fromRGBO(21, 22, 46, 1),
        content: Text(
          'Payment Succeed!',
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary
          ),
          textAlign: TextAlign.center,
        ),
      )
    );

    // ignore: use_build_context_synchronously
    Navigator.pushReplacementNamed(context, '/order_page');

    setState(() {
      widget.clearCart();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(  
          'Payment Page',
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.bold
          ),
        ),
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Container(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Form(
              key: _formGloBalKey,
              child: Expanded(
                child: ListView(
                  children: [
                    MyTextFormField(
                      labelText: 'Fullname',
                      hintText: 'Enter your fullname',
                      onSaved: (value) {
                        customer.fullName = value!;
                      },
                    ),
                    SizedBox(height: 12,),
                    MyTextFormField(
                      labelText: 'Email',
                      hintText: 'Enter your email',
                      onSaved: (value) {
                        customer.email = value!;
                      },
                    ),
                    SizedBox(height: 12,),
                    MyTextFormField(
                      labelText: 'Address',
                      hintText: 'Enter your address',
                      onSaved: (value) {
                        customer.address = value!;
                      },
                    ),
                    SizedBox(height: 12,),
                    MyTextFormField(
                      labelText: 'Phone',
                      hintText: 'Enter your phone number',
                      onSaved: (value) {
                        customer.phone = value!;
                      },
                    ),
                    SizedBox(height: 12,),
                    Text(
                      'Payment Method',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary
                      ),
                    ),
                    SizedBox(height: 3,),
                    DropdownButton(
                      value: paymentValue,
                      focusColor: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      autofocus: true,
                      dropdownColor: Theme.of(context).colorScheme.primary,
                      items: paymentMethod.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(value),
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          paymentValue = value!;
                        });
                      },
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 12,),
                    Container(
                      padding: const EdgeInsets.all(50.0),
                      child: FilledButton(
                        onPressed: () {
                          if(_formGloBalKey.currentState!.validate()) {
                            _formGloBalKey.currentState!.save();
                            payNow(context);
                          }
                        },
                        style: FilledButton.styleFrom(
                          backgroundColor: Theme.of(context).colorScheme.secondary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)
                          )
                        ),
                        child: Text(
                          'Pay Now',
                          style: TextStyle(
                            color: Colors.black
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ),
          ],
        ),
      ),
    );
  }
}