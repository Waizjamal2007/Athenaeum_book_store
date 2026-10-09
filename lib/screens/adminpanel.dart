import 'package:flutter/material.dart';

void main() {
  runApp(const AdminApp());
}


class AdminApp extends StatelessWidget {
  const AdminApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Admin Panel',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF7F5EF),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFA64220),
        ),
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}


const Color mainBrown = Color(0xFFA64220);
const Color cream = Color(0xFFF7F5EF);
const Color cardColor = Color(0xFFFFFEFA);
const Color darkText = Color(0xFF171717);
const Color greyText = Color(0xFF6F6A62);
const Color borderColor = Color(0xFFE2DED5);
const Color lightBrown = Color(0xFFF3E4DC);



class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool hidePassword = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void login() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (email == "admin@gmail.com" && password == "maaz123") {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const AdminDashboard(),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Invalid admin email or password"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cream,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Container(
            constraints: const BoxConstraints(maxWidth: 450),
            padding: const EdgeInsets.all(28),
            decoration: BoxDecoration(
              color: cardColor,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: borderColor),
            ),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      color: lightBrown,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: const Icon(
                      Icons.admin_panel_settings,
                      size: 38,
                      color: mainBrown,
                    ),
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    "Admin Login",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: darkText,
                    ),
                  ),

                  const SizedBox(height: 8),

                  const Text(
                    "Login to access your admin panel",
                    style: TextStyle(
                      color: greyText,
                    ),
                  ),

                  const SizedBox(height: 30),

                  // EMAIL
                  TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: "Email",
                      hintText: "admin@gmail.com",
                      prefixIcon: const Icon(Icons.email_outlined),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Please enter email";
                      }

                      if (!RegExp(
                        r'^[^@]+@[^@]+\.[^@]+',
                      ).hasMatch(value.trim())) {
                        return "Enter a valid email";
                      }

                      return null;
                    },
                  ),

                  const SizedBox(height: 18),

                  // PASSWORD
                  TextFormField(
                    controller: passwordController,
                    obscureText: hidePassword,
                    decoration: InputDecoration(
                      labelText: "Password",
                      hintText: "Enter password",
                      prefixIcon: const Icon(Icons.lock_outline),
                      suffixIcon: IconButton(
                        icon: Icon(
                          hidePassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                        onPressed: () {
                          setState(() {
                            hidePassword = !hidePassword;
                          });
                        },
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter password";
                      }

                      if (value.length < 6) {
                        return "Password must be at least 6 characters";
                      }

                      return null;
                    },
                  ),

                  const SizedBox(height: 25),

                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: ElevatedButton(
                      onPressed: login,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: mainBrown,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),






                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


class AdminDashboard extends StatelessWidget {
  const AdminDashboard({super.key});

  void logout(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text("Logout"),
          content: const Text(
            "Are you sure you want to logout?",
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext);
              },
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: mainBrown,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(dialogContext);

                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginPage(),
                  ),
                      (route) => false,
                );
              },
              child: const Text("Logout"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Admin Dashboard",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: cream,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const NotificationsPage(),
                ),
              );
            },
          ),
          const SizedBox(width: 8),
        ],
      ),


      drawer: Drawer(
        backgroundColor: cream,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: mainBrown,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  CircleAvatar(
                    radius: 28,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.admin_panel_settings,
                      color: mainBrown,
                      size: 30,
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    "Admin Panel",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "admin@gmail.com",
                    style: TextStyle(
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),

            ListTile(
              leading: const Icon(Icons.dashboard),
              title: const Text("Dashboard"),
              onTap: () {
                Navigator.pop(context);
              },
            ),

            ListTile(
              leading: const Icon(Icons.people_outline),
              title: const Text("Users"),
              onTap: () {
                Navigator.pop(context);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const UsersPage(),
                  ),
                );
              },
            ),

            ListTile(
              leading: const Icon(Icons.shopping_bag_outlined),
              title: const Text("Orders"),
              onTap: () {
                Navigator.pop(context);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const OrdersPage(),
                  ),
                );
              },
            ),

            ListTile(
              leading: const Icon(Icons.inventory_2_outlined),
              title: const Text("Products"),
              onTap: () {
                Navigator.pop(context);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProductsPage(),
                  ),
                );
              },
            ),

            ListTile(
              leading: const Icon(Icons.settings_outlined),
              title: const Text("Settings"),
              onTap: () {
                Navigator.pop(context);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SettingsPage(),
                  ),
                );
              },
            ),

            const Divider(),

            ListTile(
              leading: const Icon(
                Icons.logout,
                color: mainBrown,
              ),
              title: const Text(
                "Logout",
                style: TextStyle(
                  color: mainBrown,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                logout(context);
              },
            ),
          ],
        ),
      ),



      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Welcome, Admin ",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: darkText,
              ),
            ),

            const SizedBox(height: 5),

            const Text(
              "Here's what's happening today.",
              style: TextStyle(
                color: greyText,
              ),
            ),

            const SizedBox(height: 25),

            // STATS
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount:
              MediaQuery.of(context).size.width > 700 ? 4 : 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1.35,
              children: [
                statCard(
                  "Users",
                  "1,250",
                  Icons.people,
                ),
                statCard(
                  "Orders",
                  "320",
                  Icons.shopping_cart,
                ),
                statCard(
                  "Products",
                  "85",
                  Icons.inventory,
                ),
                statCard(
                  "Revenue",
                  "\$12,450",
                  Icons.attach_money,
                ),
              ],
            ),

            const SizedBox(height: 30),

            // RECENT ORDERS
            const Text(
              "Recent Orders",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            orderCard(
              context,
              "#1001",
              "Ali Khan",
              "\$120",
              "Completed",
            ),

            orderCard(
              context,
              "#1002",
              "Ahmed",
              "\$85",
              "Pending",
            ),

            orderCard(
              context,
              "#1003",
              "Hamza",
              "\$210",
              "Completed",
            ),

            const SizedBox(height: 25),

            const Text(
              "Quick Actions",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            Row(
              children: [
                Expanded(
                  child: quickButton(
                    context,
                    "Add User",
                    Icons.person_add,
                    const AddUserPage(),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: quickButton(
                    context,
                    "Add Product",
                    Icons.add_box,
                    const AddProductPage(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget statCard(
      String title,
      String value,
      IconData icon,
      ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: mainBrown,
            size: 28,
          ),
          const Spacer(),
          Text(
            value,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            title,
            style: const TextStyle(
              color: greyText,
            ),
          ),
        ],
      ),
    );
  }

  Widget orderCard(
      BuildContext context,
      String orderId,
      String name,
      String price,
      String status,
      ) {
    return Card(
      color: cardColor,
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
        side: const BorderSide(color: borderColor),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: lightBrown,
          child: const Icon(
            Icons.shopping_bag,
            color: mainBrown,
          ),
        ),
        title: Text(
          "$orderId - $name",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(price),
        trailing: Text(
          status,
          style: TextStyle(
            color: status == "Completed"
                ? Colors.green
                : Colors.orange,
            fontWeight: FontWeight.bold,
          ),
        ),
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Order $orderId selected"),
            ),
          );
        },
      ),
    );
  }

  Widget quickButton(
      BuildContext context,
      String title,
      IconData icon,
      Widget page,
      ) {
    return SizedBox(
      height: 55,
      child: ElevatedButton.icon(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => page,
            ),
          );
        },
        icon: Icon(icon),
        label: Text(title),
        style: ElevatedButton.styleFrom(
          backgroundColor: mainBrown,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}



