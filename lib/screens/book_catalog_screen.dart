import 'package:flutter/material.dart';

class BookCatalogScreen extends StatelessWidget {
  const BookCatalogScreen({super.key});

  static const Color primaryColor = Color(0xFF8C4A27); // Terracotta Cognac
  static const Color backgroundColor = Color(0xFFF9F6F0); // Warm Parchment
  static const Color cardColor = Colors.white;
  static const Color textColor = Color(0xFF221F1D);
  static const Color mutedColor = Color(0xFF7A736E);
  static const Color borderColor = Color(0xFFE8E2D8);

  final List<Map<String, dynamic>> books = const [
    {
      'title': 'The Great Adventure',
      'author': 'John Smith',
      'category': 'Fiction',
      'price': 'Rs. 450',
      'icon': Icons.auto_stories,
      'edition': '1st Folio Edition',
    },
    {
      'title': 'Science World',
      'author': 'David Miller',
      'category': 'Science',
      'price': 'Rs. 600',
      'icon': Icons.science,
      'edition': 'Archival Print',
    },
    {
      'title': 'World History',
      'author': 'Sarah Ahmed',
      'category': 'History',
      'price': 'Rs. 550',
      'icon': Icons.history_edu,
      'edition': 'Oxford Press',
    },
    {
      'title': 'Learn Flutter Architecture',
      'author': 'Alex Johnson',
      'category': 'Technology',
      'price': 'Rs. 800',
      'icon': Icons.code,
      'edition': '2024 Hardcover',
    },
    {
      'title': 'English Grammar Essentials',
      'author': 'Emily Brown',
      'category': 'Education',
      'price': 'Rs. 350',
      'icon': Icons.menu_book,
      'edition': 'Classical Edition',
    },
    {
      'title': 'Urdu Kahaniyan',
      'author': 'Ali Ahmed',
      'category': 'Fiction',
      'price': 'Rs. 250',
      'icon': Icons.book,
      'edition': 'Heritage Series',
    },
    {
      'title': 'The Silent Cosmos',
      'author': 'Dr. Robert Vance',
      'category': 'Science',
      'price': 'Rs. 750',
      'icon': Icons.public,
      'edition': 'Illustrated Volume',
    },
    {
      'title': 'Bang-e-Dra',
      'author': 'Allama Iqbal',
      'category': 'Poetry',
      'price': 'Rs. 500',
      'icon': Icons.auto_stories,
      'edition': 'Centenary Collection',
    },
    {
      'title': 'Secrets of Modern AI',
      'author': 'Prof. Alan Turing',
      'category': 'Technology',
      'price': 'Rs. 2,450',
      'icon': Icons.memory,
      'edition': 'Tech Press 2024',
    },
    {
      'title': 'Ancient Civilizations',
      'author': 'Maria Garcia',
      'category': 'History',
      'price': 'Rs. 4,680',
      'icon': Icons.museum,
      'edition': 'Archival Folio',
    },
    {
      'title': 'Philosophy of Mind',
      'author': 'Marcus Aurelius',
      'category': 'Philosophy',
      'price': 'Rs. 1,420',
      'icon': Icons.psychology,
      'edition': 'Penguin Heritage',
    },
    {
      'title': 'Mastering Dart & Flutter',
      'author': 'Hiba Hassan',
      'category': 'Technology',
      'price': 'Rs. 3,890',
      'icon': Icons.developer_mode,
      'edition': '2nd Edition',
    },
    {
      'title': 'Shikwa & Jawab-e-Shikwa',
      'author': 'Allama Iqbal',
      'category': 'Poetry',
      'price': 'Rs. 1,300',
      'icon': Icons.menu_book,
      'edition': 'Classic Series',
    },
    {
      'title': 'Quantum Physics Principles',
      'author': 'Niels Bohr',
      'category': 'Science',
      'price': 'Rs. 7,920',
      'icon': Icons.biotech,
      'edition': 'Cambridge Press',
    },
    {
      'title': 'The Art of Storytelling',
      'author': 'Charles Dickens',
      'category': 'Fiction',
      'price': 'Rs. 9,480',
      'icon': Icons.brush,
      'edition': 'Golden Edition',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: const Text(
          'CURATED CATALOG',
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.bold,
            letterSpacing: 2.5,
            fontSize: 15,
            fontFamily: 'serif',
          ),
        ),
        centerTitle: true,
        backgroundColor: backgroundColor,
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        itemCount: books.length,
        itemBuilder: (context, index) {
          final book = books[index];
          return Card(
            color: cardColor,
            elevation: 0,
            margin: const EdgeInsets.only(bottom: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
              side: const BorderSide(color: borderColor),
            ),
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Row(
                children: [
                  Container(
                    height: 75,
                    width: 65,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF5ECE5),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: const Color(0xFFE5D5C8)),
                    ),
                    child: Icon(
                      book['icon'] as IconData,
                      color: primaryColor,
                      size: 32,
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          book['title'] as String,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: textColor,
                            fontFamily: 'serif',
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'By ${book['author']} · ${book['edition']}',
                          style: const TextStyle(
                            color: mutedColor,
                            fontSize: 11,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 3,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0xFFF5ECE5),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(
                                book['category'] as String,
                                style: const TextStyle(
                                  color: primaryColor,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.5,
                                ),
                              ),
                            ),
                            Text(
                              book['price'] as String,
                              style: const TextStyle(
                                color: primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                fontFamily: 'serif',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
