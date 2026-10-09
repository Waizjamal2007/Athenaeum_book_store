import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

const Color brown = Color(0xFFA64220);
const Color cream = Color(0xFFF7F5EF);
const Color darkText = Color(0xFF171717);
const Color greyText = Color(0xFF6F6A62);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Book Wishlist',
      theme: ThemeData(
        scaffoldBackgroundColor: cream,
        colorScheme: ColorScheme.fromSeed(seedColor: brown),
        useMaterial3: true,
      ),
      home: const WishlistPage(),
    );
  }
}

class WishlistPage extends StatefulWidget {
  const WishlistPage({super.key});

  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  final List<Map<String, dynamic>> wishlist = [
    {
      'name': 'Atomic Habits',
      'category': 'Self Improvement',
      'price': 1299.0,
      'image': 'https://images.unsplash.com/photo-1544947950-fa07a98d237f?w=500',
    },
    {
      'name': 'Clean Code',
      'category': 'Programming',
      'price': 1899.0,
      'image': 'https://images.unsplash.com/photo-1532012197267-da84d127e765?w=500',
    },
    {
      'name': 'The Psychology of Money',
      'category': 'Finance',
      'price': 999.0,
      'image': 'https://images.unsplash.com/photo-1512820790803-83ca734da794?w=500',
    },
    {
      'name': 'Rich Dad Poor Dad',
      'category': 'Business',
      'price': 1099.0,
      'image': 'https://images.unsplash.com/photo-1543002588-bfa74002ed7e?w=500',
    },
  ];

  final List<Map<String, dynamic>> cart = [];