class UsersPage extends StatelessWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Users"),
        backgroundColor: cream,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          userCard(
            context,
            "Ali Khan",
            "ali@gmail.com",
          ),
          userCard(
            context,
            "Ahmed",
            "ahmed@gmail.com",
          ),
          userCard(
            context,
            "Hamza",
            "hamza@gmail.com",
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: mainBrown,
        foregroundColor: Colors.white,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddUserPage(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget userCard(
      BuildContext context,
      String name,
      String email,
      ) {
    return Card(
      color: cardColor,
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
        side: const BorderSide(color: borderColor),
      ),
      child: ListTile(
        leading: const CircleAvatar(
          backgroundColor: lightBrown,
          child: Icon(
            Icons.person,
            color: mainBrown,
          ),
        ),
        title: Text(
          name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(email),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("$name selected"),
            ),
          );
        },
      ),
    );
  }
}



class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Orders"),
        backgroundColor: cream,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          orderItem(
            context,
            "#1001",
            "Ali Khan",
            "\$120",
            "Completed",
          ),
          orderItem(
            context,
            "#1002",
            "Ahmed",
            "\$85",
            "Pending",
          ),
          orderItem(
            context,
            "#1003",
            "Hamza",
            "\$210",
            "Completed",
          ),
          orderItem(
            context,
            "#1004",
            "Usman",
            "\$50",
            "Pending",
          ),
        ],
      ),
    );
  }

  Widget orderItem(
      BuildContext context,
      String id,
      String name,
      String price,
      String status,
      ) {
    return Card(
      color: cardColor,
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: const Icon(
          Icons.shopping_cart,
          color: mainBrown,
        ),
        title: Text(
          "$id - $name",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(price),
        trailing: Text(
          status,
          style: TextStyle(
            color: status == "Completed"
                ? Colors.green
                : Colors.orange,
            fontWeight: FontWeight.bold,
          ),
        ),
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Order $id opened"),
            ),
          );
        },
      ),
    );
  }
}



