import 'package:flutter/material.dart';

class BuildCategoriesSection extends StatelessWidget {
  const BuildCategoriesSection({super.key});

  // Define categories as a constant to avoid rebuilding on every render
  static const List<Map<String, dynamic>> categories = [
    {'name': 'Fashion', 'route': '/productdetail'},
    {'name': 'Electronics', 'route': '/productdetail'},
    {'name': 'Hawker', 'route': '/productdetail'},
    {'name': 'Food&Drinks', 'route': '/productdetail'},
    {'name': 'Cars', 'route': '/productdetail'},
    {'name': 'Services', 'route': '/productdetail'},
    {'name': 'Books', 'route': '/productdetail'},
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Categories',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: categories
                .map((category) => CategoryCard(
                      name: category['name'] as String,
                      //icon: category['icon'] as IconData,
                      route: category['route'] as String,
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String name;
  //final IconData icon;
  final String route;

  const CategoryCard({
    super.key,
    required this.name,
    //required this.icon,
    required this.route,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _navigateToRoute(context);
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Icon(icon, size: 40),
              const SizedBox(height: 10),
              Text(
                name,
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToRoute(BuildContext context) {
    try {
      Navigator.pushNamed(context, route);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to navigate to the selected category.')),
      );
    }
  }
}