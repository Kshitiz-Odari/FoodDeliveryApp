import 'dart:async';
import 'dart:ffi';

import 'package:collection/collection.dart';
import 'package:deliveryapp/models/cart_item.dart';
import 'package:intl/intl.dart';

import 'food.dart';
import 'package:flutter/material.dart';

class Restaurant extends ChangeNotifier {
  //list of food menu
  final List<Food> _menu = [
    //vegs
    Food(
      name: "Aloo Gobi Delight",
      description:
          "Indulge in the exquisite flavors of our Aloo Gobi, a beloved classic from the heart of India. This vegetarian masterpiece combines tender potatoes and fresh cauliflower florets, perfectly simmered in a fragrant blend of spices.",
      imagePath: "lib/images/vegs/Aloogobi.png",
      price: 50,
      category: FoodCategory.vegs,
      availableAddOns: [
        AddOn(name: "Achaar", price: 5),
        AddOn(name: "Lemon", price: 5),
        AddOn(name: "Onion", price: 5),
      ],
    ),
    Food(
      name: "Aloo Chop Delight",
      description:
          "Discover the irresistible flavors of our Aloo Chop, a beloved street food delicacy from the Indian subcontinent, perfect for tantalizing your taste buds. This savory snack is a delightful blend of spiced mashed potatoes, coated in a crispy golden crust.",
      imagePath: "lib/images/vegs/cho.png",
      price: 30,
      category: FoodCategory.vegs,
      availableAddOns: [
        AddOn(name: "Achaar", price: 5),
        AddOn(name: "Lemon", price: 5),
        AddOn(name: "Onion", price: 5),
      ],
    ),
    Food(
      name: "Crispy Pakoda Platter",
      description:
          "Indulge in the irresistible charm of our Crispy Pakoda Platter, a delightful assortment of India's favorite deep-fried snacks. Perfectly spiced and irresistibly crunchy, our pakodas are a must-try for any food lover.",
      imagePath: "lib/images/vegs/pak.png",
      price: 60,
      category: FoodCategory.vegs,
      availableAddOns: [
        AddOn(name: "Achaar", price: 5),
        AddOn(name: "Lemon", price: 5),
        AddOn(name: "Onion", price: 5),
      ],
    ),
    Food(
      name: "Delightful Samosa",
      description:
          "Experience the quintessential taste of India with our Delightful Samosas, a beloved snack that combines a crispy pastry shell with a savory, spiced filling. Perfect for any occasion, our samosas are sure to tantalize your taste buds and leave you craving more.",
      imagePath: "lib/images/vegs/sam.png",
      price: 70,
      category: FoodCategory.vegs,
      availableAddOns: [
        AddOn(name: "Achaar", price: 5),
        AddOn(name: "Lemon", price: 5),
        AddOn(name: "Onion", price: 5),
      ],
    ),
    Food(
      name: "Veg. Thakali Set",
      description:
          "Embark on a culinary journey with our Veg Thakali Set, a traditional Nepali meal that offers a harmonious blend of flavors and textures. This wholesome, nutritious feast is served on a traditional metal plate (thali) and features an array of delicious vegetarian dishes, each crafted to perfection.",
      imagePath: "lib/images/vegs/vthak.png",
      price: 350,
      category: FoodCategory.vegs,
      availableAddOns: [
        AddOn(name: "Achaar", price: 5),
        AddOn(name: "Rice", price: 20),
        AddOn(name: "Vegetables", price: 10),
      ],
    ),

    //nonvegs
    Food(
      name: "Royal Chicken Biriyani",
      description:
          "Indulge in the regal flavors of our Royal Chicken Biryani, a sumptuous dish that promises to take your taste buds on a journey through the rich culinary heritage of India. This aromatic, one-pot wonder is layered with fragrant basmati rice, tender chicken, and an exquisite blend of spices.",
      imagePath: "lib/images/nonvegs/bir.png",
      price: 500,
      category: FoodCategory.nonvegs,
      availableAddOns: [
        AddOn(name: "Daahi", price: 20),
      ],
    ),
    Food(
      name: "Classic Chicken Momo",
      description:
          "Experience the delightful flavors of our Chicken Momos, a beloved Himalayan delicacy that combines tender chicken with aromatic spices, all encased in a delicate, steamed dumpling. These mouthwatering bites are perfect for any occasion, offering a satisfying and flavorful snack or meal.",
      imagePath: "lib/images/nonvegs/chi-momo.png",
      price: 350,
      category: FoodCategory.nonvegs,
      availableAddOns: [
        AddOn(name: "Special Achaar", price: 20),
      ],
    ),
    Food(
      name: "Savory Chicken Chowmein",
      description:
          "Dive into the rich, savory flavors of our Chicken Chowmein, a beloved Asian noodle dish that combines tender chicken, fresh vegetables, and perfectly seasoned noodles. This stir-fried delight is a feast for the senses, offering a harmonious blend of textures and tastes.",
      imagePath: "lib/images/nonvegs/chickmein.png",
      price: 370,
      category: FoodCategory.nonvegs,
      availableAddOns: [
        AddOn(name: "Special Achaar", price: 20),
      ],
    ),
    Food(
      name: "Flavorful Chicken Thakali",
      description:
          "Embark on a culinary journey with our Flavorful Chicken Thakali, a traditional Nepali dish that offers a symphony of rich flavors and vibrant spices. Inspired by the hearty cuisine of the Himalayan region, this dish combines tender chicken with aromatic herbs and spices, served with a selection of delectable accompaniments.",
      imagePath: "lib/images/nonvegs/cthak.png",
      price: 500,
      category: FoodCategory.nonvegs,
      availableAddOns: [
        AddOn(name: "Achaar", price: 5),
        AddOn(name: "Rice", price: 20),
        AddOn(name: "Vegetables", price: 10),
        AddOn(name: "Chicken", price: 40)
      ],
    ),

    //drinks
    Food(
      name: "Aromatic Black Tea",
      description:
          "Savor the simple yet profound pleasure of our Aromatic Black Tea, a timeless classic that transcends cultures and borders. Made from the finest black tea leaves, carefully selected and expertly brewed, our black tea offers a rich and invigorating experience that awakens the senses and soothes the soul.",
      imagePath: "lib/images/drinks/bltea.png",
      price: 20,
      category: FoodCategory.drinks,
      availableAddOns: [
        AddOn(name: "Fill", price: 15),
      ],
    ),
    Food(
      name: "Rich Coffee",
      description:
          "Indulge in the rich and robust flavors of our signature espresso, meticulously crafted to elevate your coffee experience to new heights. Our espresso is a symphony of bold aromas, velvety textures, and complex flavors, offering a truly indulgent treat for coffee aficionados.",
      imagePath: "lib/images/drinks/cof.png",
      price: 50,
      category: FoodCategory.drinks,
      availableAddOns: [
        AddOn(name: "Fill", price: 40),
      ],
    ),
    Food(
      name: "Classic Coca-cola",
      description:
          "Quench your thirst and invigorate your senses with the timeless refreshment of Coca-Cola. Our classic cola beverage has been delighting taste buds around the world for generations, offering a perfect balance of sweetness, acidity, and effervescence that's simply irresistible.",
      imagePath: "lib/images/drinks/coke.png",
      price: 40,
      category: FoodCategory.drinks,
      availableAddOns: [
        AddOn(name: "Fill", price: 40),
      ],
    ),
    Food(
      name: "Frooti: Taste the Mango",
      description:
          "Experience the delightful taste of Frooti, the iconic mango drink that has been capturing hearts and refreshing palates for decades. Made from the finest Alphonso mangoes, Frooti offers a burst of tropical flavor in every sip, transporting you to sun-kissed orchards and lazy summer days.",
      imagePath: "lib/images/drinks/Frot.png",
      price: 30,
      category: FoodCategory.drinks,
      availableAddOns: [
        AddOn(name: "Fill", price: 25),
      ],
    ),
    Food(
      name: "Creamy Milk Tea",
      description:
          "Indulge in the comforting embrace of our Creamy Milk Tea, a timeless beverage that combines the rich flavors of tea with the creamy goodness of milk. Crafted to perfection with the finest tea leaves and fresh dairy, our milk tea offers a soothing and satisfying experience that warms the soul and invigorates the senses.",
      imagePath: "lib/images/drinks/mltea.png",
      price: 40,
      category: FoodCategory.drinks,
      availableAddOns: [
        AddOn(name: "Fill", price: 35),
      ],
    ),

    //salads
    Food(
      name: "Fresh Broccoli Salad",
      description:
          "Elevate your salad game with our Fresh Broccoli Salad, a vibrant and nutritious dish that bursts with color, flavor, and texture. Made with crisp broccoli florets, crunchy vegetables, and a zesty dressing, this salad is a delightful combination of wholesome ingredients that will tantalize your taste buds and leave you feeling satisfied and energized.",
      imagePath: "lib/images/salads/broccolisalad.png",
      price: 100,
      category: FoodCategory.salads,
      availableAddOns: [AddOn(name: "Extra Helpings", price: 50)],
    ),
    Food(
      name: "Grilled Chicken Salad with Balsamic Vinaigrette",
      description:
          "Savor the flavors of summer with our Grilled Chicken Salad, a refreshing and satisfying dish that combines juicy grilled chicken, crisp greens, and a tangy balsamic vinaigrette. Bursting with fresh ingredients and vibrant colors, this salad is a delicious celebration of seasonal flavors and nutritious goodness.",
      imagePath: "lib/images/salads/chickensalad.png",
      price: 150,
      category: FoodCategory.salads,
      availableAddOns: [AddOn(name: "Extra Helpings", price: 80)],
    ),
    Food(
      name: "Classic Potato Salad",
      description:
          "Dive into the timeless flavors of our Classic Potato Salad, a beloved dish that combines tender potatoes, crisp vegetables, and a creamy dressing for a satisfying and delicious meal or side dish. Perfect for picnics, barbecues, or any gathering, this salad is sure to please with its comforting flavors and hearty textures.",
      imagePath: "lib/images/salads/potatosalad.png",
      price: 100,
      category: FoodCategory.salads,
      availableAddOns: [AddOn(name: "Extra Helpings", price: 50)],
    ),
    Food(
      name: "Proscuitto and Argula Salad",
      description:
          "Experience the exquisite flavors of our Prosciutto and Arugula Salad, a sophisticated dish that combines the delicate saltiness of prosciutto with the peppery bite of arugula and the sweetness of ripe figs. This salad is a celebration of contrasting flavors and textures, perfect for a light lunch, elegant appetizer, or stylish dinner party.",
      imagePath: "lib/images/salads/proscuittosalad.png",
      price: 120,
      category: FoodCategory.salads,
      availableAddOns: [AddOn(name: "Extra Helpings", price: 70)],
    ),
    Food(
      name: "White Bean Salad with Lemon and Herb Dressings",
      description:
          "Indulge in the fresh flavors and wholesome goodness of our White Bean Salad, a vibrant dish that combines creamy white beans with crisp vegetables and a zesty lemon herb dressing. Bursting with color, texture, and flavor, this salad is a delightful addition to any meal, whether served as a light lunch, a refreshing side dish, or a nutritious snack.",
      imagePath: "lib/images/salads/whitebeansalad.png",
      price: 120,
      category: FoodCategory.salads,
      availableAddOns: [AddOn(name: "Extra Helpings", price: 50)],
    ),

    //sides
    Food(
      name: "Buttered Roasted Potato",
      description:
          "Delight in the comforting simplicity of our Buttery Roasted Potatoes, a classic dish that celebrates the natural flavor and texture of golden potatoes enhanced with the richness of butter and the earthy aroma of fresh herbs. Perfectly crispy on the outside and tender on the inside, these roasted potatoes are a satisfying side dish that pairs well with a variety of main courses or serves as a delightful snack on its own.",
      imagePath: "lib/images/sides/butteredpotato.png",
      price: 70,
      category: FoodCategory.sides,
      availableAddOns: [AddOn(name: "Extra Helpings", price: 25)],
    ),
    Food(
      name: "Crispy Cheese Balls",
      description:
          "Indulge in the irresistible crunch and gooey cheesiness of our Crispy Cheese Balls, a crowd-pleasing appetizer that's perfect for parties, game nights, or anytime you're craving a savory snack. Made with a blend of melty cheese, flavorful seasonings, and a crispy breadcrumb coating, these cheese balls are sure to be a hit with cheese lovers of all ages.",
      imagePath: "lib/images/sides/cheeseball.png",
      price: 70,
      category: FoodCategory.sides,
      availableAddOns: [AddOn(name: "Extra Helpings", price: 25)],
    ),
    Food(
      name: "Homemade Garlic Bread",
      description:
          "Experience the comforting aroma and irresistible flavor of our Homemade Garlic Bread, a classic side dish that pairs perfectly with pasta, soups, salads, or enjoyed on its own as a delicious snack. Made with crusty bread, aromatic garlic, flavorful herbs, and creamy butter, our garlic bread is crispy on the outside, soft on the inside, and bursting with savory goodness.",
      imagePath: "lib/images/sides/garlicbread.png",
      price: 70,
      category: FoodCategory.sides,
      availableAddOns: [AddOn(name: "Extra Helpings", price: 25)],
    ),
    Food(
      name: "Creamy Garlic Mashed Potatoes",
      description:
          "Indulge in the velvety smoothness and rich flavor of our Creamy Garlic Mashed Potatoes, a comforting side dish that pairs perfectly with roast chicken, grilled steak, or any hearty main course. Made with fluffy potatoes, creamy butter, aromatic garlic, and a touch of cream, these mashed potatoes are a true classic that's sure to please everyone at the table.",
      imagePath: "lib/images/sides/mash.png",
      price: 70,
      category: FoodCategory.sides,
      availableAddOns: [AddOn(name: "Extra Helpings", price: 25)],
    ),
    Food(
      name: "Ratatouille",
      description:
          "Embark on a culinary journey to the sun-drenched fields of Provence with our Ratatouille, a vibrant and flavorful dish that celebrates the bounty of fresh vegetables and aromatic herbs. Made with a colorful medley of tomatoes, eggplant, zucchini, bell peppers, and onions, our Ratatouille is a feast for the senses that's as beautiful to look at as it is delicious to eat.",
      imagePath: "lib/images/sides/ratatouie.png",
      price: 70,
      category: FoodCategory.sides,
      availableAddOns: [AddOn(name: "Extra Helpings", price: 25)],
    ),

    //desserts
    Food(
      name: "Decadent Chocolate Brownies",
      description:
          "Indulge your sweet tooth with our Decadent Chocolate Brownies, a rich and fudgy treat that's guaranteed to satisfy your cravings for chocolatey goodness. Made with premium quality cocoa powder, rich dark chocolate, and creamy butter, our brownies are moist, dense, and packed with intense chocolate flavor. Whether enjoyed warm with a scoop of vanilla ice cream or savored on their own, our chocolate brownies are the ultimate indulgence for any dessert lover.",
      imagePath: "lib/images/desserts/brownie.png",
      price: 50,
      category: FoodCategory.desserts,
      availableAddOns: [AddOn(name: "Extra Slice", price: 50)],
    ),
    Food(
      name: "Classic New York-Style Cheesecake",
      description:
          "Delight in the rich and creamy goodness of our Classic New York-Style Cheesecake, a timeless dessert that's sure to impress with its smooth texture, velvety consistency, and decadent flavor. Made with a buttery graham cracker crust and a luscious cream cheese filling, our cheesecake is the perfect combination of sweet and tangy, making it a favorite among dessert lovers everywhere.",
      imagePath: "lib/images/desserts/cheesecake.png",
      price: 80,
      category: FoodCategory.desserts,
      availableAddOns: [AddOn(name: "Extra Slice", price: 80)],
    ),
    Food(
      name: "Decadent Chocolate Cake",
      description:
          "Satisfy your chocolate cravings with our Decadent Chocolate Cake, a rich and indulgent dessert that's guaranteed to delight your taste buds and satisfy your sweet tooth. Made with premium cocoa powder, rich dark chocolate, and moist buttermilk, our chocolate cake is moist, tender, and bursting with intense chocolate flavor. Whether enjoyed on its own, paired with a scoop of vanilla ice cream, or adorned with your favorite frosting, our chocolate cake is sure to be a hit at any celebration or gathering.",
      imagePath: "lib/images/desserts/chocolatecake.png",
      price: 60,
      category: FoodCategory.desserts,
      availableAddOns: [AddOn(name: "Extra Slice", price: 60)],
    ),
    Food(
      name: "Chocolate Lava Cake",
      description:
          "Experience the ultimate indulgence with our Chocolate Lava Cake, a luxurious dessert that's sure to impress with its molten chocolate center and velvety texture. Made with premium dark chocolate, rich butter, and a hint of espresso, our lava cake is a decadent treat that's perfect for special occasions, date nights, or any time you're craving a dose of chocolatey goodness.",
      imagePath: "lib/images/desserts/chocolatelava.png",
      price: 50,
      category: FoodCategory.desserts,
      availableAddOns: [AddOn(name: "Extra Slice", price: 50)],
    ),
    Food(
      name: "Oreo Dream Cake",
      description:
          "Indulge in the ultimate Oreo experience with our Oreo Dream Cake, a heavenly dessert that combines the classic flavors of Oreo cookies with creamy frosting and moist chocolate cake layers. Each bite of this decadent cake is a symphony of chocolatey goodness and creamy sweetness, making it a must-have for Oreo lovers everywhere.",
      imagePath: "lib/images/desserts/oreocake.png",
      price: 80,
      category: FoodCategory.desserts,
      availableAddOns: [AddOn(name: "Extra Slice", price: 80)],
    ),
  ];

