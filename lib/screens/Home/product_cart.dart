import 'package:first_app/screens/Home/home_screen.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatefulWidget {
  final String image;
  final String name;
  final double price;
  final double? oldPrice;
  final int? discount;
  final double rating;
  final int reviews;

  ProductCard({
    required this.image,
    required this.name,
    required this.price,
    this.oldPrice,
    this.discount,
    required this.rating,
    required this.reviews,
  });

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),
        );
      },
      child: Container(
        height: 330,
        width: 300,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
          color: Colors.white,
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                  child: Image.asset(
                    widget.image,
                    height: 180,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover, // Adjust image fit if necessary
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    widget.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Text(
                        "\$ ${widget.price.toString()}",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      if (widget.oldPrice != null)
                        Text(
                          '\$${widget.oldPrice}',
                          style: const TextStyle(
                            fontSize: 12,
                            decoration: TextDecoration.lineThrough,
                            color: Colors.grey,
                          ),
                        ),
                    ],
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          const Icon(Icons.star, color: Colors.amber, size: 16),
                          const SizedBox(width: 4),
                          Text(
                            '${widget.rating}',
                            style: const TextStyle(fontSize: 12),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '(${widget.reviews})',
                            style: const TextStyle(
                                fontSize: 12, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          ///xxx
                        },
                        child: Container(
                            width: 30,
                            height: 30,
                            decoration: const BoxDecoration(
                                color: Colors.amber, shape: BoxShape.circle),
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                            )),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            if (widget.discount != null)
              Positioned(
                top: 8,
                left: 8,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  color: Colors.red,
                  child: Text(
                    '${widget.discount}% OFF',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            Positioned(
              top: 15,
              right: 25,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    isFavorite = !isFavorite;
                  });
                },
                child: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}