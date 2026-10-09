import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  static const Color primaryColor = Color(0xFF8C4A27); // Terracotta Cognac
  static const Color backgroundColor = Color(0xFFF9F6F0); // Warm Parchment
  static const Color cardColor = Colors.white;
  static const Color textColor = Color(0xFF221F1D); // Espresso Charcoal
  static const Color mutedColor = Color(0xFF7A736E); // Warm Grey
  static const Color borderColor = Color(0xFFE8E2D8);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'ATHENAEUM',
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.bold,
            letterSpacing: 3,
            fontSize: 16,
            fontFamily: 'serif',
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications_none_outlined,
              color: textColor,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 16),
            child: CircleAvatar(
              radius: 16,
              backgroundColor: Color(0xFFF5ECE5),
              child: Icon(
                Icons.person_outline,
                color: primaryColor,
                size: 20,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: Column(
          children: [
            // Branding Header Banner from screenshot
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
              decoration: BoxDecoration(
                color: cardColor,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: borderColor),
              ),
              child: Column(
                children: [
                  const Text(
                    'FOLIO EDITION · MMXXIV',
                    style: TextStyle(
                      color: mutedColor,
                      fontSize: 10,
                      letterSpacing: 2.5,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF5ECE5),
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: const Color(0xFFE5D5C8)),
                    ),
                    child: const Icon(
                      Icons.auto_stories,
                      color: primaryColor,
                      size: 32,
                    ),
                  ),
                  const SizedBox(height: 14),
                  const Text(
                    'Athenaeum',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: textColor,
                      fontFamily: 'serif',
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(width: 20, height: 1, color: borderColor),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: CircleAvatar(radius: 2, backgroundColor: primaryColor),
                      ),
                      Container(width: 20, height: 1, color: borderColor),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'LITERARY CURATIONS & ARCHIVAL PRESS',
                    style: TextStyle(
                      color: mutedColor,
                      fontSize: 10,
                      letterSpacing: 1.8,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Est. 1894 · London',
                    style: TextStyle(
                      color: primaryColor,
                      fontSize: 12,
                      fontStyle: FontStyle.italic,
                      fontFamily: 'serif',
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Section Title
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Archive Statistics',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                  fontFamily: 'serif',
                ),
              ),
            ),

            const SizedBox(height: 14),

            // Statistics Grid
            GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              childAspectRatio: 1.3,
              children: const [
                StatCard(
                  title: 'Curated Titles',
                  value: '1,240',
                  icon: Icons.menu_book,
                ),
                StatCard(
                  title: 'Collections',
                  value: '18',
                  icon: Icons.collections_bookmark_outlined,
                ),
                StatCard(
                  title: 'Rare Editions',
                  value: '84',
                  icon: Icons.auto_awesome_outlined,
                ),
                StatCard(
                  title: 'Archival Value',
                  value: 'Rs. 95,000',
                  icon: Icons.history_edu,
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Sales Chart Container
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: cardColor,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: borderColor),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'MONTHLY ACQUISITIONS',
                    style: TextStyle(
                      color: mutedColor,
                      fontSize: 10,
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    'Rs. 45,000',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: primaryColor,
                      fontFamily: 'serif',
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 100,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        salesBar('Jan', 40),
                        salesBar('Feb', 65),
                        salesBar('Mar', 50),
                        salesBar('Apr', 90),
                        salesBar('May', 70),
                        salesBar('Jun', 100),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Recent Acquisitions / Orders
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Recent Folios',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                  fontFamily: 'serif',
                ),
              ),
            ),

            const SizedBox(height: 12),

            folioCard('The Great Adventure', 'John Smith · Folio No. 1001', 'Rs. 450'),
            const SizedBox(height: 10),
            folioCard('Learn Flutter Architecture', 'Alex Johnson · Folio No. 1002', 'Rs. 800'),
            const SizedBox(height: 10),
            folioCard('World History Archives', 'Sarah Ahmed · Folio No. 1003', 'Rs. 550'),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget salesBar(String month, double height) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 20,
          height: height,
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          month,
          style: const TextStyle(
            fontSize: 10,
            color: mutedColor,
          ),
        ),
      ],
    );
  }

  Widget folioCard(String title, String subtitle, String price) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: borderColor),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFFF5ECE5),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(
              Icons.book,
              color: primaryColor,
              size: 22,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: textColor,
                    fontFamily: 'serif',
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: mutedColor,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
          Text(
            price,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}

class StatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;

  const StatCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFE8E2D8)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(icon, color: const Color(0xFF8C4A27), size: 24),
          Text(
            value,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF221F1D),
              fontFamily: 'serif',
            ),
          ),
          Text(
            title,
            style: const TextStyle(
              color: Color(0xFF7A736E),
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }
}
