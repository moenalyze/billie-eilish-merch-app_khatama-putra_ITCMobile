import 'package:billie_eilish_merch_app/components/my_button.dart';
import 'package:billie_eilish_merch_app/data/customer.dart';
import 'package:billie_eilish_merch_app/data/product.dart';
import 'package:flutter/material.dart';

class OrderPage extends StatelessWidget {
  final String paymentValue;
  const OrderPage({
    super.key,
    required this.paymentValue
  });

  String totalOrder() {
    double total = 0;
    for(var item in order){
      total += (item.price * item.quantity);
    }

    return formatToRupiah(total); //Rp8.111.360,00
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(  
          'Order Page',
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.bold
          ),
        ),
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          // border: Border.all(color: Theme.of(context).colorScheme.secondary),
          borderRadius: BorderRadius.circular(12)
        ),
        child: order.isEmpty ? 
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                    'YOU HAVE NOT ORDERED YET',
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
        
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [ 
              Table(
                columnWidths: {
                  0 : IntrinsicColumnWidth(),
                  1 : IntrinsicColumnWidth(),
                  2 : IntrinsicColumnWidth(),
                },
                children: [
                  TableRow(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Name',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary
                          )
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          ' : ',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary
                          )
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          customer.fullName,
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary
                          )
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Email',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary
                          )
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          ' : ',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary
                          )
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          customer.email,
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary
                          )
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Phone',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary
                          )
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          ' : ',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary
                          )
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          customer.phone,
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary
                          )
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Shipping Address',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary
                          )
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          ' : ',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary
                          )
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          customer.address,
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary
                          )
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Payment Method',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary
                          )
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          ' : ',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary
                          )
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          paymentValue,
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary
                          )
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10,),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Theme.of(context).colorScheme.secondary),
                    borderRadius: BorderRadius.circular(12)
                  ),
                  child: ListView.builder(
                    itemCount: order.length,
                    itemBuilder: (context, index) {
                      final item = order[index];
                    
                      return Container(
                        margin: EdgeInsets.all(5),
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
                                  '${item.quantity} x ${formatToRupiah(item.price)}',
                                  style: TextStyle(
                                    color: Theme.of(context).colorScheme.primary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                )
              ),
              SizedBox(height: 10,),
              Text(
                'Total: ${totalOrder()}',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                ),
              )
            ],
          ),
      ),
    );
  }
}