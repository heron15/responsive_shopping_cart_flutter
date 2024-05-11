import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_shopping_cart/screens/widget/button_widget.dart';
import 'package:responsive_shopping_cart/screens/widget/dialog_box.dart';
import 'package:responsive_shopping_cart/screens/widget/shoping_item_widget.dart';

import '../model/cart_data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late int totalPrice;

  @override
  void initState() {
    totalPrice = calculatePrice();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: const Color.fromARGB(255, 249, 249, 249),
      child: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
          if (orientation == Orientation.portrait) {
            return SafeArea(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(CupertinoIcons.search))
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Padding(
                    padding: EdgeInsets.only(left: 16.0),
                    // Add left padding
                    child: Align(
                      alignment: Alignment.centerLeft, // Align text to left
                      child: Text(
                        'My Bag',
                        style: TextStyle(
                          fontSize: 34, // Adjust font size as needed
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: ListView.builder(
                        itemCount: cart_item.length,
                        itemBuilder: (context, index) {
                          return shoppingItemWidget(index, increaseQuantity,
                              decreaseQuantity, context);
                        }),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 16, right: 16, bottom: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Total amount: ',
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                        Text(
                          '${totalPrice.toString()}\$',
                          style: const TextStyle(
                              fontSize: 18, color: Colors.black),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 16, right: 16, bottom: 30),
                    child: buttonWidget('CHECK OUT', () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text(
                            "Congratulations! you successfully purchase your product.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          duration: const Duration(seconds: 3),
                          backgroundColor: Colors.green[600],
                          elevation: 10,
                        ),
                      );
                    }),
                  )
                ],
              ),
            );
          } else {
            return SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(CupertinoIcons.search))
                    ],
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                      child: Row(
                    children: [
                      Expanded(
                          flex: 2,
                          child: Column(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(left: 16.0),
                                // Add left padding
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  // Align text to left
                                  child: Text(
                                    'My Bag',
                                    style: TextStyle(
                                      fontSize: 34,
                                      // Adjust font size as needed
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Expanded(
                                child: ListView.builder(
                                    itemCount: cart_item.length,
                                    itemBuilder: (context, index) {
                                      return shoppingItemWidget(
                                          index,
                                          increaseQuantity,
                                          decreaseQuantity,
                                          context);
                                    }),
                              ),
                            ],
                          )),
                      Expanded(
                          child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 16, right: 16, bottom: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Total amount: ',
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.grey),
                                ),
                                Text(
                                  '${totalPrice.toString()}\$',
                                  style: const TextStyle(
                                      fontSize: 18, color: Colors.black),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 16, right: 16, bottom: 30),
                            child: buttonWidget('CHECK OUT', () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: const Text(
                                    "Congratulations! you successfully purchase your product.",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                  duration: const Duration(seconds: 3),
                                  backgroundColor: Colors.green[600],
                                  elevation: 10,
                                ),
                              );
                            }),
                          )
                        ],
                      ))
                    ],
                  ))
                ],
              ),
            );
          }
        },
      ),
    ));
  }

  int calculatePrice() {
    totalPrice = 0;
    for (CartData data in cart_item) {
      totalPrice += (data.dressPrice * data.dressQuantity);
    }
    return totalPrice;
  }

  void increaseQuantity(int index) {
    if (cart_item[index].dressQuantity < 5) {
      cart_item[index].dressQuantity += 1;
      totalPrice += cart_item[index].dressPrice;
    }
    if (cart_item[index].dressQuantity == 5) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertDialog(
              'Congratulations!',
              'You have added 5 ${cart_item[index].dressName} to your bag!',
              'OKAY', () {
            Navigator.pop(context);
          });
        },
      );
    }
    setState(() {});
  }

  void decreaseQuantity(int index) {
    if (cart_item[index].dressQuantity > 1) {
      cart_item[index].dressQuantity -= 1;
      totalPrice -= cart_item[index].dressPrice;
    }
    setState(() {});
  }
}