  //cart
  final List<CartItem> _cart = [];

  //delivery address
  String _deliveryAddress = 'Hattiban';

  /*
  Getter
   */
  List<Food> get menu => _menu;
  List<CartItem> get cart => _cart;
  String get deliveryAddress => _deliveryAddress;
  /*
  Operations

   */

  //add cart
  void addToCart(Food food, List<AddOn> selectedAddOns) {
    //see if there is food
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      //check if food items are same
      bool isSameFood = item.food == food;
      //check if selected adddons are same
      bool isSameAddOns =
          ListEquality().equals(item.selectedAddOns, selectedAddOns);
      return isSameFood && isSameAddOns;
    });

    //if item already exists increase qty
    if (cartItem != null) {
      cartItem.quantity++;
    }
    //otherwise add new item
    else {
      _cart.add(CartItem(
        food: food,
        selectedAddOns: selectedAddOns,
      ));
    }
    notifyListeners();
  }

  //remove from cart
  void removeFromCart(CartItem cartItem) {
    int cartIndex = _cart.indexOf(cartItem);

    if (cartIndex != -1) {
      if (_cart[cartIndex].quantity > 1) {
        _cart[cartIndex].quantity--;
      } else {
        _cart.removeAt(cartIndex);
      }
      notifyListeners();
    }
  }

  //total price
  double getTotalPrice() {
    double total = 0.0;
    for (CartItem cartItem in _cart) {
      double itemTotal = cartItem.food.price;

      for (AddOn addOn in cartItem.selectedAddOns) {
        itemTotal += addOn.price;
      }
      total += itemTotal * cartItem.quantity;
    }
    return total;
  }

  //no of items in cart
  int getTotalItemCount() {
    int totalItemCount = 0;

    for (CartItem cartItem in _cart) {
      totalItemCount += cartItem.quantity;
    }
    return totalItemCount;
  }

  //clear cart
  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  //update delivery
  void updateDeliveryAddress(String newAddress) {
    _deliveryAddress = newAddress;
    notifyListeners();
  }

  /*
  Helper
   */

  //generate receipt
  String displayCartReceipt() {
    final receipt = StringBuffer();
    receipt.writeln("Here's your receipt.");
    receipt.writeln();

    //format the date to include up to seconds only
    String formattedDate =
        DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());

    receipt.writeln(formattedDate);
    receipt.writeln();
    receipt.writeln("------------");

    for (final cartItem in _cart) {
      receipt.writeln(
          "${cartItem.quantity} x ${cartItem.food.name} - ${_formatPrice(cartItem.food.price)}");
      if (cartItem.selectedAddOns.isNotEmpty) {
        receipt
            .writeln("    Add-on: ${_formatAddons(cartItem.selectedAddOns)}");
      }
      receipt.writeln();
    }
    receipt.writeln("------------");
    receipt.writeln();
    receipt.writeln("Total items: ${getTotalItemCount()}");
    receipt.writeln("Total Price: ${_formatPrice(getTotalPrice())}");
    receipt.writeln();
    receipt.writeln("Delivering to: $deliveryAddress");

    return receipt.toString();
  }

  //format double value into money
  String _formatPrice(double price) {
    return "\Rs.${price.toStringAsFixed(1)}";
  }

  //format list of addons into string summary
  String _formatAddons(List<AddOn> addOns) {
    return addOns
        .map((addon) => "${addon.name}(${_formatPrice(addon.price)})")
        .join(", ");
  }
}
