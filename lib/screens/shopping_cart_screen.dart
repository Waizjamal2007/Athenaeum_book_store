import 'package:flutter/material.dart';

class ShoppingCartScreen extends StatefulWidget {
  const ShoppingCartScreen({super.key});

  @override
  State<ShoppingCartScreen> createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen> {
  final TextEditingController voucherController =
      TextEditingController();

  @override
  void dispose() {
    voucherController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            _topHeader(),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(bottom: 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _courierPrivilege(),
                    const SizedBox(height: 13),

                    _bookCard(
                      image: 'assets/images/shadow_of_the_wind.jpg',
                      title: 'The Shadow of the Wind',
                      author: 'Carlos Ruiz Zafón',
                      edition: 'Hardcover',
                      status: 'In Stock',
                      price: '\$24.00',
                    ),

                    _bookCard(
                      image: 'assets/images/klara_and_the_sun.jpg',
                      title: 'Klara and the Sun',
                      author: 'Kazuo Ishiguro',
                      edition: 'Paperback',
                      status: 'Special Edition',
                      price: '\$18.50',
                    ),

                    _bookCard(
                      image: 'assets/images/notes_on_invisible.jpg',
                      title: 'Notes on the Invisible',
                      author: 'F. V. Montgomery',
                      edition: 'Hardcover',
                      status: 'Archival Print',
                      price: '\$19.00',
                    ),

                    const SizedBox(height: 18),
                    _voucherSection(),
                    const SizedBox(height: 14),
                    _orderSummary(),
                    const SizedBox(height: 18),
                    _collectorGuarantee(),
                    const SizedBox(height: 13),
                    _checkoutSection(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ----------------------------------------------------------
  // TOP HEADER
  // ----------------------------------------------------------

  Widget _topHeader() {
    return Container(
      height: 72,
      padding: const EdgeInsets.fromLTRB(25, 7, 25, 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            Icons.arrow_back,
            size: 30,
            color: Colors.black,
          ),

          const SizedBox(width: 17),

          const Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Shopping Bag',
                  style: TextStyle(
                    fontFamily: 'Georgia',
                    fontSize: 27,
                    height: 0.95,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 3),
                Text(
                  '3 Items Selected',
                  style: TextStyle(
                    fontFamily: 'Arial',
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),

          const Text(
            'Clear Cart',
            style: TextStyle(
              fontFamily: 'Arial',
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xff8f1717),
            ),
          ),
        ],
      ),
    );
  }

  // ----------------------------------------------------------
  // COURIER PRIVILEGE
  // ----------------------------------------------------------

  Widget _courierPrivilege() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      padding: const EdgeInsets.fromLTRB(24, 20, 24, 18),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: const Color(0xffeeeeee),
          width: 1,
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              const Icon(
                Icons.local_shipping_outlined,
                color: Color(0xffa71919),
                size: 25,
              ),

              const SizedBox(width: 9),

              const Expanded(
                child: Text(
                  'Courier Privilege',
                  style: TextStyle(
                    fontFamily: 'Arial',
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              const Text(
                '82% Reached',
                style: TextStyle(
                  fontFamily: 'Arial',
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff941717),
                ),
              ),
            ],
          ),

          const SizedBox(height: 11),

          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Add \$12.00 more for Complimentary Courier Delivery.',
              style: TextStyle(
                fontFamily: 'Arial',
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          const SizedBox(height: 12),

          Stack(
            children: [
              Container(
                height: 5,
                width: double.infinity,
                color: const Color(0xffffe7e9),
              ),
              FractionallySizedBox(
                widthFactor: 0.82,
                child: Container(
                  height: 5,
                  color: const Color(0xffa91414),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ----------------------------------------------------------
  // BOOK CARD
  // ----------------------------------------------------------

  Widget _bookCard({
    required String image,
    required String title,
    required String author,
    required String edition,
    required String status,
    required String price,
  }) {
    return Container(
      height: 190,
      margin: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 6,
      ),
      padding: const EdgeInsets.fromLTRB(12, 11, 12, 10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: const Color(0xffeeeeee),
          width: 1,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 126,
            height: 166,
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color(0xffeeeeee),
              ),
            ),
            child: Image.asset(
              image,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return const Center(
                  child: Icon(
                    Icons.menu_book_outlined,
                    size: 40,
                    color: Colors.grey,
                  ),
                );
              },
            ),
          ),

          const SizedBox(width: 20),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontFamily: 'Georgia',
                          fontSize: 22,
                          height: 1.05,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ),

                    const SizedBox(width: 6),

                    const Icon(
                      Icons.close,
                      size: 24,
                      color: Colors.black,
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                Text(
                  author,
                  style: const TextStyle(
                    fontFamily: 'Arial',
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                const SizedBox(height: 10),

                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 7,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color(0xffeeeeee),
                        ),
                      ),
                      child: Text(
                        edition,
                        style: const TextStyle(
                          fontFamily: 'Arial',
                          fontSize: 14,
                        ),
                      ),
                    ),

                    const SizedBox(width: 7),

                    Text(
                      status,
                      style: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: status == 'In Stock'
                            ? const Color(0xff8e1a1a)
                            : Colors.black,
                      ),
                    ),
                  ],
                ),

                const Spacer(),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      price,
                      style: const TextStyle(
                        fontFamily: 'Georgia',
                        fontSize: 26,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    const Spacer(),

                    _quantityBox(),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ----------------------------------------------------------
  // QUANTITY
  // ----------------------------------------------------------

  Widget _quantityBox() {
    return Container(
      height: 48,
      width: 135,
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xffeeeeee),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            '−',
            style: TextStyle(
              fontFamily: 'Arial',
              fontSize: 22,
            ),
          ),
          SizedBox(width: 25),
          Text(
            '1',
            style: TextStyle(
              fontFamily: 'Arial',
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(width: 25),
          Text(
            '+',
            style: TextStyle(
              fontFamily: 'Arial',
              fontSize: 22,
            ),
          ),
        ],
      ),
    );
  }

