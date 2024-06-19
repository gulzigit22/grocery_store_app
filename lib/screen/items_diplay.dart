// import 'package:flutter/material.dart';

// class FoodDetailScreen extends StatefulWidget {
//   @override
//   _FoodDetailScreenState createState() => _FoodDetailScreenState();
// }

// class _FoodDetailScreenState extends State<FoodDetailScreen> {
//   final Cart cart = Cart();
//   final Food food = Food(name: 'Pizza', price: 9.99); // Пример еды
//   int quantity = 1;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Food Detail'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             // Другая информация о еде
//             Spacer(),
//             Material(
//               color: Colors.blue,
//               borderRadius: BorderRadius.circular(15),
//               child: InkWell(
//                 borderRadius: BorderRadius.circular(15),
//                 onTap: () {
//                   cart.addItem(food, quantity);
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     SnackBar(
//                       content: Text('${food.name} added to cart'),
//                     ),
//                   );
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => CartPage(cart: cart),
//                     ),
//                   );
//                 },
//                 child: Container(
//                   height: 65,
//                   width: double.infinity,
//                   padding: const EdgeInsets.symmetric(vertical: 21),
//                   child: const Text(
//                     "Add to Cart",
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       fontSize: 20,
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 16),
//             Material(
//               color: Colors.red,
//               borderRadius: BorderRadius.circular(15),
//               child: InkWell(
//                 borderRadius: BorderRadius.circular(15),
//                 onTap: () {
//                   cart.clear();
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     const SnackBar(
//                       content: Text('Cart cleared'),
//                     ),
//                   );
//                 },
//                 child: Container(
//                   height: 65,
//                   width: double.infinity,
//                   padding: const EdgeInsets.symmetric(vertical: 21),
//                   child: const Text(
//                     "Clear Cart",
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       fontSize: 20,
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class Cart {
//   final List<Food> _items = [];

//   void addItem(Food food, int quantity) {
//     for (int i = 0; i < quantity; i++) {
//       _items.add(food);
//     }
//   }

//   void clear() {
//     _items.clear();
//   }

//   List<Food> get items => _items;
// }

// class Food {
//   final String name;
//   final double price;

//   Food({required this.name, required this.price});
// }

// class CartPage extends StatefulWidget {
//   final Cart cart;

//   CartPage({required this.cart});

//   @override
//   State<CartPage> createState() => _CartPageState();
// }

// class _CartPageState extends State<CartPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Your Cart'),
//       ),
//       body: ListView.builder(
//         itemCount: widget.cart.items.length,
//         itemBuilder: (context, index) {
//           final item = widget.cart.items[index];
//           return Container(
//             margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
//             height: 120,
//             decoration: BoxDecoration(
//               color: Colors.green,
//               borderRadius: BorderRadius.circular(20),
//             ),
//             child: Center(
//               child: Row(
//                 children: [
//                   // Card(
//                   //   child: Image.asset(
//                   //     item.food.image,
//                   //     width: 106,
//                   //     height: 97,
//                   //     fit: BoxFit.cover,
//                   //   ),
//                   // ),
//                   Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       // Text(
//                       //   item.food.name,
//                       //   style: const TextStyle(
//                       //       fontSize: 20, fontWeight: FontWeight.w600),
//                       // ),
//                       // Text(
//                       //   '\$${item.food.price * item.quantity}',
//                       //   style: const TextStyle(
//                       //       fontSize: 20, fontWeight: FontWeight.w600),
//                       // ),
//                     ],
//                   ),
//                   const SizedBox(width: 35),
//                   IconButton(
//                     icon: Icon(
//                       Icons.add,
//                       size: MediaQuery.of(context).size.width * 0.06,
//                     ),
//                     onPressed: () {
//                       setState(() {
//                         // widget.cart.addItem(item.food, 1);
//                       });
//                       // ScaffoldMessenger.of(context).showSnackBar(
//                       //   SnackBar(
//                       // content: Text('${item.food.name} added to cart')),
//                       // );
//                     },
//                   ),
//                   // Text(
//                   //   '${item.quantity}',
//                   //   style: TextStyle(
//                   //     fontSize: MediaQuery.of(context).size.width * 0.04,
//                   //   ),
//                   // ),
//                   IconButton(
//                     icon: Icon(
//                       Icons.remove,
//                       size: MediaQuery.of(context).size.width * 0.06,
//                     ),
//                     onPressed: () {
//                       // setState(() {
//                       //   if (item.quantity > 1) {
//                       //     item.quantity--;
//                       //   } else {
//                       //     widget.cart.removeItem(item.food);
//                       //   }
//                       // });
//                       // ScaffoldMessenger.of(context).showSnackBar(
//                       //   SnackBar(
//                       //     content: Text('${item.food.name} removed from cart'),
//                       //   ),
//                       // );
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