class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products"),
        backgroundColor: cream,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          productCard(
            context,
            "Wireless Headphones",
            "\$80",
            Icons.headphones,
          ),
          productCard(
            context,
            "Smart Watch",
            "\$120",
            Icons.watch,
          ),
          productCard(
            context,
            "Keyboard",
            "\$45",
            Icons.keyboard,
          ),
          productCard(
            context,
            "Gaming Mouse",
            "\$35",
            Icons.mouse,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: mainBrown,
        foregroundColor: Colors.white,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddProductPage(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget productCard(
      BuildContext context,
      String name,
      String price,
      IconData icon,
      ) {
    return Card(
      color: cardColor,
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
        side: const BorderSide(color: borderColor),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: lightBrown,
          child: Icon(
            icon,
            color: mainBrown,
          ),
        ),
        title: Text(
          name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(price),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("$name selected"),
            ),
          );
        },
      ),
    );
  }
}



class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool notifications = true;
  bool darkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        backgroundColor: cream,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            color: cardColor,
            child: SwitchListTile(
              title: const Text("Notifications"),
              subtitle: const Text(
                "Enable admin notifications",
              ),
              value: notifications,
              activeColor: mainBrown,
              onChanged: (value) {
                setState(() {
                  notifications = value;
                });

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      value
                          ? "Notifications enabled"
                          : "Notifications disabled",
                    ),
                  ),
                );
              },
            ),
          ),

          Card(
            color: cardColor,
            child: SwitchListTile(
              title: const Text("Dark Mode"),
              subtitle: const Text(
                "Change application appearance",
              ),
              value: darkMode,
              activeColor: mainBrown,
              onChanged: (value) {
                setState(() {
                  darkMode = value;
                });

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      "Dark mode setting changed",
                    ),
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 10),

          Card(
            color: cardColor,
            child: ListTile(
              leading: const Icon(
                Icons.info_outline,
                color: mainBrown,
              ),
              title: const Text("About"),
              subtitle: const Text("Admin Panel App"),
              onTap: () {
                showAboutDialog(
                  context: context,
                  applicationName: "Admin Panel",
                  applicationVersion: "1.0.0",
                  applicationLegalese: "Semester 5 Flutter Project",
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}



class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifications"),
        backgroundColor: cream,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          notificationCard(
            "New Order",
            "You received a new order.",
            Icons.shopping_cart,
          ),
          notificationCard(
            "New User",
            "A new user registered.",
            Icons.person_add,
          ),
          notificationCard(
            "Payment Received",
            "Payment has been received.",
            Icons.payment,
          ),
        ],
      ),
    );
  }

  Widget notificationCard(
      String title,
      String subtitle,
      IconData icon,
      ) {
    return Card(
      color: cardColor,
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: lightBrown,
          child: Icon(
            icon,
            color: mainBrown,
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(subtitle),
      ),
    );
  }
}


class AddUserPage extends StatefulWidget {
  const AddUserPage({super.key});

  @override
  State<AddUserPage> createState() => _AddUserPageState();
}

class _AddUserPageState extends State<AddUserPage> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    super.dispose();
  }

  void addUser() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("User added successfully"),
      ),
    );

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add User"),
        backgroundColor: cream,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: "Name",
                  prefixIcon: const Icon(Icons.person_outline),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Please enter name";
                  }

                  if (value.trim().length < 3) {
                    return "Name must be at least 3 characters";
                  }

                  return null;
                },
              ),

              const SizedBox(height: 18),

              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: "Email",
                  prefixIcon: const Icon(Icons.email_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Please enter email";
                  }

                  if (!RegExp(
                    r'^[^@]+@[^@]+\.[^@]+',
                  ).hasMatch(value.trim())) {
                    return "Enter a valid email";
                  }

                  return null;
                },
              ),

              const SizedBox(height: 25),

              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: addUser,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: mainBrown,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text(
                    "Add User",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



class AddProductPage extends StatefulWidget {
  const AddProductPage({super.key});

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final priceController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    priceController.dispose();
    super.dispose();
  }

  void addProduct() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Product added successfully"),
      ),
    );

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Product"),
        backgroundColor: cream,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: "Product Name",
                  prefixIcon: const Icon(Icons.inventory_2_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Please enter product name";
                  }

                  if (value.trim().length < 3) {
                    return "Product name must be at least 3 characters";
                  }

                  return null;
                },
              ),

              const SizedBox(height: 18),

              TextFormField(
                controller: priceController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Price",
                  prefixIcon: const Icon(Icons.attach_money),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Please enter price";
                  }

                  double? price = double.tryParse(
                    value.trim(),
                  );

                  if (price == null) {
                    return "Enter a valid number";
                  }

                  if (price <= 0) {
                    return "Price must be greater than 0";
                  }

                  return null;
                },
              ),

              const SizedBox(height: 25),

              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: addProduct,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: mainBrown,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text(
                    "Add Product",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}