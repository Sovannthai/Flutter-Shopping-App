import 'package:first_app/screens/Category/category_detail.dart';
import 'package:first_app/screens/cart/cart.dart';
import 'package:first_app/screens/rating_review/rating_review.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({super.key});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail>
    with TickerProviderStateMixin {
  final List<bool> _bestSelling = List.generate(6, (_) => false);
  final List<String> imgList = [
    'assets/images/product.jpg',
    'assets/images/recomment_product.jpg',
    'assets/images/popular_product.jpg',
  ];

  int _selectedTabIndex = 0;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _toggleBestSellingFavorite(int index) {
    setState(() {
      _bestSelling[index] = !_bestSelling[index];
    });
  }

  void _onTabButtonPressed(int index) {
    setState(() {
      _selectedTabIndex = index;
      _tabController.animateTo(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  autoPlay: true,
                  enlargeCenterPage: false,
                  viewportFraction: 1,
                  enableInfiniteScroll: true,
                  height: MediaQuery.of(context).size.width * 0.8,
                ),
                items: imgList
                    .map((item) => Image.asset(
                          item,
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.width,
                          fit: BoxFit.cover,
                        ))
                    .toList(),
              ),
              Positioned(
                top: 20,
                left: 20,
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
              Positioned(
                top: 20,
                right: 20,
                child: InkWell(
                  onTap: () {
                    // Handle favorite button press
                  },
                  child: const Icon(
                    Icons.favorite_border,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              children: [
                Text(
                  "T-shirt",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                Icon(Icons.star, color: Colors.amber),
                SizedBox(width: 4),
                Text(
                  "5.0",
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                const Text(
                  "\$99.9",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.brown,
                  ),
                ),
                const SizedBox(width: 8),
                const Text(
                  "\$199.00",
                  style: TextStyle(fontSize: 16, color: Colors.red),
                ),
                const SizedBox(width: 8),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.red,
                  ),
                  child: const Text(
                    "30% OFF",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () => _onTabButtonPressed(0),
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      _selectedTabIndex == 0 ? Colors.brown : Colors.grey,
                ),
                child: const Text(
                  'Description',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              ElevatedButton(
                onPressed: () => _onTabButtonPressed(1),
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      _selectedTabIndex == 1 ? Colors.brown : Colors.grey,
                ),
                child: const Text(
                  'Review',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          "Welcome to dinoclaire.my shop!We provide the best service and the best beauty products. Wholesale please. Welcome to dinoclaire. my shop! We provide the best service and the best beauty products. Wholesale please.see more",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Select Size',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          _buildSizeSelector(),
                        ],
                      ),
                      _buildSectionTitle('Related Products', () {}),
                      const SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: SizedBox(
                                width: 170.0,
                                height: 280.0,
                                child: ProductCard(
                                  image: 'assets/images/popular_product.jpg',
                                  name: 'Tshirt',
                                  price: 99.00,
                                  rating: 5,
                                  reviews: 10,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: SizedBox(
                                width: 170.0,
                                height: 280.0,
                                child: ProductCard(
                                  image: 'assets/images/recomment_product.jpg',
                                  name: 'Tshirt',
                                  price: 99.00,
                                  rating: 5,
                                  reviews: 10,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: SizedBox(
                                width: 170.0,
                                height: 280.0,
                                child: ProductCard(
                                  image: 'assets/images/product.jpg',
                                  name: 'Tshirt',
                                  price: 99.00,
                                  rating: 5,
                                  reviews: 10,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: SizedBox(
                                width: 170.0,
                                height: 280.0,
                                child: ProductCard(
                                  image: 'assets/images/search.jpg',
                                  name: 'Tshirt',
                                  price: 99.00,
                                  rating: 5,
                                  reviews: 10,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          child: RatingAndReview(
                            averageRating: 4.5,
                            totalReviews: 120,
                            reviews: [
                              Review(
                                userName: "John Doe",
                                userImage: "assets/images/thai.jpg",
                                date: "June 10, 2023",
                                rating: 4.5,
                                comment:
                                    "Recently I have purchased this perfume and it’s fragrance is very nice, I love it",
                                images: [
                                  "assets/images/popular_product.jpg",
                                  "assets/images/popular_product.jpg"
                                ],
                              ),
                              Review(
                                userName: "Jane Doe",
                                userImage: "assets/images/me.jpg",
                                date: "June 10, 2023",
                                rating: 4.0,
                                comment:
                                    "The product quality is really good, satisfied with the purchase.",
                                images: [
                                  "assets/images/product.jpg",
                                  "assets/images/product.jpg"
                                ],
                              ),
                              Review(
                                userName: "Noun SreyPech",
                                userImage: "assets/images/image.png",
                                date: "June 10, 2023",
                                rating: 4.0,
                                comment:
                                    "The product quality is really good, satisfied with the purchase.",
                                images: [
                                  "assets/images/search.jpg",
                                  "assets/images/search.jpg"
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 25),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width / 8,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF683212),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 8),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const CartScreen()));
                },
                child: const Text(
                  'Add to cart',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSizeOption(String size, bool isSelected) {
    return GestureDetector(
      onTap: () {
        // Handle size selection logic
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: isSelected ? Colors.brown : Colors.white,
          border: Border.all(
            color: isSelected ? Colors.brown : Colors.grey,
            width: 1,
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: Colors.brown.withOpacity(0.3),
                    blurRadius: 6,
                    offset: Offset(0, 3),
                  ),
                ]
              : [],
        ),
        child: Text(
          size,
          style: TextStyle(
            fontSize: 10,
            color: isSelected ? Colors.white : Colors.grey[800],
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _buildSizeSelector() {
    List<String> sizes = ['M', 'L', 'XL', 'XXL'];
    String selectedSize = 'M'; // Example: track the selected size

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: sizes.map((size) {
          bool isSelected = size == selectedSize;
          return _buildSizeOption(size, isSelected);
        }).toList(),
      ),
    );
  }

  Widget _buildSectionTitle(String title, VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextButton(
            onPressed: onPressed,
            child: const Text(
              'See More',
              style: TextStyle(color: Colors.brown),
            ),
          ),
        ],
      ),
    );
  }
}
