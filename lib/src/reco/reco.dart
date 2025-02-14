import 'package:flutter/material.dart';
import 'package:reco/src/reco/categor.dart';
import 'package:reco/src/reco/fps.dart';
import 'package:reco/src/reco/hero.dart';

class ECommerceLandingPage extends StatelessWidget {
  const ECommerceLandingPage({super.key});

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reccomend'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              Navigator.pushNamed(context, '/search');
            },
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.pushNamed(context, '/cart');
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                // color: Colors.blue,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage('https://picsum.photos/200'), // Replace with a valid image URL or use AssetImage
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'User Name', // Replace with dynamic user name if needed
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.near_me),
              title: const Text('Near me'),
              onTap: () {
                Navigator.pushNamed(context, '/productdetail');
              },
            ),
            ListTile(
              leading: const Icon(Icons.favorite),
              title: const Text('Following'),
              onTap: () {
                Navigator.pushNamed(context, '/productdetail');
              },
            ),
            ListTile(
              leading: const Icon(Icons.upload),
              title: const Text('Upload'),
              onTap: () {
                Navigator.pushNamed(context, '/upload');
              },
            ),
            ListTile(
              leading: const Icon(Icons.live_tv),
              title: const Text('Live'),
              onTap: () {
                Navigator.pushNamed(context, '/featured');
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profile'),
              onTap: () {
                Navigator.pushNamed(context, '/profile');
              },
            ),
            ListTile(
              leading: const Icon(Icons.message),
              title: const Text('Messages'),
              onTap: () {
                Navigator.pushNamed(context, '/featured');
              },
            ),
            ListTile(
              leading: const Icon(Icons.shopping_cart),
              title: const Text('Cart'),
              onTap: () {
                Navigator.pushNamed(context, '/cart');
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                Navigator.pushNamed(context, '/settings');
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            BuildHeroSection(key: key,),
            BuildCategoriesSection(key: key,),
            const SizedBox(height: 20),
            FeaturedProductsSection(key: key,),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}