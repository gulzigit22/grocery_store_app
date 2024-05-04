class FoodDetail {
  String id;
  String image;
  String name;
  double price;
  double rate;
  String kcal;
  String cookingTime;
  String description;

  FoodDetail({
    required this.id,
    required this.image,
    required this.name,
    required this.price,
    required this.rate,
    required this.kcal,
    required this.cookingTime,
    required this.description,
  });
}

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
