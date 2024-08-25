import 'package:first_app/screens/Home/search_screen.dart';
import 'package:flutter/material.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  final List<Map<String, dynamic>> products = [
    {
      'image': 'assets/images/product.jpg',
      'name': 'T-Shirt',
      'price': 21.00,
      'oldPrice': 30.00,
      'discount': 30,
      'rating': 4.7,
      'reviews': 8,
      'isFavorite': true,
    },
    {
      'image': 'assets/images/recomment_product.jpg',
      'name': 'Girl T-shirt',
      'price': 21.00,
      'oldPrice': 30.00,
      'discount': 30,
      'rating': 4.7,
      'reviews': 8,
      'isFavorite': true,
    },
    {
      'image': 'assets/images/popular_product.jpg',
      'name': 'Blue T-shirt',
      'price': 21.00,
      'oldPrice': 30.00,
      'discount': 30,
      'rating': 4.7,
      'reviews': 8,
      'isFavorite': true,
    },
    {
      'image': 'assets/images/search.jpg',
      'name': 'Women T-shirt',
      'price': 21.00,
      'oldPrice': 30.00,
      'discount': 30,
      'rating': 4.7,
      'reviews': 8,
      'isFavorite': true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('WISHLIST'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SearchScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            return Container(
              margin: const EdgeInsets.all(3),
              height: 120,
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                border: Border.all(color: Colors.grey[200]!),
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      product['image'],
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 12.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          product['name'],
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 16,
                            ),
                            const SizedBox(width: 4.0),
                            Text(
                              '${product['rating']}',
                              style: const TextStyle(fontSize: 12),
                            ),
                            const SizedBox(width: 4.0),
                            Text(
                              '(${product['reviews']})',
                              style: const TextStyle(
                                  fontSize: 12, color: Colors.grey),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            if (product['discount'] != null)
                              Text(
                                "\$${product['price'].toStringAsFixed(2)}",
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            if (product['discount'] != null)
                              const SizedBox(width: 4.0),
                            if (product['discount'] != null)
                              Text(
                                "\$${product['oldPrice'].toStringAsFixed(2)}",
                                style: const TextStyle(
                                  fontSize: 12,
                                  decoration: TextDecoration.lineThrough,
                                  color: Colors.grey,
                                ),
                              ),
                            if (product['discount'] == null)
                              Text(
                                "\$${product['price'].toStringAsFixed(2)}",
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  IconButton(
                    icon: Icon(
                      product['isFavorite']
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      setState(() {
                        product['isFavorite'] = !product['isFavorite'];
                      });
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
