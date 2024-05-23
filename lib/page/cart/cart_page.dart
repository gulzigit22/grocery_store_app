import 'package:flutter/material.dart';
import 'package:grocery_store_app/model/items_model.dart';

class Cart {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  void addItem(FoodDetail food, int quantity) {
    var existingItem = _items.firstWhere(
      (item) => item.food.id == food.id,
      orElse: () => CartItem(food: food, quantity: 0),
    );

    if (existingItem.quantity == 0) {
      _items.add(CartItem(food: food, quantity: quantity));
    } else {
      existingItem.quantity += quantity;
    }
  }

  void removeItem(FoodDetail food) {
    _items.removeWhere((item) => item.food.id == food.id);
  }

  double get totalPrice =>
      _items.fold(0, (total, item) => total + item.food.price * item.quantity);
}

class CartItem {
  final FoodDetail food;
  int quantity;

  CartItem({required this.food, required this.quantity});
}

class CartPage extends StatefulWidget {
  final Cart cart;

  const CartPage({
    super.key,
    required this.cart,
  });

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
      ),
      body: ListView.builder(
        itemCount: widget.cart.items.length,
        itemBuilder: (context, index) {
          final item = widget.cart.items[index];
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            height: 120,
            decoration: BoxDecoration(
              color: const Color(0xff1F8BA7),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Row(children: [
                // Card(
                //   child: Image.asset(
                //     product.image,
                //     width: 106,
                //     height: 97,
                //     fit: BoxFit.cover,
                //   ),
                // ),
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
                      '\$${item.food.price * item.quantity}',
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    setState(() {});

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text('${item.food.name} added to cart')),
                    );
                  },
                ),
                Text('\$${item.food.price * item.quantity}'),
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: () {
                    setState(() {});
                    // widget.cart.removeItem(product);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('${item.food.name} added to cart'),
                      ),
                    );
                  },
                ),
              ]),
            ),
          );
          //  ListTile(
          //   title: Text(item.food.name),
          //   subtitle: Text('Quantity: ${item.quantity}'),
          //   trailing: Text('\$${item.food.price * item.quantity}'),
          // );
        },
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Total:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              '\$${widget.cart.totalPrice.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

class _MyApp1State extends State {
  final Cart cart = Cart();

  final List<FoodDetail> foodsItems = [
    FoodDetail(
      id: '1',
      image: 'assets/jemishter.jpg',
      name: 'Avocado Salad',
      price: 12,
      rate: 4.5,
      kcal: '100',
      cookingTime: '20min',
      description:
          "This avocado salad is a delicious combination of ripe avocados, sweet onions, fresh tomatoes, and cilantro. This recipe is so easy to make and very colorful — I think you'll like it! This avocado salad recipe is full of bold, fresh flavor and color.",
    ),
    FoodDetail(
      id: '2',
      image: 'assets/jemishter.jpg',
      name: 'Royal Burger',
      price: 20,
      rate: 5.0,
      kcal: '100',
      cookingTime: '30min',
      description:
          "A Royal burger is a patty of ground beef grilled and placed between two halves of a bun. Slices of raw onion, lettuce, bacon, mayonnaise, and other ingredients add flavor. Burgers are considered an American food but are popular around the world.",
    ),
    FoodDetail(
      id: '3',
      image: 'assets/jemishter.jpg',
      name: 'Fruit Salad',
      price: 12,
      rate: 4.6,
      kcal: '20',
      cookingTime: '15min',
      description:
          "Fruit salad is a dish consisting of various kinds of fruit, sometimes served in a liquid, either their juices or a syrup. In different forms, fruit salad can be served as an appetizer or a side as a salad. A fruit salad is sometimes known as a fruit cocktail, or fruit cup.",
    ),
    FoodDetail(
      id: '4',
      image: 'assets/jemishter.jpg',
      name: 'Mix Nut',
      price: 30,
      rate: 5.0,
      kcal: '160',
      cookingTime: '08min',
      description:
          "Mixed nuts are a snack food consisting of any mixture of mechanically or manually combined nuts. Common constituents are peanuts, almonds, walnuts, Brazil nuts, cashews, hazelnuts, and pecans. Mixed nuts may be salted, roasted, cooked, or blanched.",
    ),
    FoodDetail(
      id: '5',
      image: 'assets/jemishter.jpg',
      name: 'Protein Shake',
      price: 50,
      rate: 4.8,
      kcal: '100',
      cookingTime: '05min',
      description:
          "This strawberry protein shake is creamy, easy to whip up and tastes like a milkshake, but is made with healthy ingredients.",
    ),
    FoodDetail(
      id: '6',
      image: 'assets/jemishter.jpg',
      name: 'Dairy Milk',
      price: 5,
      rate: 5.0,
      kcal: '10',
      cookingTime: 'Ready',
      description:
          "Shop Cadbury Dairy Milk Silk Chocolate Bar, 150g Pack of 3 online at a best price in Nepal. Get special offers, deals, discounts & fast delivery ...",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grocery Cart'),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_rounded),
        ),
      ),
      body: ListView.builder(
        itemCount: foodsItems.length,
        itemBuilder: (context, index) {
          final product = foodsItems[index];
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            height: 120,
            decoration: BoxDecoration(
              color: const Color(0xff1F8BA7),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Row(children: [
                Card(
                  child: Image.asset(
                    product.image,
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
                      product.name,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      '\$${product.price.toString()}',
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    setState(() {});

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('${product.name} added to cart')),
                    );
                  },
                ),
                Text(cart.totalPrice.toStringAsFixed(2)),
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: () {
                    setState(() {});
                    cart.removeItem(product);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('${product.name} added to cart'),
                      ),
                    );
                  },
                ),
              ]),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Cart Total'),
                content: Text('Total: \$${cart.totalPrice.toStringAsFixed(2)}'),
                actions: [
                  TextButton(
                    onPressed: () {
                      cart.items.clear();
                      Navigator.of(context).pop();
                    },
                    child: const Text('Close'),
                  ),
                  TextButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Cart Total'),
                            content: Column(
                              children: [
                                Text(
                                    'Total: \$${cart.totalPrice.toStringAsFixed(2)}'),
                                const SizedBox(height: 30),
                                TextField(
                                  decoration: InputDecoration(
                                      hintText: '+996',
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30))),
                                )
                              ],
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  cart.items.clear();
                                  Navigator.of(context).pop();
                                },
                                child: const Text('Close'),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('заказать'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: const Text('заказать'),
                  ),
                ],
              );
            },
          );
        },
        label: const Text('Cart Total'),
        icon: const Icon(Icons.shopping_cart),
      ),
    );
  }
}
