import 'package:flutter/material.dart';
import 'package:swipable_stack/swipable_stack.dart';

class ProductDetailPage extends StatefulWidget {
  static const routeName = '/productdetail';
  const ProductDetailPage({super.key});

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  late final SwipableStackController _controller;
  final List<Map<String, String>> _products = [
    {'name': 'Product 1', 'price': '\$49.99', 'image': 'https://picsum.photos/300/300'},
    {'name': 'Product 2', 'price': '\$59.99', 'image': 'https://picsum.photos/301/300'},
    {'name': 'Product 3', 'price': '\$69.99', 'image': 'https://picsum.photos/302/300'},
  ];

  @override
  void initState() {
    super.initState();
    _controller = SwipableStackController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleSwipe(SwipeDirection direction, int index) {
    final productName = _products[index]['name'];
    switch (direction) {
      case SwipeDirection.left:
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Added $productName to cart')),
        );
        break;
      case SwipeDirection.right:
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Removed $productName from cart')),
        );
        break;
      case SwipeDirection.up:
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Shared $productName')),
        );
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Product Details')),
      body: Center(
        child: SwipableStack(
          controller: _controller,
          detectableSwipeDirections: const {
            SwipeDirection.left,
            SwipeDirection.right,
            SwipeDirection.up,
          },
          onSwipeCompleted: (index, direction) {
            _handleSwipe(direction, index);
          },
          itemCount: _products.length,
          builder: (context, properties) {
            final product = _products[properties.index];
            return SwipableProductCard(
              name: product['name']!,
              price: product['price']!,
              image: product['image']!,
            );
          },
        ),
      ),
    );
  }
}

class SwipableProductCard extends StatelessWidget {
  final String name;
  final String price;
  final String image;

  const SwipableProductCard({
    super.key,
    required this.name,
    required this.price,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.network(
            image,
            width: MediaQuery.of(context).size.width * 0.6,
            height: MediaQuery.of(context).size.height * 0.6,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return const Icon(Icons.error, size: 50, color: Colors.red);
            },
          ),
          const SizedBox(height: 20),
          Text(name, style: const TextStyle(fontSize: 24)),
          const SizedBox(height: 10),
          Text(price, style: const TextStyle(fontSize: 20, color: Colors.green)),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(icon: const Icon(Icons.share), onPressed: () {}),
              IconButton(icon: const Icon(Icons.shopping_cart), onPressed: () {}),
              IconButton(icon: const Icon(Icons.delete), onPressed: () {}),
              IconButton(icon: const Icon(Icons.favorite_border), onPressed: () {}),
              IconButton(icon: const Icon(Icons.person_add), onPressed: () {}),
            ],
          ),
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String name;
  final String price;
  final String image;

  const ProductCard({
    super.key,
    required this.name,
    required this.price,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black,
      elevation: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image.network(
              image,
              fit: BoxFit.cover,
              width: double.infinity,
              errorBuilder: (context, error, stackTrace) {
                return const Center(child: Icon(Icons.error, size: 50, color: Colors.red));
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(height: 5),
                Text(price, style: const TextStyle(fontSize: 14, color: Colors.green)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
