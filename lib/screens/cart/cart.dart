import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final List<CartItem> cartItems = [
    CartItem(
        image: 'assets/images/product.jpg',
        name: 'T-Shirt',
        price: 21.00,
        oldPrice: 30.00,
        quantity: 1,
        isSelected: false),
    CartItem(
        image: 'assets/images/recomment_product.jpg',
        name: 'T-Shirt',
        price: 21.00,
        oldPrice: 30.00,
        quantity: 1,
        isSelected: false),
    CartItem(
        image: 'assets/images/search.jpg',
        name: 'T-Shirt',
        price: 21.00,
        oldPrice: 30.00,
        quantity: 1,
        isSelected: false),
    CartItem(
        image: 'assets/images/popular_product.jpg',
        name: 'T-Shirt',
        price: 21.00,
        oldPrice: 30.00,
        quantity: 1,
        isSelected: false),
    CartItem(
        image: 'assets/images/thai.jpg',
        name: 'T-Shirt',
        price: 21.00,
        oldPrice: 30.00,
        quantity: 1,
        isSelected: false),
    CartItem(
        image: 'assets/images/me.jpg',
        name: 'T-Shirt',
        price: 21.00,
        oldPrice: 30.00,
        quantity: 1,
        isSelected: false),
  ];

  void _deleteItem(int index) {
    setState(() {
      cartItems.removeAt(index);
    });
  }

  void _confirmDeleteItem(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Delete Item"),
          content: const Text(
              "Are you sure you want to delete this item from your cart?"),
          actions: [
            TextButton(
              child: const Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text("Delete"),
              onPressed: () {
                _deleteItem(index);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cart'),
        centerTitle: false,
      ),
      backgroundColor: Colors.white,
      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(8),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  SizedBox(
                    height: 80,
                    width: 80,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        cartItems[index].image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            cartItems[index].name,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 4),
                          const Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 14,
                              ),
                              SizedBox(width: 2),
                              Text(
                                "4.7 (8)", // Update this to reflect actual ratings
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              Text(
                                "\$${cartItems[index].price}",
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                "\$${cartItems[index].oldPrice}",
                                style: const TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  color: Colors.red,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Checkbox(
                        value: cartItems[index].isSelected,
                        activeColor: Colors.brown,
                        onChanged: (value) {
                          setState(() {
                            cartItems[index].isSelected = value!;
                          });
                        },
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.remove, color: Colors.brown),
                            onPressed: () {
                              if (cartItems[index].quantity == 1) {
                                _confirmDeleteItem(index);
                              } else {
                                setState(() {
                                  cartItems[index].quantity--;
                                });
                              }
                            },
                          ),
                          Text(
                            '${cartItems[index].quantity}',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.add, color: Colors.brown),
                            onPressed: () {
                              setState(() {
                                cartItems[index].quantity++;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.brown, // Background color of the button
            borderRadius: BorderRadius.circular(10.0), // Rounded corners
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3), // Shadow position
              ),
            ],
          ),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: Colors.transparent,
              padding: const EdgeInsets.symmetric(vertical: 15),
            ),
            onPressed: () {
              if (cartItems.any((item) => item.isSelected)) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Proceeding to Checkout...'),
                  ),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Please select at least one item.'),
                  ),
                );
              }
            },
            child: const Text(
              'Check Out',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}

class CartItem {
  final String image;
  final String name;
  final double price;
  final double oldPrice;
  int quantity;
  bool isSelected;

  CartItem({
    required this.image,
    required this.name,
    required this.price,
    required this.oldPrice,
    this.quantity = 1,
    this.isSelected = false,
  });
}