  // ----------------------------------------------------------
  // VOUCHER
  // ----------------------------------------------------------

  Widget _voucherSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Voucher or Gift Certificate',
            style: TextStyle(
              fontFamily: 'Arial',
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 9),

          Row(
            children: [
              Expanded(
                child: Container(
                  height: 58,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color(0xffdddddd),
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: TextField(
                    controller: voucherController,
                    style: const TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 17,
                    ),
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 17,
                      ),
                      border: InputBorder.none,
                      hintText: 'e.g. ATHENAEUM10',
                      hintStyle: TextStyle(
                        fontSize: 17,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 8),

              SizedBox(
                width: 101,
                height: 58,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  child: const Text(
                    'Apply',
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ----------------------------------------------------------
  // ORDER SUMMARY
  // ----------------------------------------------------------

  Widget _orderSummary() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      padding: const EdgeInsets.fromLTRB(24, 23, 24, 20),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: const Color(0xffeeeeee),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Order Summary',
            style: TextStyle(
              fontFamily: 'Georgia',
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 13),

          const Divider(
            color: Color(0xffdddddd),
            height: 1,
          ),

          const SizedBox(height: 11),

          _summaryLine(
            'Subtotal (3 books)',
            '\$61.50',
          ),

          _summaryLine(
            'Estimated Local Tax',
            '\$4.92',
          ),

          _summaryLine(
            'Standard Courier',
            'FREE',
            valueColor: const Color(0xff941717),
          ),

          const SizedBox(height: 8),

          const Divider(
            color: Color(0xffdddddd),
            height: 1,
          ),

          const SizedBox(height: 9),

          Row(
            children: [
              const Text(
                'Order Total',
                style: TextStyle(
                  fontFamily: 'Georgia',
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const Spacer(),

              const Text(
                '\$66.42',
                style: TextStyle(
                  fontFamily: 'Georgia',
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),

          const SizedBox(height: 4),

          const Text(
            'Includes all duties & archival wrapping',
            style: TextStyle(
              fontFamily: 'Arial',
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _summaryLine(
    String title,
    String value, {
    Color valueColor = Colors.black,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontFamily: 'Arial',
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),

          const Spacer(),

          Text(
            value,
            style: TextStyle(
              fontFamily: 'Arial',
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: valueColor,
            ),
          ),
        ],
      ),
    );
  }

  // ----------------------------------------------------------
  // GUARANTEE
  // ----------------------------------------------------------

  Widget _collectorGuarantee() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: const Color(0xff9b1919),
              width: 1.5,
            ),
          ),
          child: const Center(
            child: Icon(
              Icons.check,
              size: 13,
              color: Color(0xff9b1919),
            ),
          ),
        ),

        const SizedBox(width: 8),

        const Text(
          'Protected by Athenaeum Collector’s Guarantee',
          style: TextStyle(
            fontFamily: 'Arial',
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  // ----------------------------------------------------------
  // CHECKOUT
  // ----------------------------------------------------------

  Widget _checkoutSection() {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Color(0xffdddddd),
          ),
        ),
      ),
      padding: const EdgeInsets.fromLTRB(24, 13, 24, 22),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'DUE NOW',
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),

                  SizedBox(height: 3),

                  Text(
                    '\$66.42',
                    style: TextStyle(
                      fontFamily: 'Georgia',
                      fontSize: 29,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),

                  SizedBox(height: 2),

                  Text(
                    'Taxes & delivery included',
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),

              const Spacer(),

              SizedBox(
                width: 190,
                height: 58,
                child: ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Checkout started successfully.',
                        ),
                        backgroundColor: Color(0xff8f1717),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff8f1717),
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  child: const Text(
                    'CHECKOUT',
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 13),

          const Text(
            'Secure checkout • Protected payment • Collector guarantee',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Arial',
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}