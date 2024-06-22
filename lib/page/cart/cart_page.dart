import 'package:flutter/material.dart';
import 'package:grocery_store_app/model/items_model.dart';

class Cart {
  final List<Food> _items = [];
  List<Food> get items => _items;

  void addItem(food, int quantity) {
    var existingItem = _items.firstWhere(
      (item) => item.food.id == food.id,
      orElse: () => Food(food: food, quantity: 0),
    );

    if (existingItem.quantity == 0) {
      _items.add(Food(food: food, quantity: quantity));
    } else {
      existingItem.quantity += quantity;
    }
  }

  void clear() {
    _items.clear();
  }

  void removeItem(FoodDetail food) {
    _items.removeWhere((item) => item.food.id == food.id);
  }

  double get totalPrice =>
      _items.fold(0, (total, item) => total + item.food.price * item.quantity);
}

class Food {
  final FoodDetail food;
  int quantity;

  Food({required this.food, required this.quantity});
}

class CartPage extends StatefulWidget {
  final Cart cart;

  const CartPage({required this.cart});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Арабаң'),
        ),
        body: ListView.builder(
          itemCount: widget.cart.items.length,
          itemBuilder: (context, index) {
            final item = widget.cart.items[index];
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              height: 120,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Row(
                  children: [
                    Card(
                      child: Image.asset(
                        item.food.image,
                        width: 106,
                        height: 97,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.food.name,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          '${item.food.price * item.quantity}сом',
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    const SizedBox(width: 35),
                    IconButton(
                      icon: Icon(
                        Icons.add,
                        size: MediaQuery.of(context).size.width * 0.06,
                      ),
                      onPressed: () {
                        setState(() {
                          widget.cart.addItem(item.food, 1);
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text('${item.food.name} added to cart')),
                        );
                      },
                    ),
                    Text(
                      '${item.quantity}',
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.04,
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.remove,
                        size: MediaQuery.of(context).size.width * 0.06,
                      ),
                      onPressed: () {
                        setState(() {
                          if (item.quantity > 1) {
                            item.quantity--;
                          } else {
                            widget.cart.removeItem(item.food);
                          }
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content:
                                Text('${item.food.name} removed from cart'),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        bottomNavigationBar: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Material(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(15),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(15),
                        onTap: () {
                          setState(() {
                            widget.cart.clear();
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Cart cleared'),
                            ),
                          );
                        },
                        child: Container(
                          height: 65,
                          width: 150,
                          padding: const EdgeInsets.symmetric(vertical: 21),
                          child: const Text(
                            "Тазалоо",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ]),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Material(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(15),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(15),
                        onTap: () {
                          placeOrder();
                          _showCartDialog(context);
                        },
                        child: Container(
                          height: 65,
                          width: 150,
                          padding: const EdgeInsets.symmetric(vertical: 21),
                          child: const Text(
                            "Заказ",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ]),
            ),
          ],
        ));
  }

  void placeOrder() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Order placed'),
      ),
    );
  }

  void _showCartDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Себет жөнүндө маалымат'),
          content: const Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('буюм заказ кылынды'),
            ],
          ),
          actions: <Widget>[
            GestureDetector(
              child: const Text('Жабуу'),
              onTap: () {
                Navigator.of(context)
                    .pop(); // Закрыть диалоговое окно при нажатии на кнопку
              },
            ),
          ],
        );
      },
    );
  }
}

/////////////////
// class Cart {
//   final List<CartItem> _items = [];

//   List<CartItem> get items => _items;
//   //  void addItem(Food food, int quantity) {
//   //   for (int i = 0; i < quantity; i++) {
//   //     _items.add(food);
//   //   }
//   // }

//   void addItem(food, int quantity) {
//     for (int i = 0; i < quantity; i++) {
//       var existingItem = _items.firstWhere(
//         (item) => item.food.id == food.id,
//         orElse: () => CartItem(food: food, quantity: 0),
//       );

//       if (existingItem.quantity == 0) {
//         _items.add(CartItem(food: food, quantity: quantity));
//       } else {
//         existingItem.quantity += quantity;
//       }
//     }
//   }

//   void removeItem(FoodDetail food) {
//     _items.removeWhere((item) => item.food.id == food.id);
//   }

//   double get totalPrice =>
//       _items.fold(0, (total, item) => total + item.food.price * item.quantity);

//   void clear() {
//     _items.clear();
//   }
// }

// class CartItem {
//   final FoodDetail food;
//   int quantity;

//   CartItem({required this.food, required this.quantity});
// }

// class CartPage extends StatefulWidget {
//   final Cart cart;

