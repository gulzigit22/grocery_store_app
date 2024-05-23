import 'package:flutter/material.dart';

class UserProfile {
  final String name;
  final String email;
  // final String imageUrl;
  final String phoneNumber;
  final String address;

  UserProfile({
    required this.name,
    required this.email,
    // required this.imageUrl,
    required this.phoneNumber,
    required this.address,
  });
}

class ProfilePage extends StatelessWidget {
  final UserProfile user = UserProfile(
    name: 'John Doe',
    email: 'johndoe@example.com',
    // imageUrl: 'assets/profile_image.png', // Replace with your own image asset
    phoneNumber: '+1 234 567 890',
    address: '123 Main Street, Anytown, USA',
  );

  ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              CircleAvatar(
                radius: 50,
                // backgroundImage: AssetImage(user.imageUrl),
              ),
              const SizedBox(height: 16),
              Text(
                user.name,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                user.email,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 16),
              ListTile(
                leading: const Icon(Icons.phone),
                title: const Text('Phone'),
                subtitle: Text(user.phoneNumber),
              ),
              ListTile(
                leading: const Icon(Icons.location_on),
                title: const Text('Address'),
                subtitle: Text(user.address),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Navigate to edit profile page
                },
                child: const Text('Edit Profile'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
