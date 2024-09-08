import 'package:dotted_border/dotted_border.dart';
import 'package:first_app/screens/dashboard/dashboard.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class PaymentMethodScreen extends StatefulWidget {
  const PaymentMethodScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PaymentMethodScreenState createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  String? _selectedBank;
  XFile? _uploadedImage;
  final List<Map<String, String>> _banks = [
    {'name': 'ABA Bank', 'subtitle': '011 XXX XXX'},
    {'name': 'ACLEDA', 'subtitle': '011 XXX XXX'},
    {'name': 'True Money Bank', 'subtitle': '011 XXX XXX'},
    {'name': 'Wing Bank', 'subtitle': '011 XXX XXX'},
  ];

  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment Method'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildInfoBanner(),
            const SizedBox(height: 20),
            const Text(
              'Payment Manual',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            const SizedBox(height: 10),
            _buildBankOptions(),
            const SizedBox(height: 20),
            const Text(
              'Upload Bank Invoice',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              'Warning: you have to pay to us first!',
              style: TextStyle(
                color: Colors.redAccent,
                fontSize: 12.0,
              ),
            ),
            const SizedBox(height: 20),
            _buildUploadField(),
            const SizedBox(height: 20),
          ],
        ),
      ),
      bottomNavigationBar: _buildCheckoutButton(),
    );
  }

  Widget _buildInfoBanner() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.orange.withOpacity(0.2),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: const Row(
        children: [
          Icon(Icons.info, color: Colors.orange),
          SizedBox(width: 8.0),
          Expanded(
            child: Text(
              'By making a purchase, you agree to our refund policy for purchase.',
              style: TextStyle(color: Colors.orange),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBankOptions() {
    return Column(
      children: _banks.map((bank) {
        return Card(
          child: ListTile(
            leading: _getBankIcon(bank['name']!),
            title: Text(bank['name']!),
            subtitle: Text(bank['subtitle']!),
            trailing: Radio<String>(
              value: bank['name']!,
              groupValue: _selectedBank,
              onChanged: (value) {
                setState(() {
                  _selectedBank = value;
                });
              },
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _getBankIcon(String bankName) {
    switch (bankName) {
      case 'ABA Bank':
        return Image.asset('assets/images/aba.png', width: 40);
      case 'ACLEDA':
        return Image.asset('assets/images/ac.png', width: 40);
      case 'True Money Bank':
        return Image.asset('assets/images/trm.png', width: 40);
      case 'Wing Bank':
        return Image.asset('assets/images/wing.png', width: 40);
      default:
        return const Icon(Icons.account_balance_wallet);
    }
  }

  Widget _buildUploadField() {
    return GestureDetector(
      onTap: _pickImage,
      child: DottedBorder(
        color: Colors.grey,
        strokeWidth: 2,
        dashPattern: const [8, 4],
        borderType: BorderType.RRect,
        radius: const Radius.circular(12),
        child: Container(
          height: 150,
          width: double.infinity,
          color: Colors.grey[200],
          child: Center(
            child: _uploadedImage != null
                ? (kIsWeb
                    ? Image.network(
                        _uploadedImage!.path,
                        fit: BoxFit.cover,
                        height: 150,
                        width: double.infinity,
                      )
                    : Image.file(
                        File(_uploadedImage!.path),
                        fit: BoxFit.cover,
                        height: 150,
                        width: double.infinity,
                      ))
                : const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.cloud_upload, size: 40, color: Colors.brown),
                      SizedBox(height: 8),
                      Text(
                        'Upload',
                        style: TextStyle(
                          color: Colors.brown,
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _uploadedImage = pickedFile;
      });
    }
  }

  Widget _buildCheckoutButton() {
    bool isReadyForCheckout = _selectedBank != null && _uploadedImage != null;

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.brown,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
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
            if (isReadyForCheckout) {
              _showSuccessDialog();
            } else {
              _showAlertDialog();
            }
          },
          child: const Text(
            'Checkout',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/images/success.png',
                height: 80,
                width: 80,
              ),
              const SizedBox(height: 10),
              const Text(
                'Successful!',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'You have successfully placed your order, your order is under admin review.',
                textAlign: TextAlign.center,
              ),
            ],
          ),
          actions: [
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 20),
                    backgroundColor: Colors.brown,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DashboardScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    'Continue Shopping',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void _showAlertDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Warning!',
            style: TextStyle(color: Colors.red),
          ),
          content: const Text(
              'Please select a bank option and upload an invoice before proceeding.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
