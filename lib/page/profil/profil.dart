// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:grocery_store_app/page/profil/profile_page.dart';
// import 'package:image_picker/image_picker.dart';

// class PrifileRegistor extends StatefulWidget {
//   const PrifileRegistor({super.key});

//   @override
//   // ignore: library_private_types_in_public_api
//   _PrifileRegistorState createState() => _PrifileRegistorState();
// }

// class _PrifileRegistorState extends State<PrifileRegistor> {
//   final TextEditingController nameLastNameCtl = TextEditingController();
//   final TextEditingController phoneCtl = TextEditingController();
//   File? _imageFile;
//   final ImagePicker _picker = ImagePicker();

//   void _showIncompleteDialog() {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Маалыматтар толук эмес'),
//           content: Text('Маалыматтарды толуктап жазыңыз !!!'),
//           actions: <Widget>[
//             TextButton(
//               child: Text('ОК'),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }

//   Future<void> _pickImage() async {
//     try {
//       final XFile? pickedFile =
//           await _picker.pickImage(source: ImageSource.gallery);
//       if (pickedFile != null) {
//         setState(() {
//           _imageFile = File(pickedFile.path);
//         });
//       }
//     } catch (e) {
//       print("Ошибка при выборе изображения: $e");
//     }
//   }

//   void _saveProfile() {
//     if (nameLastNameCtl.text.isNotEmpty &&
//         phoneCtl.text.isNotEmpty &&
//         _imageFile != null) {
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => ProfilPage(
//               // nameLastName: nameLastNameCtl.text,
//               // phone: phoneCtl.text,
//               // imageFile: _imageFile!,
//               ),
//         ),
//       );
//     } else {
//       _showIncompleteDialog();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: const Text('Профиль'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             GestureDetector(
//               onTap: _pickImage,
//               child: CircleAvatar(
//                 radius: 50,
//                 backgroundImage:
//                     _imageFile != null ? FileImage(_imageFile!) : null,
//                 child: _imageFile == null
//                     ? Icon(Icons.camera_alt, size: 50)
//                     : null,
//               ),
//             ),
//             const SizedBox(height: 20),
//             TextFormField(
//               controller: nameLastNameCtl,
//               decoration: const InputDecoration(
//                 focusedBorder: OutlineInputBorder(
//                   borderSide: BorderSide(
//                     color: Color(0xff056C5C),
//                   ),
//                 ),
//                 enabledBorder: OutlineInputBorder(
//                   borderSide: BorderSide(
//                     color: Color(0xff056C5C),
//                   ),
//                 ),
//                 labelText: 'Аты-Жөнү',
//                 labelStyle: TextStyle(
//                   fontSize: 16,
//                   color: Colors.black,
//                 ),
//               ),
//             ),
//             const SizedBox(height: 14),
//             TextFormField(
//               controller: phoneCtl,
//               decoration: const InputDecoration(
//                 focusedBorder: OutlineInputBorder(
//                   borderSide: BorderSide(
//                     color: Color(0xff056C5C),
//                   ),
//                 ),
//                 enabledBorder: OutlineInputBorder(
//                   borderSide: BorderSide(
//                     color: Color(0xff056C5C),
//                   ),
//                 ),
//                 labelText: 'Телефон номер',
//                 labelStyle: TextStyle(
//                   fontSize: 16,
//                   color: Colors.black,
//                 ),
//               ),
//             ),
//             const SizedBox(height: 34),
//             SizedBox(
//               width: 160,
//               height: 46,
//               child: ElevatedButton(
//                 onPressed: _saveProfile,
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: const Color(0xff056C5C),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(6),
//                   ),
//                 ),
//                 child: const Text(
//                   'Сактоо',
//                   style: TextStyle(color: Colors.white),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
