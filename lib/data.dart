// Class definitions (as provided)
class ProductItems {
  final String name;
  final String image;
  final String desc;
  final double price;
  final String size;
  final int cookTime;
  final Review review;


  ProductItems({
    required this.name,
    required this.desc,
    required this.price,
    required this.size,
    required this.cookTime,
    required this.review,
    required this.image,
  });
}

class Review {
  final double scoreOfReview;
  final double numOfReview;

  Review(this.scoreOfReview, this.numOfReview);
}

// List of 10 burger products
List<ProductItems> burgerItems = [
  ProductItems(
    name: 'Classic Cheeseburger',
    desc: 'Beef patty, cheddar cheese, lettuce, tomato, pickles, secret sauce',
    price: 9.99,
    size: 'Regular',
    cookTime: 12 ,
    review: Review(4.7, 235.0),
    image:
        'https://img.freepik.com/free-photo/delicious-sandwiches-fries-ketchup-wooden-cutting-board-dark-mix-color-surface_179666-42231.jpg',
  ),
  ProductItems(
    name: 'Veggie Burger',
    desc: 'Black bean patty, avocado, spinach, roasted peppers, garlic aioli',
    price: 10.99,
    size: 'Regular',
    cookTime: 10 ,
    review: Review(4.5, 112.0),
    image:
        'https://img.freepik.com/free-photo/delicious-vegan-burger-presentation_23-2151910884.jpg',
  ),
  ProductItems(
    name: 'Spicy Jalapeño Burger',
    desc:
        'Beef patty, pepper jack cheese, jalapeños, sriracha mayo, crispy onions',
    price: 11.29,
    size: 'Regular',
    cookTime: 14,
    review: Review(4.6, 98.0),
    image:
        'https://img.freepik.com/free-photo/delicious-vegan-burger-presentation_23-2151910876.jpg',
  ),
  ProductItems(
    name: 'Bacon Deluxe',
    desc:
        'Double beef, crispy bacon, smoked gouda, caramelized onions, BBQ sauce',
    price: 12.49,
    size: 'Large',
    cookTime: 15,
    review: Review(4.9, 189.0),
    image:
        'https://img.freepik.com/free-photo/delicious-sandwiches-fries-ketchup-wooden-cutting-board-dark-mix-color-surface_179666-42231.jpg',
  ),
  ProductItems(
    name: 'Double Stack Burger',
    desc: 'Two beef patties, American cheese, lettuce, pickles, special sauce',
    price: 13.49,
    size: 'Large',
    cookTime: 16 ,
    review: Review(4.4, 203.0),
    image:
        'https://img.freepik.com/free-photo/delicious-vegan-burger-presentation_23-2151910884.jpg',
  ),
  ProductItems(
    name: 'Mushroom Swiss Burger',
    desc: 'Beef patty, sautéed mushrooms, Swiss cheese, truffle aioli',
    price: 11.99,
    size: 'Regular',
    cookTime: 14 ,
    review: Review(4.8, 156.0),
    image:
        'https://img.freepik.com/free-photo/delicious-vegan-burger-presentation_23-2151910876.jpg',
  ),
  ProductItems(
    name: 'Hawaiian Burger',
    desc: 'Beef patty, grilled pineapple, ham, Swiss cheese, teriyaki glaze',
    price: 12.99,
    size: 'Regular',
    cookTime: 14 ,
    review: Review(4.3, 77.0),
    image:
        'https://img.freepik.com/free-photo/delicious-vegan-burger-presentation_23-2151910884.jpg',
  ),
  ProductItems(
    name: 'BBQ Ranch Burger',
    desc: 'Beef patty, cheddar, onion rings, ranch dressing, BBQ sauce',
    price: 11.49,
    size: 'Regular',
    cookTime: 15,
    review: Review(4.6, 132.0),
    image:
        'https://img.freepik.com/free-photo/delicious-sandwiches-fries-ketchup-wooden-cutting-board-dark-mix-color-surface_179666-42231.jpg',
  ),
  ProductItems(
    name: 'Sliders (3 pcs)',
    desc: 'Mini beef patties, pickles, onions, slider buns',
    price: 8.99,
    size: 'Small',
    cookTime: 8,
    review: Review(4.5, 145.0),
    image:
        'https://img.freepik.com/free-photo/delicious-vegan-burger-presentation_23-2151910876.jpg',
  ),
  ProductItems(
    name: 'Blue Cheese Burger',
    desc: 'Beef patty, crumbled blue cheese, caramelized onions, arugula',
    price:11.79,
    size: 'Regular',
    cookTime: 13 ,
    review: Review(4.2, 64.0),
    image:
        'https://img.freepik.com/free-photo/delicious-vegan-burger-presentation_23-2151910884.jpg',
  ),
];
class CartItem {
  final ProductItems product;
  int quantity; // mutable, default = 1

  CartItem({required this.product, this.quantity = 1});
}
List<CartItem> cartItems=[];
