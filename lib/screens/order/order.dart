import 'package:first_app/screens/order/order_detail.dart';
import 'package:flutter/material.dart';

class OrderHistoryScreen extends StatefulWidget {
  const OrderHistoryScreen({super.key});

  @override
  State<OrderHistoryScreen> createState() => _OrderHistoryScreenState();
}

class _OrderHistoryScreenState extends State<OrderHistoryScreen> {
  final List<Order> orders = [
    Order(orderId: "#002381", date: "31 June 2023 5:40 PM", status: "Pending"),
    Order(orderId: "#002380", date: "30 June 2023 4:40 PM", status: "Confirm"),
    Order(orderId: "#002379", date: "29 June 2023 3:40 PM", status: "Complete"),
    Order(orderId: "#002378", date: "28 June 2023 12:40 PM", status: "Complete"),
    Order(orderId: "#002377", date: "27 June 2023 11:40 AM", status: "Delivery"),
    Order(orderId: "#002376", date: "26 June 2023 9:40 AM", status: "Confirm"),
    Order(orderId: "#002375", date: "25 June 2023 8:40 AM", status: "Complete"),
    Order(orderId: "#002374", date: "24 June 2023 4:40 PM", status: "Complete"),
    Order(orderId: "#002373", date: "23 June 2023 3:40 PM", status: "Pending"),
    Order(orderId: "#002372", date: "22 June 2023 2:40 PM", status: "Confirm"),
    Order(orderId: "#002371", date: "21 June 2023 1:40 PM", status: "Complete"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "History Orders",
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: orders.length,
        itemBuilder: (context, index) {
          final order = orders[index];
          return Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, 3), // Changes position of shadow
                  ),
                ],
              ),
              child: ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                leading: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      order.orderId,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.brown,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      order.date,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                trailing: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const OrderDetail()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.brown,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  ),
                  child: Text(
                    order.status,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const OrderDetail()),
                  );
                },
              ),
            ),
          );
        },
      ),
      backgroundColor: const Color(0xFFF8F8F8),
    );
  }
}

class Order {
  final String orderId;
  final String date;
  final String status;
  Order({required this.orderId, required this.date, required this.status});
}
