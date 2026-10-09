import 'package:flutter/material.dart';

class SearchFilterScreen extends StatefulWidget {
  const SearchFilterScreen({super.key});

  @override
  State<SearchFilterScreen> createState() => _SearchFilterScreenState();
}

class _SearchFilterScreenState extends State<SearchFilterScreen> {
  // Theme color palette
  static const Color primaryColor = Color(0xFF8C4A27); // Terracotta Cognac
  static const Color backgroundColor = Color(0xFFF9F6F0); // Parchment warm cream
  static const Color cardColor = Colors.white;
  static const Color textColor = Color(0xFF221F1D);
  static const Color mutedColor = Color(0xFF7A736E);
  static const Color borderColor = Color(0xFFE8E2D8);

  // Selected filters
  String category = 'All';
  String language = 'All';
  String sortBy = 'Default';

  RangeValues priceRange = const RangeValues(100, 10000);

  final List<String> categories = [
    'All',
    'Fiction',
    'Science',
    'History',
    'Technology',
    'Education',
    'Poetry',
    'Philosophy',
  ];

  final List<String> languages = [
    'All',
    'English',
    'Urdu',
  ];

  final List<Map<String, dynamic>> books = [
    {
      'title': 'The Great Adventure',
      'author': 'John Smith',
      'category': 'Fiction',
      'language': 'English',
      'price': 450.0,
      'icon': Icons.auto_stories,
    },
    {
      'title': 'Science World',
      'author': 'David Miller',
      'category': 'Science',
      'language': 'English',
      'price': 600.0,
      'icon': Icons.science,
    },
    {
      'title': 'World History',
      'author': 'Sarah Ahmed',
      'category': 'History',
      'language': 'Urdu',
      'price': 550.0,
      'icon': Icons.history_edu,
    },
    {
      'title': 'Learn Flutter Architecture',
      'author': 'Alex Johnson',
      'category': 'Technology',
      'language': 'English',
      'price': 800.0,
      'icon': Icons.code,
    },
    {
      'title': 'English Grammar Essentials',
      'author': 'Emily Brown',
      'category': 'Education',
      'language': 'English',
      'price': 350.0,
      'icon': Icons.menu_book,
    },
    {
      'title': 'Urdu Kahaniyan',
      'author': 'Ali Ahmed',
      'category': 'Fiction',
      'language': 'Urdu',
      'price': 250.0,
      'icon': Icons.book,
    },
    {
      'title': 'The Silent Cosmos',
      'author': 'Dr. Robert Vance',
      'category': 'Science',
      'language': 'English',
      'price': 750.0,
      'icon': Icons.public,
    },
    {
      'title': 'Bang-e-Dra',
      'author': 'Allama Iqbal',
      'category': 'Poetry',
      'language': 'Urdu',
      'price': 500.0,
      'icon': Icons.auto_stories,
    },
    {
      'title': 'Secrets of Modern AI',
      'author': 'Prof. Alan Turing',
      'category': 'Technology',
      'language': 'English',
      'price': 2450.0,
      'icon': Icons.memory,
    },
    {
      'title': 'Ancient Civilizations',
      'author': 'Maria Garcia',
      'category': 'History',
      'language': 'English',
      'price': 4680.0,
      'icon': Icons.museum,
    },
    {
      'title': 'Philosophy of Mind',
      'author': 'Marcus Aurelius',
      'category': 'Philosophy',
      'language': 'English',
      'price': 1420.0,
      'icon': Icons.psychology,
    },
    {
      'title': 'Mastering Dart & Flutter',
      'author': 'Hiba Hassan',
      'category': 'Technology',
      'language': 'English',
      'price': 3890.0,
      'icon': Icons.developer_mode,
    },
    {
      'title': 'Shikwa & Jawab-e-Shikwa',
      'author': 'Allama Iqbal',
      'category': 'Poetry',
      'language': 'Urdu',
      'price': 1300.0,
      'icon': Icons.menu_book,
    },
    {
      'title': 'Quantum Physics Principles',
      'author': 'Niels Bohr',
      'category': 'Science',
      'language': 'English',
      'price': 7920.0,
      'icon': Icons.biotech,
    },
    {
      'title': 'The Art of Storytelling',
      'author': 'Charles Dickens',
      'category': 'Fiction',
      'language': 'English',
      'price': 9480.0,
      'icon': Icons.brush,
    },
  ];

  // Filter and sort books
  List<Map<String, dynamic>> get filteredBooks {
    final result = books.where((book) {
      final categoryMatch = category == 'All' || book['category'] == category;
      final languageMatch = language == 'All' || book['language'] == language;
      final price = book['price'] as double;
      final priceMatch = price >= priceRange.start && price <= priceRange.end;

      return categoryMatch && languageMatch && priceMatch;
    }).toList();

    // Sorting
    switch (sortBy) {
      case 'Name: A to Z':
        result.sort((a, b) => (a['title'] as String).compareTo(b['title'] as String));
        break;

      case 'Price: Low to High':
        result.sort((a, b) => (a['price'] as double).compareTo(b['price'] as double));
        break;

      case 'Price: High to Low':
        result.sort((a, b) => (b['price'] as double).compareTo(a['price'] as double));
        break;
    }

    return result;
  }

  // Reset all filters
  void resetFilters() {
    setState(() {
      category = 'All';
      language = 'All';
      sortBy = 'Default';
      priceRange = const RangeValues(100, 10000);
    });
  }

