import 'package:flutter/material.dart';
import 'login_screen.dart';

class ShoppingCartScreen extends StatelessWidget {
  const ShoppingCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, dynamic result) {
        if (didPop) return;
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (_) => const LoginScreen()),
          (route) => false,
        );
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (_) => const LoginScreen()),
                (route) => false,
              );
            },
          ),
          title: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Shopping Bag',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Text(
                '3 Items Selected',
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ],
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 8),
              child: Text('Clear Cart',
                  style: TextStyle(color: Colors.black54)),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.local_shipping,
                                size: 18, color: Colors.brown),
                            SizedBox(width: 6),
                            Text('Courier Privilege',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                        Text('62% Reached',
                            style: TextStyle(
                                color: Colors.brown,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Add \$12.00 more for Complimentary Courier Delivery.',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    SizedBox(height: 8),
                    LinearProgressIndicator(
                      value: 0.62,
                      backgroundColor: Color(0xFFE0E0E0),
                      color: Color(0xFF8B2A2A),
                    ),
                  ],
                ),
              ),
              _buildCartItem(
                image: 'assets/images/shadow_of_the_wind.jpg',
                title: 'The Shadow of the Wind',
                author: 'Carlos Ruiz Zafon',
                type: 'Hardcover',
                status: 'In Stock',
                price: '\$24.00',
              ),
              _buildCartItem(
                image: 'assets/images/klara_and_the_sun.jpg',
                title: 'Klara and the Sun',
                author: 'Kazuo Ishiguro',
                type: 'Paperback',
                status: 'Special Edition',
                price: '\$18.50',
              ),
              _buildCartItem(
                image: 'assets/images/notes_on_invisible.jpg',
                title: 'Notes on the Invisible',
                author: 'F. V. Montgomery',
                type: '',
                status: '',
                price: '\$22.00',
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _buildCartItem({
    required String image,
    required String title,
    required String author,
    required String type,
    required String status,
    required String price,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            image,
            width: 80,
            height: 110,
            fit: BoxFit.cover,
            errorBuilder: (c, e, s) => Container(
              width: 80,
              height: 110,
              color: const Color(0xFFEEEEEE),
              child: const Icon(Icons.book, size: 40),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16)),
                const SizedBox(height: 4),
                Text(author,
                    style: const TextStyle(color: Colors.grey, fontSize: 13)),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(type,
                        style:
                            const TextStyle(fontSize: 12, color: Colors.grey)),
                    const SizedBox(width: 8),
                    Text(status,
                        style: const TextStyle(
                            fontSize: 12,
                            color: Colors.brown,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
                const SizedBox(height: 20),
                Text(price,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18)),
              ],
            ),
          ),
          const Icon(Icons.close, size: 18),
        ],
      ),
    );
  }
}