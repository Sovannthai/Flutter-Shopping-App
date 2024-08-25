import 'package:first_app/screens/Home/product_cart.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final List<Map<String, dynamic>> products = [
    {
      'image': 'assets/images/product.jpg',
      'name': 'Cool White T-shirt',
      'price': 19.00,
      'oldPrice': 110,
      'discount': null,
      'rating': 5.0,
      'reviews': 12,
    },
    {
      'image': 'assets/images/recomment_product.jpg',
      'name': 'Girl T-shirt',
      'price': 19.00,
      'oldPrice': 110.00,
      'discount': 20,
      'rating': 5.0,
      'reviews': 12,
    },
    {
      'image': 'assets/images/popular_product.jpg',
      'name': 'Blue T-shirt',
      'price': 19.00,
      'oldPrice': 110.00,
      'discount': 20,
      'rating': 5.0,
      'reviews': 12,
    },
    {
      'image': 'assets/images/search.jpg',
      'name': 'Women T-shirt',
      'price': 19.00,
      'oldPrice': 110.00,
      'discount': 20,
      'rating': 5.0,
      'reviews': 12,
    },
  ];

  String query = '';

  @override
  Widget build(BuildContext context) {
    final filteredProducts = products.where((product) {
      return query.isEmpty ||
          product['name']
              .toString()
              .toLowerCase()
              .contains(query.toLowerCase()) ||
          product['price'].toString().contains(query) ||
          product['reviews'].toString().contains(query);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Container(
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: TextField(
            onChanged: (value) {
              setState(() {
                query = value;
              });
            },
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: 'Search product',
              prefixIcon: Icon(Icons.search, color: Colors.grey),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: filteredProducts.isEmpty
            ? const Center(
                child: Text(
                  'No product found',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              )
            : GridView.builder(
                padding: EdgeInsets.zero,
                itemCount: filteredProducts.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                  childAspectRatio: 0.7,
                ),
                itemBuilder: (context, index) {
                  final product = filteredProducts[index];
                  return ProductCard(
                    image: product['image'],
                    name: product['name'],
                    price: product['price'],
                    oldPrice: product['oldPrice'],
                    discount: product['discount'],
                    rating: product['rating'],
                    reviews: product['reviews'],
                  );
                },
              ),
      ),
    );
  }
}
