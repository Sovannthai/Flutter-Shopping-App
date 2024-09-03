import 'package:first_app/screens/rating_review/rating_review.dart';
import 'package:flutter/material.dart';

class AllReview extends StatefulWidget {
  const AllReview({super.key});

  @override
  State<AllReview> createState() => _AllReviewState();
}

class _AllReviewState extends State<AllReview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('All Reviews'),
        ),
        body: ListView(
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
        ));
  }
}
