import 'package:flutter/material.dart';
import 'shopping_cart_screen.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool hidePassword = true;
  bool hideConfirmPassword = true;

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
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

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.close,
                        size: 32,
                      ),
                    ),
                    Column(
                      children: const [
                        Text(
                          'Athenaeum',
                          style: TextStyle(
                            fontFamily: 'Georgia',
                            fontSize: 31,
                          ),
                        ),
                        Text(
                          'LITERARY FOLIO',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 2.2,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.black,
                          width: 2,
                        ),
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

              const SizedBox(height: 110),

              Container(
                margin: const EdgeInsets.symmetric(horizontal: 12),
                padding: const EdgeInsets.fromLTRB(
                  38,
                  45,
                  38,
                  45,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xffdedede),
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
                        ),
                      ),
                    ),

                    const SizedBox(height: 10),

                    const Center(
                      child: Text(
                        'Create your account to manage collections and\nreading lists',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          height: 1.45,
                        ),
                      ),
                    ),

                    const SizedBox(height: 40),

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
                            child: InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: const Center(
                                child: Text(
                                  'Sign In',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              alignment: Alignment.center,
                              decoration: const BoxDecoration(
                                border: Border(
                                  left: BorderSide(
                                    color: Color(0xffeeeeee),
                                  ),
                                ),
                              ),
                              child: const Text(
                                'Create Account',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 28),

                    const Text(
                      'Full name',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 9),

                    _textField(
                      controller: nameController,
                      hint: 'Your name',
                      icon: Icons.person_outline,
                    ),

                    const SizedBox(height: 20),

                    const Text(
                      'Email address',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 9),

                    _textField(
                      controller: emailController,
                      hint: 'name@athenaeum.lit',
                      icon: Icons.alternate_email,
                    ),

                    const SizedBox(height: 20),

                    const Text(
                      'Password',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 9),

                    _passwordField(
                      controller: passwordController,
                      hidden: hidePassword,
                      onToggle: () {
                        setState(() {
                          hidePassword = !hidePassword;
                        });
                      },
                    ),

                    const SizedBox(height: 20),

                    const Text(
                      'Confirm Password',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 9),

                    _passwordField(
                      controller: confirmPasswordController,
                      hidden: hideConfirmPassword,
                      onToggle: () {
                        setState(() {
                          hideConfirmPassword =
                              !hideConfirmPassword;
                        });
                      },
                    ),

                    const SizedBox(height: 28),

                    SizedBox(
                      width: double.infinity,
                      height: 64,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (_) =>
                                  const ShoppingCartScreen(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                          elevation: 0,
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Create Account',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 12),
                            Icon(Icons.arrow_forward),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 30),

                    Row(
                      children: [
                        const Expanded(
                          child: Divider(
                            color: Color(0xffeeeeee),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Text(
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

                    const SizedBox(height: 22),

                    Row(
                      children: [
                        Expanded(
                          child: _socialButton(
                            const Text(
                              'G   Google',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: _socialButton(
                            const Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.center,
                              children: [
                                Icon(Icons.apple, size: 25),
                                SizedBox(width: 7),
                                Text(
                                  'Apple',
                                  style: TextStyle(
                                    fontSize: 17,
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

  Widget _textField({
    required TextEditingController controller,
    required String hint,
    required IconData icon,
  }) {
    return Container(
      height: 62,
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xffcfcfcf),
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          const SizedBox(width: 16),
          Icon(icon, size: 25),
          const SizedBox(width: 12),
          Expanded(
            child: TextField(
              controller: controller,
              style: const TextStyle(fontSize: 17),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hint,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _passwordField({
    required TextEditingController controller,
    required bool hidden,
    required VoidCallback onToggle,
  }) {
    return Container(
      height: 62,
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xffcfcfcf),
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          const SizedBox(width: 16),
          const Icon(
            Icons.lock_outline,
            size: 25,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: TextField(
              controller: controller,
              obscureText: hidden,
              decoration: const InputDecoration(
                border: InputBorder.none,
              ),
            ),
          ),
          IconButton(
            onPressed: onToggle,
            icon: Icon(
              hidden
                  ? Icons.visibility_outlined
                  : Icons.visibility_off_outlined,
            ),
          ),
        ],
      ),
    );
  }

  Widget _socialButton(Widget child) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xffd0d0d0),
        ),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Center(child: child),
    );
  }
}