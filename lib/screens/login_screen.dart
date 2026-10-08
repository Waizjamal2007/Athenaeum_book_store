import 'package:flutter/material.dart';
import 'registration_screen.dart';
import 'shopping_cart_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController =
      TextEditingController(text: 'name@athenaeum.lit');

  final TextEditingController passwordController =
      TextEditingController(text: 'password123456');

  bool obscurePassword = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void openShopping() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => const ShoppingCartScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 22),

              // TOP HEADER
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: const Icon(
                        Icons.close,
                        size: 32,
                        color: Colors.black,
                      ),
                    ),
                    Column(
                      children: const [
                        Text(
                          'Athenaeum',
                          style: TextStyle(
                            fontFamily: 'Georgia',
                            fontSize: 31,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          'LITERARY FOLIO',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 2.2,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 2,
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                        child: Text(
                          '?',
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 190),

              // MAIN CARD
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 12),
                padding: const EdgeInsets.fromLTRB(38, 48, 38, 50),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: const Color(0xffdedede),
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                      child: Text(
                        'Access Your Library',
                        style: TextStyle(
                          fontFamily: 'Georgia',
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),

                    const SizedBox(height: 10),

                    const Center(
                      child: Text(
                        'Enter your credentials to manage collections and\nreading lists',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          height: 1.45,
                        ),
                      ),
                    ),

                    const SizedBox(height: 48),

                    // SIGN IN / CREATE ACCOUNT
                    Container(
                      height: 64,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color(0xffdedede),
                        ),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              alignment: Alignment.center,
                              decoration: const BoxDecoration(
                                border: Border(
                                  right: BorderSide(
                                    color: Color(0xffeeeeee),
                                  ),
                                ),
                              ),
                              child: const Text(
                                'Sign In',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) =>
                                        const RegistrationScreen(),
                                  ),
                                );
                              },
                              child: const Center(
                                child: Text(
                                  'Create Account',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 45),

                    const Text(
                      'Email address',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 10),

                    _emailField(),

                    const SizedBox(height: 30),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Password',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Forgot Password?',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xff8e332c),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),

                    _passwordField(),

                    const SizedBox(height: 32),

                    // SIGN IN BUTTON
                    SizedBox(
                      width: double.infinity,
                      height: 64,
                      child: ElevatedButton(
                        onPressed: openShopping,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(1),
                          ),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Sign In to Account',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 12),
                            Icon(
                              Icons.arrow_forward,
                              size: 25,
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 36),

                    // OR CONTINUE WITH
                    Row(
                      children: [
                        const Expanded(
                          child: Divider(
                            color: Color(0xffeeeeee),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                          ),
                          child: const Text(
                            'OR CONTINUE WITH',
                            style: TextStyle(
                              fontSize: 14,
                              letterSpacing: 1,
                            ),
                          ),
                        ),
                        const Expanded(
                          child: Divider(
                            color: Color(0xffeeeeee),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 28),

                    Row(
                      children: [
                        Expanded(
                          child: _socialButton(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'G',
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff4285F4),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                const Text(
                                  'Google',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: _socialButton(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(
                                  Icons.apple,
                                  size: 25,
                                  color: Colors.black,
                                ),
                                SizedBox(width: 8),
                                Text(
                                  'Apple',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget _emailField() {
    return Container(
      height: 64,
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xffcfcfcf),
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          const SizedBox(width: 18),
          const Text(
            '@',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: TextField(
              controller: emailController,
              style: const TextStyle(
                fontSize: 18,
              ),
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'name@athenaeum.lit',
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _passwordField() {
    return Container(
      height: 64,
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xffcfcfcf),
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          const SizedBox(width: 18),
          const Icon(
            Icons.lock_outline,
            size: 27,
          ),
          const SizedBox(width: 14),
          Expanded(
            child: TextField(
              controller: passwordController,
              obscureText: obscurePassword,
              style: const TextStyle(
                fontSize: 19,
              ),
              decoration: const InputDecoration(
                border: InputBorder.none,
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                obscurePassword = !obscurePassword;
              });
            },
            icon: Icon(
              obscurePassword
                  ? Icons.visibility_outlined
                  : Icons.visibility_off_outlined,
              size: 26,
            ),
          ),
        ],
      ),
    );
  }

  Widget _socialButton({
    required Widget child,
  }) {
    return Container(
      height: 62,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: const Color(0xffd0d0d0),
        ),
        borderRadius: BorderRadius.circular(4),
      ),
      child: child,
    );
  }
}