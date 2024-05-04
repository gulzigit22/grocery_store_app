import 'package:flutter/material.dart';
import 'package:grocery_store_app/model/items_model.dart';

// class Product {
//   final String name;
//   final double price;

//   Product({required this.name, required this.price});
// }

class Cart {
  final List<FoodDetail> items = [];

  double get totalPrice {
    double total = 0;
    for (var item in items) {
      total += item.price;
    }
    return total;
  }

  void addItem(FoodDetail product) {
    items.add(product);
  }

  void removeItem(FoodDetail product) {
    items.remove(product);
  }
}

// ignore: must_be_immutable
class MyApp1 extends StatelessWidget {
  final Cart cart = Cart();

  List<FoodDetail> foodsItems = [
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
            "A Royal burger is a patty of ground beef grilled and placed between two halves of a bun. Slices of raw onion, lettuce, bacon, mayonnaise, and other ingredients add flavor. Burgers are considered an American food but are popular around the world."),
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
          "This strawberry protein shake is creamy, easy to whip up and tastes like a milkshake, but is made",
    ),
    FoodDetail(
      id: '5',
      image: 'assets/jemishter.jpg',
      name: 'Dairy Milk',
      price: 05,
      rate: 5.0,
      kcal: '10',
      cookingTime: 'Ready',
      description:
          "Shop Cadbury Dairy Milk Silk Chocolate Bar, 150g Pack of 3 online at a best price in Nepal. Get special offers, deals, discounts & fast delivery ...",
    ),
  ];

  MyApp1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Grocery Cart'),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.rice_bowl_sharp)),
        ),
        body: ListView.builder(
          itemCount: foodsItems.length,
          itemBuilder: (context, index) {
            final product = foodsItems[index];
            return Card(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
              color: const Color(0xffEB96EB),
              child: ListTile(
                leading: IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    cart.addItem(product);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('${product.name} remove to cart')),
                    );
                  },
                ),
                title: Text(
                  product.name,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w600),
                ),
                subtitle: Text(
                  product.price.toString(),
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w600),
                ),
                trailing: CircleAvatar(
                  radius: 30,
                  child: Image.network(product.image),
                ),
                onTap: () {},
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
                  content:
                      Text('Total: \$${cart.totalPrice.toStringAsFixed(2)}'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Close'),
                    ),
                  ],
                );
              },
            );
          },
          label: const Text('Cart Total'),
          icon: const Icon(Icons.shopping_cart),
        ),
      ),
    );
  }
}
