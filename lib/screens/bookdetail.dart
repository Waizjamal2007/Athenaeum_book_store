import 'package:flutter/material.dart';

class BookDetailsPage extends StatefulWidget {
final String name;
final String author;
final String category;
final double price;
final String image;
final String description;

const BookDetailsPage({
super.key,
this.name = 'Atomic Habits',
this.author = 'James Clear',
this.category = 'Self Development',
this.price = 1299,
this.image =
'https://images.unsplash.com/photo-1544947950-fa07a98d237f?w=600',
this.description =
'Atomic Habits explains how tiny changes can lead to remarkable results. '
'Learn practical strategies to build good habits, break bad ones, '
'and improve your daily routine through small, consistent actions.',
});

@override
State<BookDetailsPage> createState() => _BookDetailsPageState();
}

class _BookDetailsPageState extends State<BookDetailsPage> {
static const Color brown = Color(0xFFA64220);
static const Color cream = Color(0xFFF7F5EF);
static const Color darkText = Color(0xFF171717);
static const Color greyText = Color(0xFF6F6A62);

bool isFavorite = false;

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

void addToCart() {
if (widget.name.trim().isEmpty || widget.price <= 0) {
showMessage('Invalid book details.');
return;
}

showMessage('${widget.name} selected for cart.');

Navigator.pop(context, {
'name': widget.name,
'author': widget.author,
'category': widget.category,
'price': widget.price,
'image': widget.image,
'quantity': 1,
});
}

Widget buildInfo(String title, String value) {
return Expanded(
child: Container(
padding: const EdgeInsets.all(12),
decoration: BoxDecoration(
color: const Color(0xFFF3E4DC),
borderRadius: BorderRadius.circular(12),
),
child: Column(
children: [
Text(
title,
style: const TextStyle(
color: greyText,
fontSize: 12,
),
),
const SizedBox(height: 6),
Text(
value,
textAlign: TextAlign.center,
style: const TextStyle(
color: darkText,
fontWeight: FontWeight.bold,
fontSize: 14,
),
),
],
),
),
);
}

@override
Widget build(BuildContext context) {
return Scaffold(
backgroundColor: cream,
appBar: AppBar(
backgroundColor: cream,
surfaceTintColor: Colors.transparent,
elevation: 0,
leading: IconButton(
onPressed: () => Navigator.pop(context),
icon: const Icon(Icons.arrow_back_ios_new, color: darkText),
),
title: const Text(
'Book Details',
style: TextStyle(
color: darkText,
fontWeight: FontWeight.bold,
fontSize: 20,
),
),
centerTitle: true,
actions: [
IconButton(
onPressed: () => showMessage('Your cart is ready to view.'),
icon: const Icon(
Icons.shopping_cart_outlined,
color: brown,
),
),
],
),
body: SingleChildScrollView(
padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Center(
child: Container(
height: 285,
width: 205,
decoration: BoxDecoration(
color: const Color(0xFFF3E4DC),
borderRadius: BorderRadius.circular(16),
boxShadow: [
BoxShadow(
color: Colors.black.withValues(alpha: 0.12),
blurRadius: 18,
offset: const Offset(0, 8),
),
],
),
clipBehavior: Clip.antiAlias,
child: Image.network(
widget.image,
fit: BoxFit.cover,
errorBuilder: (_, __, ___) => const Center(
child: Icon(
Icons.menu_book_rounded,
size: 100,
color: brown,
),
),
loadingBuilder: (_, child, progress) {
if (progress == null) return child;
return const Center(
child: CircularProgressIndicator(color: brown),
);
},
),
),
),
const SizedBox(height: 26),
Container(
padding: const EdgeInsets.symmetric(
horizontal: 12,
vertical: 7,
),
decoration: BoxDecoration(
color: const Color(0xFFF3E4DC),
borderRadius: BorderRadius.circular(20),
),
child: Text(
widget.category.toUpperCase(),
style: const TextStyle(
color: brown,
fontSize: 11,
fontWeight: FontWeight.bold,
letterSpacing: 1,
),
),
),
const SizedBox(height: 12),
Text(
widget.name,
style: const TextStyle(
color: darkText,
fontSize: 27,
fontWeight: FontWeight.bold,
),
),
const SizedBox(height: 6),
Text(
'By ${widget.author}',
style: const TextStyle(
color: greyText,
fontSize: 15,
),
),
const SizedBox(height: 14),
const Row(
children: [
Icon(Icons.star_rounded, color: Color(0xFFE7A629)),
SizedBox(width: 5),
Text(
'4.8',
style: TextStyle(
fontWeight: FontWeight.bold,
fontSize: 15,
),
),
SizedBox(width: 7),
Text(
'(Reader rating)',
style: TextStyle(color: greyText, fontSize: 13),
),
],
),
const SizedBox(height: 18),
Text(
'Rs. ${widget.price.toStringAsFixed(0)}',
style: const TextStyle(
color: brown,
fontSize: 26,
fontWeight: FontWeight.bold,
),
),
const SizedBox(height: 8),
const Row(
children: [
Icon(
Icons.check_circle_rounded,
color: Colors.green,
size: 18,
),
SizedBox(width: 7),
Text(
'Available to order',
style: TextStyle(
color: Colors.green,
fontSize: 13,
fontWeight: FontWeight.w600,
),
),
],
),
const SizedBox(height: 25),
const Text(
'About This Book',
style: TextStyle(
color: darkText,
fontSize: 20,
fontWeight: FontWeight.bold,
),
),
const SizedBox(height: 10),
Text(
widget.description,
style: const TextStyle(
color: greyText,
fontSize: 14,
height: 1.7,
),
),
const SizedBox(height: 22),
const Text(
'Book Information',
style: TextStyle(
color: darkText,
fontSize: 20,
fontWeight: FontWeight.bold,
),
),
const SizedBox(height: 13),
Row(
children: [
buildInfo('FORMAT', 'Paperback'),
const SizedBox(width: 10),
buildInfo('LANGUAGE', 'English'),
const SizedBox(width: 10),
buildInfo('GENRE', widget.category),
],
),
const SizedBox(height: 28),
Row(
children: [
Container(
height: 52,
width: 55,
decoration: BoxDecoration(
color: const Color(0xFFF3E4DC),
borderRadius: BorderRadius.circular(13),
),
child: IconButton(
onPressed: () {
setState(() => isFavorite = !isFavorite);
showMessage(
isFavorite
? 'Added to wishlist!'
    : 'Removed from wishlist!',
);
},
icon: Icon(
isFavorite
? Icons.favorite
    : Icons.favorite_border,
color: brown,
),
),
),
const SizedBox(width: 12),
Expanded(
child: SizedBox(
height: 52,
child: ElevatedButton.icon(
onPressed: addToCart,
icon: const Icon(
Icons.shopping_cart_outlined,
size: 20,
),
label: const Text(
'Add to Cart',
style: TextStyle(
fontSize: 15,
fontWeight: FontWeight.bold,
),
),
style: ElevatedButton.styleFrom(
backgroundColor: brown,
foregroundColor: Colors.white,
elevation: 0,
shape: RoundedRectangleBorder(
borderRadius: BorderRadius.circular(13),
),
),
),
),
),
],
),
],
),
),
);
}
}

