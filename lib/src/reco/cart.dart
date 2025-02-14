import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  static const routeName = '/cart';
  const CartPage({super.key});

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final List<Map<String, dynamic>> cartItems = [
    {'name': 'Product 1', 'price': 49.99, 'image': 'https://picsum.photos/200'},
    {'name': 'Product 2', 'price': 59.99, 'image': 'https://picsum.photos/200'},
    {'name': 'Product 3', 'price': 69.99, 'image': 'https://picsum.photos/200'},
  ];
  double discount = 0;
  
  double get totalCost => cartItems.fold<double>(0, (sum, item) => sum + item['price']) - discount;

  void applyCoupon(String code) {
    setState(() {
      discount = code == 'DISCOUNT10' ? 10 : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Shopping Cart')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  final item = cartItems[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      leading: Image.network(item['image'], width: 50, height: 50, fit: BoxFit.cover),
                      title: Text(item['name']),
                      subtitle: Text('\$${item['price'].toStringAsFixed(2)}'),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          setState(() {
                            cartItems.removeAt(index);
                          });
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Enter Coupon Code',
                border: OutlineInputBorder(),
              ),
              onSubmitted: applyCoupon,
            ),
            const SizedBox(height: 10),
            Text('Total: \$${totalCost.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
              child: const Text('Checkout', style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}