//   const CartPage({
//     super.key,
//     required this.cart,
//   });

//   @override
//   State<CartPage> createState() => _CartPageState();
// }

// class _CartPageState extends State<CartPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text('Your Cart'),
//           centerTitle: true,
//         ),
//         body: ListView(
//           children: [
//             ListView.builder(
//               shrinkWrap: true,
//               itemCount: widget.cart.items.length,
//               itemBuilder: (context, index) {
//                 final item = widget.cart.items[index];
//                 return Container(
//                   margin:
//                       const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
//                   height: 120,
//                   decoration: BoxDecoration(
//                     color: Colors.green,
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                   child: Center(
//                     child: Row(
//                       children: [
//                         Card(
//                           child: Image.asset(
//                             item.food.image,
//                             width: 106,
//                             height: 97,
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                         Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               item.food.name,
//                               style: const TextStyle(
//                                   fontSize: 20, fontWeight: FontWeight.w600),
//                             ),
//                             Text(
//                               '\$${item.food.price * item.quantity}',
//                               style: const TextStyle(
//                                   fontSize: 20, fontWeight: FontWeight.w600),
//                             ),
//                           ],
//                         ),
//                         const SizedBox(width: 35),
//                         IconButton(
//                           icon: Icon(
//                             Icons.add,
//                             size: MediaQuery.of(context).size.width * 0.06,
//                           ),
//                           onPressed: () {
//                             setState(() {
//                               widget.cart.addItem(item.food, 1);
//                             });
//                             ScaffoldMessenger.of(context).showSnackBar(
//                               SnackBar(
//                                   content:
//                                       Text('${item.food.name} added to cart')),
//                             );
//                           },
//                         ),
//                         Text(
//                           '${item.quantity}',
//                           style: TextStyle(
//                             fontSize: MediaQuery.of(context).size.width * 0.04,
//                           ),
//                         ),
//                         IconButton(
//                           icon: Icon(
//                             Icons.remove,
//                             size: MediaQuery.of(context).size.width * 0.06,
//                           ),
//                           onPressed: () {
//                             setState(() {
//                               if (item.quantity > 1) {
//                                 item.quantity--;
//                               } else {
//                                 widget.cart.removeItem(item.food);
//                               }
//                             });
//                             ScaffoldMessenger.of(context).showSnackBar(
//                               SnackBar(
//                                 content:
//                                     Text('${item.food.name} removed from cart'),
//                               ),
//                             );
//                           },
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ],
//         ),
//         bottomNavigationBar: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Container(
//               padding: const EdgeInsets.all(16.0),
//               child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Material(
//                       color: Colors.red,
//                       borderRadius: BorderRadius.circular(15),
//                       child: InkWell(
//                         borderRadius: BorderRadius.circular(15),
//                         onTap: () {
//                           setState(() {
//                             widget.cart.clear();
//                           });
//                           ScaffoldMessenger.of(context).showSnackBar(
//                             const SnackBar(
//                               content: Text('Cart cleared'),
//                             ),
//                           );
//                         },
//                         child: Container(
//                           height: 65,
//                           width: 150,
//                           padding: const EdgeInsets.symmetric(vertical: 21),
//                           child: const Text(
//                             "Clear Cart",
//                             textAlign: TextAlign.center,
//                             style: TextStyle(
//                               fontSize: 20,
//                               color: Colors.white,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ]),
//             ),
//             Container(
//               padding: const EdgeInsets.all(16.0),
//               child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Material(
//                       color: Colors.green,
//                       borderRadius: BorderRadius.circular(15),
//                       child: InkWell(
//                         borderRadius: BorderRadius.circular(15),
//                         onTap: () {
//                           placeOrder();
//                           _showCartDialog(context);
//                         },
//                         child: Container(
//                           height: 65,
//                           width: 150,
//                           padding: const EdgeInsets.symmetric(vertical: 21),
//                           child: const Text(
//                             "Заказ",
//                             textAlign: TextAlign.center,
//                             style: TextStyle(
//                               fontSize: 20,
//                               color: Colors.white,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ]),
//             ),
//           ],
//         ));
//   }

//   void placeOrder() {
//     ScaffoldMessenger.of(context).showSnackBar(
//       const SnackBar(
//         content: Text('Order placed'),
//       ),
//     );
//   }

//   void _showCartDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text('Информация о корзине'),
//           content: const Column(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               Text('товар был заказан'),
//             ],
//           ),
//           actions: <Widget>[
//             GestureDetector(
//               child: const Text('Закрыть'),
//               onTap: () {
//                 Navigator.of(context)
//                     .pop(); // Закрыть диалоговое окно при нажатии на кнопку
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
