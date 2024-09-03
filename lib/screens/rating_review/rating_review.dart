  import 'package:first_app/screens/rating_review/all_review.dart';
  import 'package:flutter/material.dart';
  import 'package:flutter_rating_bar/flutter_rating_bar.dart';

  class RatingAndReview extends StatelessWidget {
    final double averageRating;
    final int totalReviews;
    final List<Review> reviews;

    const RatingAndReview({
      required this.averageRating,
      required this.totalReviews,
      required this.reviews, 
    });

    @override
    Widget build(BuildContext context) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Reviews & Ratings",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> const AllReview()),);
                  },
                  child: const Text(
                    "See More",
                    style: TextStyle(color: Colors.orange),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Text(
                  averageRating.toString(),
                  style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 8),
                RatingBar.builder(
                  initialRating: averageRating,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemSize: 30.0,
                  ignoreGestures: true,
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {},
                ),
                const SizedBox(width: 8),
                Text(
                  '$totalReviews Review${totalReviews > 1 ? 's' : ''}',
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          const Divider(),
          ...reviews.map((review) => ReviewCard(review: review)).toList(),
        ],
      );
    }
  }

  class ReviewCard extends StatelessWidget {
    final Review review;

    const ReviewCard({required this.review});

    @override
    Widget build(BuildContext context) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(review.userImage),
                  radius: 20,
                ),
                const SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      review.userName,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      review.date,
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                const Spacer(),
                RatingBar.builder(
                  initialRating: review.rating,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemSize: 20.0,
                  ignoreGestures: true,
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {},
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(review.comment),
            if (review.images.isNotEmpty) ...[
              const SizedBox(height: 8),
              Row(
                children: review.images.map((image) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Image.asset(
                      image,
                      width: 130,
                      height: 130,
                    ),
                  );
                }).toList(),
              ),
            ],
            const Divider(),
          ],
        ),
      );
    }
  }

  class Review {
    final String userName;
    final String userImage;
    final String date;
    final double rating;
    final String comment;
    final List<String> images;

    Review({
      required this.userName,
      required this.userImage,
      required this.date,
      required this.rating,
      required this.comment,
      this.images = const [],
    });
  }
