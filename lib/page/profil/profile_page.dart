import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilPage extends StatefulWidget {
  const ProfilPage({
    super.key,
    required this.nameLastName,
    required this.phone,
    this.imageFile,
  });
  final String nameLastName;
  final String phone;
  final File? imageFile;
  @override
  State<ProfilPage> createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  late String nameLastName;
  late String phone;
  late File? imageFile;

  @override
  void initState() {
    super.initState();
    nameLastName =
        widget.nameLastName; // Initialize with default values from widget
    phone = widget.phone; // Initialize with default values from widget
    imageFile = widget.imageFile; // Initialize with default values from widget
    loadData();
  }

  Future<void> loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      nameLastName = prefs.getString('nameLastName') ?? widget.nameLastName;
      phone = prefs.getString('phone') ?? widget.phone;
      String? imagePath = prefs.getString('imagePath');
      imageFile = imagePath != null ? File(imagePath) : widget.imageFile;
    });
  }

  // Method to save data to SharedPreferences
  Future<void> saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('nameLastName', nameLastName);
    await prefs.setString('phone', phone);
    if (imageFile != null) {
      await prefs.setString('imagePath', imageFile!.path);
    } else {
      await prefs.remove('imagePath');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'профиль',
          style: TextStyle(fontSize: 30),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 80,
                backgroundImage: imageFile != null
                    ? FileImage(imageFile!)
                    : const AssetImage('assets/fourth.png') as ImageProvider,
              ),
              Text(
                nameLastName,
                style: const TextStyle(
                  fontFamily: 'Pacifico',
                  fontSize: 48,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Divider(
                indent: 65,
                endIndent: 65,
                height: 0,
                thickness: 2,
                color: Colors.white,
              ),
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    const SizedBox(width: 50),
                    const Icon(
                      Icons.phone_outlined,
                      color: Colors.black,
                      size: 28,
                    ),
                    const SizedBox(width: 20),
                    Text(
                      phone,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 60),
              GestureDetector(
                onTap: () {
                  _showEditProfileDialog();
                },
                child: Container(
                  width: 200,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.edit,
                        size: 25,
                      ),
                      Text(
                        'edit',
                        style: TextStyle(fontSize: 25),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showEditProfileDialog() {
    final TextEditingController nameLastNameCtl =
        TextEditingController(text: nameLastName);
    final TextEditingController phoneCtl = TextEditingController(text: phone);
    File? newImageFile = imageFile;
    final ImagePicker picker = ImagePicker();

    Future<void> pickImage() async {
      try {
        final XFile? pickedFile =
            await picker.pickImage(source: ImageSource.gallery);
        if (pickedFile != null) {
          setState(() {
            newImageFile = File(pickedFile.path);
          });
        }
      } catch (e) {
        print("Error picking image: $e");
      }
    }

    void saveProfile() {
      setState(() {
        nameLastName = nameLastNameCtl.text;
        phone = phoneCtl.text;
        imageFile = newImageFile;
      });
      saveData(); // Save updated data to SharedPreferences
      Navigator.of(context).pop();
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Column(
            children: [
              TextFormField(
                controller: nameLastNameCtl,
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xff056C5C),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xff056C5C),
                    ),
                  ),
                  labelText: 'Аты-Жөнү',
                  labelStyle: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 14),
              TextFormField(
                controller: phoneCtl,
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xff056C5C),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xff056C5C),
                    ),
                  ),
                  labelText: 'Телефон номер',
                  labelStyle: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 14),
              ElevatedButton(
                onPressed: pickImage,
                child: const Text('Pick Image'),
              ),
            ],
          ),
          content: const Text('Маалыматтарды толуктап жазыңыз !!!'),
          actions: <Widget>[
            TextButton(
              onPressed: saveProfile,
              child: const Text('Save'),
            ),
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
