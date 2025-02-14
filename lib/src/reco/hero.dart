import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:reco/src/reco/pd.dart';


class BuildHeroSection extends StatelessWidget {
  const BuildHeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> topProducts = List.generate(10, (index) => {
      'image': 'https://picsum.photos/300/200?random=$index',
      'name': 'Product ${index + 1}',
      'price': '\$${(index + 1) * 10 + 19.99}'
    });

    return CarouselSlider(
      options: CarouselOptions(
        height: 300,
        autoPlay: true,
        enlargeCenterPage: true,
        aspectRatio: 16 / 9,
        viewportFraction: 0.9,
      ),
      items: topProducts.map((product) {
        return GestureDetector(
         onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ProductDetailPage(),
              ),
            );
          },
          child: _buildCarouselCard(
            product['image']!,
            product['name']!,
            product['price']!,
          ),
        );
      }).toList(),
    );
  }

  Widget _buildCarouselCard(String imageUrl, String title, String price) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 5,
      child: Stack(
        alignment: Alignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              imageUrl,
              width: double.infinity,
              height: 300,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              
              
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                Text(
                  price,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  ),
                  child: const Text('Shop Now', style: TextStyle(fontSize: 18)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
