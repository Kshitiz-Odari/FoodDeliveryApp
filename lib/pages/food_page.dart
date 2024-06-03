import 'package:deliveryapp/components/my_button.dart';
import 'package:deliveryapp/models/food.dart';
import 'package:deliveryapp/models/restaurant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FoodPage extends StatefulWidget {
  final Food food;
  final Map<AddOn, bool> selectedAddOns = {};
  FoodPage({
    super.key,
    required this.food,
  }) {
    //initialize selected addon to false
    for (AddOn addOn in food.availableAddOns) {
      selectedAddOns[addOn] = false;
    }
  }

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  //method to add in cart to go back menu
  void addToCart(Food food, Map<AddOn, bool> selectedAddOns) {
    //close teh current food page
    Navigator.pop(context);
    //format the selected addon
    List<AddOn> currentlySelectedAddons = [];
    for (AddOn addOn in widget.food.availableAddOns) {
      if (selectedAddOns[addOn] == true) {
        currentlySelectedAddons.add(addOn);
      }
    }
    //add to cart
    context.read<Restaurant>().addToCart(food, currentlySelectedAddons);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //scaffold UI
        Scaffold(
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //food image
                Center(
                  child: Image.asset(
                    widget.food.imagePath,
                    height: 300,
                    width: 300,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //food name
                      Text(
                        widget.food.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                      //food price
                      Text(
                        "\Rs.${widget.food.price}",
                        style: TextStyle(
                            fontSize: 20,
                            color: Theme.of(context).colorScheme.primary),
                      ),

                      const SizedBox(
                        height: 10,
                      ),
                      //food description
                      Text(
                        widget.food.description,
                      ),

                      const SizedBox(
                        height: 10,
                      ),

                      Divider(
                        color: Theme.of(context).colorScheme.secondary,
                      ),

                      const SizedBox(
                        height: 10,
                      ),

                      Text(
                        "Add-On",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.inversePrimary,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),

                      const SizedBox(
                        height: 10,
                      ),

                      //addons
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Theme.of(context).colorScheme.tertiary),
                        ),
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.zero,
                          itemCount: widget.food.availableAddOns.length,
                          itemBuilder: (context, index) {
                            //get indiviual Addon
                            AddOn addOn = widget.food.availableAddOns[index];

                            //return checkbox box ui
                            return CheckboxListTile(
                              title: Text(addOn.name),
                              subtitle: Text(
                                "\Rs.${addOn.price}",
                                style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.primary),
                              ),
                              value: widget.selectedAddOns[addOn],
                              onChanged: (bool? value) {
                                setState(() {
                                  widget.selectedAddOns[addOn] = value!;
                                });
                              },
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
                //add to cart
                MyButton(
                  text: "Add to Cart",
                  onTap: () => addToCart(widget.food, widget.selectedAddOns),
                ),

                const SizedBox(
                  height: 25,
                ),
              ],
            ),
          ),
        ),

        //back button
        SafeArea(
          child: Opacity(
            opacity: 0.6,
            child: Container(
              margin: const EdgeInsets.only(left: 20),
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  shape: BoxShape.circle),
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios_rounded),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
