import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({super.key});

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  int rating = 0;
  String reviewText = '';
  XFile? pickedImage;
  bool isImageLoading = false;

  void _handleRatingChange(int newRating) {
    setState(() {
      rating = newRating;
    });
  }

  void _handleReviewTextChanged(String newText) {
    setState(() {
      reviewText = newText;
    });
  }

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();

    setState(() {
      isImageLoading = true;
    });

    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        pickedImage = image;
      });
    }

    setState(() {
      isImageLoading = false;
    });
  }

  void _submitReview() {
    // Implement review submission logic here
    // Use rating, reviewText, and pickedImage values
    print('Rating: $rating');
    print('Review: $reviewText');
    print('Image: ${pickedImage?.path}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WRITE A REVIEW'),
        centerTitle: false,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  'Give a rating',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 8.0),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: List.generate(5, (index) {
                    return GestureDetector(
                      onTap: () => _handleRatingChange(index + 1),
                      child: Icon(
                        Icons.star,
                        color:
                            rating >= index + 1 ? Colors.yellow : Colors.grey,
                        size: 30.0,
                      ),
                    );
                  }),
                ),
              ),

              // Review text field
              const SizedBox(height: 24.0),
              const Text(
                'Write a Review',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8.0),
              TextField(
                maxLines: 5,
                decoration: InputDecoration(
                  hintText:
                      'Would you like to write anything about this product?',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
                onChanged: _handleReviewTextChanged,
              ),

              // Image upload section
              const SizedBox(height: 24.0),
              const Text(
                'Add Photo',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8.0),
              GestureDetector(
                onTap: _pickImage,
                child: Container(
                  width: double.infinity,
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(color: Colors.grey),
                    color: Colors.grey[100],
                  ),
                  child: Center(
                    child: isImageLoading
                        ? const CircularProgressIndicator()
                        : pickedImage != null
                            ? Image.file(
                                File(pickedImage!.path),
                                width: double.infinity,
                                height: 150,
                                fit: BoxFit.cover,
                              )
                            : const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.cloud_upload_outlined,
                                      size: 50, color: Colors.grey),
                                  SizedBox(height: 8.0),
                                  Text(
                                    'Click here to upload',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ],
                              ),
                  ),
                ),
              ),

              // Submit button
              const SizedBox(height: 24.0),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 150, 10, 10),
                child: SizedBox(
                  width: double.infinity,
                  height: 50.0,
                  child: ElevatedButton(
                    onPressed: _submitReview,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF6B4226), // Brown color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: const Text(
                      'Submit Review',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