  @override
  Widget build(BuildContext context) {
    final result = filteredBooks;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: const Text(
          'SEARCH & FILTER',
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
        actions: [
          TextButton(
            onPressed: resetFilters,
            child: const Text(
              'Reset',
              style: TextStyle(
                color: primaryColor,
                fontFamily: 'serif',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              children: [
                // Category
                const Text(
                  'Literary Category',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                    fontFamily: 'serif',
                  ),
                ),
                const SizedBox(height: 10),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: categories.map((item) {
                    final isSelected = category == item;
                    return ChoiceChip(
                      label: Text(item),
                      selected: isSelected,
                      selectedColor: primaryColor,
                      backgroundColor: cardColor,
                      side: const BorderSide(color: borderColor),
                      labelStyle: TextStyle(
                        color: isSelected ? Colors.white : textColor,
                        fontSize: 12,
                        fontFamily: 'serif',
                      ),
                      onSelected: (_) {
                        setState(() {
                          category = item;
                        });
                      },
                    );
                  }).toList(),
                ),

                const SizedBox(height: 22),

                // Language
                const Text(
                  'Language Edition',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                    fontFamily: 'serif',
                  ),
                ),
                const SizedBox(height: 10),
                Wrap(
                  spacing: 8,
                  children: languages.map((item) {
                    final isSelected = language == item;
                    return ChoiceChip(
                      label: Text(item),
                      selected: isSelected,
                      selectedColor: primaryColor,
                      backgroundColor: cardColor,
                      side: const BorderSide(color: borderColor),
                      labelStyle: TextStyle(
                        color: isSelected ? Colors.white : textColor,
                        fontSize: 12,
                        fontFamily: 'serif',
                      ),
                      onSelected: (_) {
                        setState(() {
                          language = item;
                        });
                      },
                    );
                  }).toList(),
                ),

                const SizedBox(height: 22),

                // Price range
                const Text(
                  'Valuation Range',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                    fontFamily: 'serif',
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Rs. ${priceRange.start.round()}',
                      style: const TextStyle(
                        color: primaryColor,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'serif',
                      ),
                    ),
                    Text(
                      'Rs. ${priceRange.end.round()}',
                      style: const TextStyle(
                        color: primaryColor,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'serif',
                      ),
                    ),
                  ],
                ),
                RangeSlider(
                  values: priceRange,
                  min: 100,
                  max: 10000,
                  divisions: 99,
                  activeColor: primaryColor,
                  inactiveColor: borderColor,
                  labels: RangeLabels(
                    'Rs. ${priceRange.start.round()}',
                    'Rs. ${priceRange.end.round()}',
                  ),
                  onChanged: (value) {
                    setState(() {
                      priceRange = value;
                    });
                  },
                ),

                const SizedBox(height: 20),

                // Sorting
                const Text(
                  'Sort Archival Order',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                    fontFamily: 'serif',
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  decoration: BoxDecoration(
                    color: cardColor,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: borderColor),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: sortBy,
                      isExpanded: true,
                      style: const TextStyle(
                        color: textColor,
                        fontFamily: 'serif',
                        fontSize: 14,
                      ),
                      items: const [
                        DropdownMenuItem(
                          value: 'Default',
                          child: Text('Default Archival Order'),
                        ),
                        DropdownMenuItem(
                          value: 'Name: A to Z',
                          child: Text('Title: A to Z'),
                        ),
                        DropdownMenuItem(
                          value: 'Price: Low to High',
                          child: Text('Valuation: Low to High'),
                        ),
                        DropdownMenuItem(
                          value: 'Price: High to Low',
                          child: Text('Valuation: High to Low'),
                        ),
                      ],
                      onChanged: (value) {
                        if (value == null) return;
                        setState(() {
                          sortBy = value;
                        });
                      },
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                // Results heading
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Matched Folios',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: textColor,
                        fontFamily: 'serif',
                      ),
                    ),
                    Text(
                      '${result.length} found',
                      style: const TextStyle(
                        color: primaryColor,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'serif',
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                // Book list
                if (result.isEmpty)
                  const Padding(
                    padding: EdgeInsets.all(30),
                    child: Center(
                      child: Text(
                        'No folios matched your curation.\nTry adjusting your criteria.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: mutedColor,
                          fontFamily: 'serif',
                        ),
                      ),
                    ),
                  )
                else
                  ...result.map((book) {
                    return Card(
                      color: cardColor,
                      elevation: 0,
                      margin: const EdgeInsets.only(bottom: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                        side: const BorderSide(color: borderColor),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Row(
                          children: [
                            Container(
                              height: 65,
                              width: 58,
                              decoration: BoxDecoration(
                                color: const Color(0xFFF5ECE5),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Icon(
                                book['icon'] as IconData,
                                color: primaryColor,
                                size: 28,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    book['title'] as String,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      color: textColor,
                                      fontFamily: 'serif',
                                    ),
                                  ),
                                  const SizedBox(height: 3),
                                  Text(
                                    'By ${book['author']}',
                                    style: const TextStyle(
                                      color: mutedColor,
                                      fontSize: 11,
                                    ),
                                  ),
                                  const SizedBox(height: 3),
                                  Text(
                                    '${book['category']} · ${book['language']}',
                                    style: const TextStyle(
                                      color: mutedColor,
                                      fontSize: 11,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              'Rs. ${(book['price'] as double).toStringAsFixed(0)}',
                              style: const TextStyle(
                                color: primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                fontFamily: 'serif',
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
              ],
            ),
          ),

          // Apply button
          SafeArea(
            top: false,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: cardColor,
                border: Border(top: BorderSide(color: borderColor)),
              ),
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: textColor,
                      content: Text(
                        '${result.length} folios matched your criteria!',
                        style: const TextStyle(
                          fontFamily: 'serif',
                          color: backgroundColor,
                        ),
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'SEARCH BOOKS',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                    fontFamily: 'serif',
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
