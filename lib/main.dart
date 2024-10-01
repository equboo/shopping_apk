// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:shopping_aplikasi/detail_produk.dart';

void main() {
  runApp(ShoppingApp());
}

// Stateless Widget untuk halaman utama
class ShoppingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shopping App',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily: 'Arial',
      ),
      home: ProductListPage(),
    );
  }
}

// Stateful Widget untuk daftar produk
class ProductListPage extends StatefulWidget {
  @override
  _ProductListPageState createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  List<Map<String, String>> products = [
    {
      'name': 'Sepatu',
      'image': 'https://via.placeholder.com/150',
      'price': 'Rp 250.000'
    },
    {
      'name': 'Baju',
      'image': 'https://via.placeholder.com/150',
      'price': 'Rp 150.000'
    },
    {
      'name': 'Celana',
      'image': 'https://via.placeholder.com/150',
      'price': 'Rp 200.000'
    },
    {
      'name': 'Topi',
      'image': 'https://via.placeholder.com/150',
      'price': 'Rp 50.000'
    },
    {
      'name': 'Tas',
      'image': 'https://via.placeholder.com/150',
      'price': 'Rp 300.000'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Produk Terbaik'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 2 / 3,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            return ProductCard(
              name: products[index]['name']!,
              image: products[index]['image']!,
              price: products[index]['price']!,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailPage(
                      product: products[index]['name']!,
                      image: products[index]['image']!,
                      price: products[index]['price']!,
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

// Stateless Widget untuk kartu produk
class ProductCard extends StatelessWidget {
  final String name;
  final String image;
  final String price;
  final VoidCallback onTap;

  ProductCard({
    required this.name,
    required this.image,
    required this.price,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                child: Image.network(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                name,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                price,
                style: TextStyle(fontSize: 16, color: Colors.grey[600]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
