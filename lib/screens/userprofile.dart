import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ProfilePage(),
  ));
}

const Color brown = Color(0xFFA64220);

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final ImagePicker picker = ImagePicker();

  File? profileImage;
  String name = 'John Doe';
  String email = 'johndoe@gmail.com';
  String phone = '+92 300 1234567';
  String location = 'Karachi, Pakistan';
  bool notifications = true;
  bool darkMode = false;

  Future<void> selectImage(ImageSource source) async {
    try {
      final image = await picker.pickImage(
        source: source,
        imageQuality: 85,
      );
      if (image != null && mounted) {
        setState(() => profileImage = File(image.path));
      }
    } catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Unable to select image')),
      );
    }
  }

  void changePicture() {
    showModalBottomSheet(
      context: context,
      builder: (sheet) => SafeArea(
        child: Wrap(
          children: [
            const ListTile(title: Text('Change Profile Picture')),
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Choose from Gallery'),
              onTap: () {
                Navigator.pop(sheet);
                selectImage(ImageSource.gallery);
              },
            ),
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('Take a Photo'),
              onTap: () {
                Navigator.pop(sheet);
                selectImage(ImageSource.camera);
              },
            ),
            if (profileImage != null)
              ListTile(
                leading: const Icon(Icons.delete, color: Colors.red),
                title: const Text('Remove Photo'),
                onTap: () {
                  Navigator.pop(sheet);
                  setState(() => profileImage = null);
                },
              ),
          ],
        ),
      ),
    );
  }

  void editProfile() {
    final nameC = TextEditingController(text: name);
    final emailC = TextEditingController(text: email);
    final phoneC = TextEditingController(text: phone);
    final locationC = TextEditingController(text: location);

    showDialog(
      context: context,
      builder: (dialog) => AlertDialog(
        title: const Text('Edit Profile'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameC,
                decoration: const InputDecoration(labelText: 'Full Name'),
              ),
              TextField(
                controller: emailC,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(labelText: 'Email Address'),
              ),
              TextField(
                controller: phoneC,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(labelText: 'Phone Number'),
              ),
              TextField(
                controller: locationC,
                decoration: const InputDecoration(labelText: 'Location'),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialog),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              if (nameC.text.trim().isEmpty ||
                  !RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$')
                      .hasMatch(emailC.text.trim())) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Enter valid name and email')),
                );
                return;
              }
              setState(() {
                name = nameC.text.trim();
                email = emailC.text.trim();
                phone = phoneC.text.trim();
                location = locationC.text.trim();
              });
              Navigator.pop(dialog);
            },
            child: const Text('Save Changes'),
          ),
        ],
      ),
    ).then((_) {
      nameC.dispose();
      emailC.dispose();
      phoneC.dispose();
      locationC.dispose();
    });
  }

  void changePassword() {
    final form = GlobalKey<FormState>();
    final current = TextEditingController();
    final newPass = TextEditingController();
    final confirm = TextEditingController();

    showDialog(
      context: context,
      builder: (dialog) => AlertDialog(
        title: const Text('Change Password'),
        content: Form(
          key: form,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: current,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Current Password',
                    prefixIcon: Icon(Icons.lock_outline),
                  ),
                  validator: (v) => v == null || v.isEmpty
                      ? 'Enter current password'
                      : null,
                ),
                TextFormField(
                  controller: newPass,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'New Password',
                    prefixIcon: Icon(Icons.lock),
                  ),
                  validator: (v) {
                    if (v == null || v.length < 8) {
                      return 'Minimum 8 characters';
                    }
                    if (v == current.text) {
                      return 'Choose a different password';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: confirm,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Confirm New Password',
                    prefixIcon: Icon(Icons.lock_reset),
                  ),
                  validator: (v) =>
                  v != newPass.text ? 'Passwords do not match' : null,
                ),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialog),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              if (!form.currentState!.validate()) return;
              Navigator.pop(dialog);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                    'Form validated. Connect Firebase to update password.',
                  ),
                ),
              );
            },
            child: const Text('Update Password'),
          ),
        ],
      ),
    ).then((_) {
      current.dispose();
      newPass.dispose();
      confirm.dispose();
    });
  }

  void openSettings() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (settingsContext) => Scaffold(
          appBar: AppBar(title: const Text('Settings')),
          body: ListView(
            children: [
              SwitchListTile(
                secondary: const Icon(Icons.dark_mode, color: brown),
                title: const Text('Dark Mode'),
                value: darkMode,
                onChanged: (value) {
                  setState(() => darkMode = value);
                  Navigator.pop(settingsContext);
                  openSettings();
                },
              ),
              ListTile(
                leading: const Icon(Icons.person, color: brown),
                title: const Text('Edit Profile'),
                onTap: () {
                  Navigator.pop(settingsContext);
                  editProfile();
                },
              ),
              ListTile(
                leading: const Icon(Icons.lock, color: brown),
                title: const Text('Change Password'),
                onTap: () {
                  Navigator.pop(settingsContext);
                  changePassword();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void openNotifications() {
    showDialog(
      context: context,
      builder: (dialog) => StatefulBuilder(
        builder: (context, update) => AlertDialog(
          title: const Text('Notifications'),
          content: SwitchListTile(
            title: const Text('Enable Notifications'),
            value: notifications,
            onChanged: (value) {
              update(() => notifications = value);
              setState(() {});
            },
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialog),
              child: const Text('Done'),
            ),
          ],
        ),
      ),
    );
  }

  void logout() {
    showDialog(
      context: context,
      builder: (dialog) => AlertDialog(
        title: const Text('Logout'),
        content: const Text('Are you sure you want to log out?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialog),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(dialog);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (_) => const Scaffold(
                    body: Center(
                      child: Text(
                        'You have been logged out',
                        style: TextStyle(fontSize: 22),
                      ),
                    ),
                  ),
                ),
              );
            },
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: darkMode ? ThemeData.dark() : ThemeData.light(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('My Profile'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(28),
                decoration: const BoxDecoration(
                  color: brown,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(30),
                  ),
                ),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: changePicture,
                      child: Stack(
                        children: [
                          CircleAvatar(
                            radius: 58,
                            backgroundColor: Colors.white,
                            backgroundImage: profileImage != null
                                ? FileImage(profileImage!)
                                : null,
                            child: profileImage == null
                                ? const Icon(
                              Icons.person,
                              size: 65,
                              color: brown,
                            )
                                : null,
                          ),
                          const Positioned(
                            right: 0,
                            bottom: 0,
                            child: CircleAvatar(
                              radius: 18,
                              backgroundColor: Colors.white,
                              child: Icon(
                                Icons.camera_alt,
                                color: brown,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      email,
                      style: const TextStyle(color: Colors.white70),
                    ),
                    const SizedBox(height: 18),
                    ElevatedButton.icon(
                      onPressed: editProfile,
                      icon: const Icon(Icons.edit),
                      label: const Text('Edit Profile'),
                    ),
                    TextButton(
                      onPressed: changePicture,
                      child: const Text(
                        'Change Profile Picture',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    infoTile(Icons.person_outline, 'Full Name', name),
                    infoTile(Icons.email_outlined, 'Email Address', email),
                    infoTile(Icons.phone_outlined, 'Phone Number', phone),
                    infoTile(
                      Icons.location_on_outlined,
                      'Location',
                      location,
                    ),
                    const SizedBox(height: 15),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Account Settings',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    settingTile(Icons.settings, 'Settings'),
                    settingTile(Icons.lock_outline, 'Change Password'),
                    settingTile(Icons.notifications_none, 'Notifications'),
                    settingTile(Icons.logout, 'Logout'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget infoTile(IconData icon, String title, String value) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Icon(icon, color: brown),
        title: Text(
          title,
          style: const TextStyle(color: Colors.grey, fontSize: 13),
        ),
        subtitle: Text(
          value,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  Widget settingTile(IconData icon, String title) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: Icon(icon, color: brown),
        title: Text(title),
        trailing: const Icon(Icons.arrow_forward_ios, size: 15),
        onTap: () {
          switch (title) {
            case 'Settings':
              openSettings();
              break;
            case 'Change Password':
              changePassword();
              break;
            case 'Notifications':
              openNotifications();
              break;
            case 'Logout':
              logout();
              break;
          }
        },
      ),
    );
  }
}