import 'package:first_app/screens/Category/category_detail.dart';
import 'package:first_app/screens/Home/home_screen.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    switch (index) {
      case 0:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const HomeScreen()));
        break;
      case 1:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const CategoryScreen()));
        break;
      case 2:
        Navigator.pushNamed(context, '/order');
        break;
      case 3:
        Navigator.pushNamed(context, '/profile');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Category'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Implement navigation logic here
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0), // Add padding around the row
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          blurRadius: 4,
                          spreadRadius: 2,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(8.0),
                      leading: Image.asset(
                        'assets/icons/category_icon.png',
                        width: 40,
                        height: 40,
                      ),
                      title: const Text('T-Shirt'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CategoryDetailScreen(
                              categoryName: 'T-shirts',
                              products: [
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
                                  'image':
                                      'assets/images/recomment_product.jpg',
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
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          blurRadius: 4,
                          spreadRadius: 2,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(8.0),
                      leading: Image.asset(
                        'assets/icons/dress_icon.png',
                        width: 40,
                        height: 40,
                      ),
                      title: const Text('Dress'),
                      onTap: () {
                        // Implement category selection logic here
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/home.png'),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/category.png'),
            label: 'Category',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/bag.png'),
            label: 'Order',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/person.png'),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.brown,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped, // This calls the method when an item is tapped
      ),
    );
  }
}