  void showMessage(String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: brown,
          behavior: SnackBarBehavior.floating,
        ),
      );
  }

  void removeFromWishlist(int index) {
    if (index < 0 || index >= wishlist.length) {
      showMessage('Invalid book selection');
      return;
    }

    final name = wishlist[index]['name'] as String;

    setState(() => wishlist.removeAt(index));
    showMessage('$name removed from wishlist');
  }

  void addToCart(Map<String, dynamic> book) {
    if (book['name'] == null ||
        book['price'] == null ||
        (book['price'] as num) <= 0) {
      showMessage('Invalid book details');
      return;
    }

    final index = cart.indexWhere(
          (item) => item['name'] == book['name'],
    );

    setState(() {
      if (index >= 0) {
        cart[index]['quantity'] =
            (cart[index]['quantity'] as int) + 1;
      } else {
        cart.add({
          ...book,
          'quantity': 1,
        });
      }
    });

    showMessage('${book['name']} added to cart');
  }

  int get cartCount => cart.fold(
    0,
        (total, item) => total + (item['quantity'] as int),
  );

  void openCart() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => CartPage(
          cart: cart,
          onChanged: () => setState(() {}),
        ),
      ),
    ).then((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: cream,
        title: const Text(
          'My Wishlist',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Center(
              child: TextButton.icon(
                onPressed: openCart,
                icon: const Icon(Icons.shopping_cart_outlined, color: brown),
                label: Text(
                  'Cart ($cartCount)',
                  style: const TextStyle(
                    color: brown,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: wishlist.isEmpty
          ? Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.menu_book, size: 70, color: brown),
            const SizedBox(height: 12),
            const Text(
              'Your wishlist is empty',
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text('Add your favorite books to your wishlist.'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => showMessage(
                'Visit the books page to add more books.',
              ),
              child: const Text('Explore Books'),
            ),
          ],
        ),
      )
          : Column(
        children: [
          Container(
            margin: const EdgeInsets.all(18),
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              color: brown,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Your Favorite Books',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 7),
                      Text(
                        'Your next great read is waiting!',
                        style: TextStyle(color: Colors.white70),
                      ),
                    ],
                  ),
                ),
                const Icon(
                  Icons.menu_book_rounded,
                  color: Colors.white,
                  size: 42,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                const Text(
                  'Saved Books',
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                Text(
                  '${wishlist.length} books',
                  style: const TextStyle(color: greyText),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: wishlist.length,
              itemBuilder: (context, index) {
                final book = wishlist[index];

                return Container(
                  margin: const EdgeInsets.only(bottom: 14),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFFEFA),
                    borderRadius: BorderRadius.circular(17),
                    border: Border.all(color: const Color(0xFFE2DED5)),
                  ),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          book['image'] as String,
                          width: 100,
                          height: 135,
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) => Container(
                            width: 100,
                            height: 135,
                            color: const Color(0xFFF3E4DC),
                            child: const Icon(
                              Icons.menu_book,
                              color: brown,
                              size: 40,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 13),
                      Expanded(
                        child: SizedBox(
                          height: 135,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      book['category'] as String,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        color: greyText,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                    visualDensity: VisualDensity.compact,
                                    onPressed: () =>
                                        removeFromWishlist(index),
                                    icon: const Icon(
                                      Icons.favorite,
                                      color: brown,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                book['name'] as String,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: darkText,
                                ),
                              ),
                              const Spacer(),
                              Text(
                                'Rs. ${(book['price'] as num).toStringAsFixed(0)}',
                                style: const TextStyle(
                                  color: brown,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                ),
                              ),
                              const SizedBox(height: 7),
                              SizedBox(
                                width: double.infinity,
                                height: 35,
                                child: ElevatedButton.icon(
                                  onPressed: () => addToCart(book),
                                  icon: const Icon(
                                    Icons.shopping_cart_outlined,
                                    size: 16,
                                  ),
                                  label: const Text(
                                    'Add to Cart',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: brown,
                                    foregroundColor: Colors.white,
                                    padding: EdgeInsets.zero,
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.circular(9),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
          child: SizedBox(
            height: 48,
            child: ElevatedButton.icon(
              onPressed: openCart,
              icon: const Icon(Icons.shopping_bag_outlined),
              label: Text('View Cart ($cartCount)'),
              style: ElevatedButton.styleFrom(
                backgroundColor: brown,
                foregroundColor: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CartPage extends StatefulWidget {
  final List<Map<String, dynamic>> cart;
  final VoidCallback onChanged;

  const CartPage({
    super.key,
    required this.cart,
    required this.onChanged,
  });

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  double get total => widget.cart.fold(
    0.0,
        (sum, item) =>
    sum + (item['price'] as num) * (item['quantity'] as int),
  );

  void updateQuantity(int index, int change) {
    if (index < 0 || index >= widget.cart.length) return;

    setState(() {
      final quantity = (widget.cart[index]['quantity'] as int) + change;

      if (quantity <= 0) {
        widget.cart.removeAt(index);
      } else {
        widget.cart[index]['quantity'] = quantity;
      }
    });

    widget.onChanged();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Book Cart',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: cream,
      ),
      body: widget.cart.isEmpty
          ? const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.shopping_cart_outlined, size: 65, color: brown),
            SizedBox(height: 12),
            Text(
              'Your cart is empty',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 6),
            Text('Add some books from your wishlist.'),
          ],
        ),
      )
          : ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: widget.cart.length,
        itemBuilder: (context, index) {
          final book = widget.cart[index];

          return Card(
            color: const Color(0xFFFFFEFA),
            margin: const EdgeInsets.only(bottom: 12),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  const Icon(Icons.menu_book, color: brown, size: 42),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          book['name'] as String,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'Rs. ${(book['price'] as num).toStringAsFixed(0)}',
                          style: const TextStyle(color: brown),
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () => updateQuantity(index, -1),
                              icon: const Icon(Icons.remove_circle_outline),
                            ),
                            Text('${book['quantity']}'),
                            IconButton(
                              onPressed: () => updateQuantity(index, 1),
                              icon: const Icon(Icons.add_circle_outline),
                            ),
                            const Spacer(),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  widget.cart.removeAt(index);
                                });
                                widget.onChanged();
                              },
                              icon: const Icon(
                                Icons.delete_outline,
                                color: brown,
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
      bottomNavigationBar: widget.cart.isEmpty
          ? null
          : SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  const Text(
                    'Total Amount',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    'Rs. ${total.toStringAsFixed(0)}',
                    style: const TextStyle(
                      color: brown,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {
                    if (widget.cart.isEmpty || total <= 0) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Your cart is empty.'),
                        ),
                      );
                      return;
                    }

                    showDialog<void>(
                      context: context,
                      builder: (dialogContext) => AlertDialog(
                        title: const Text('Order Summary'),
                        content: Text(
                          'Books: ${widget.cart.fold<int>(0, (sum, item) => sum + (item['quantity'] as int))}\nTotal: Rs. ${total.toStringAsFixed(0)}\n\nCheckout is ready to connect to your order system.',
                        ),
                        actions: [
                          TextButton(
                            onPressed: () =>
                                Navigator.pop(dialogContext),
                            child: const Text('Close'),
                          ),
                        ],
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: brown,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Proceed to Checkout'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

