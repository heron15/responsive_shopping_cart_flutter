import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_shopping_cart/model/cart_data.dart';

Widget shoppingItemWidget(int index, Function increaseQuantity,
    Function decreaseQuantity, BuildContext context) {
  return Container(
    margin: const EdgeInsets.only(left: 16, right: 16, bottom: 20),
    width: double.infinity,
    height: 104,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 0,
              blurRadius: 15,
              blurStyle: BlurStyle.normal),
        ]),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 104,
          width: 104,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(cart_item[index].dressImage),
                  fit: BoxFit.cover)),
        ),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.only(left: 10, top: 8, bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                height: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      cart_item[index].dressName,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.more_vert,
                        size: 20,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              RichText(
                  text: TextSpan(
                      style: DefaultTextStyle.of(context).style,
                      children: <TextSpan>[
                    const TextSpan(
                        text: 'Color: ',
                        style: TextStyle(fontSize: 11, color: Colors.grey)),
                    TextSpan(
                        text: cart_item[index].dressColor,
                        style: const TextStyle(
                            fontSize: 11,
                            color: Colors.black,
                            fontWeight: FontWeight.w400)),
                    const TextSpan(text: ('    ')),
                    const TextSpan(
                        text: 'Size: ',
                        style: TextStyle(fontSize: 11, color: Colors.grey)),
                    TextSpan(
                        text: cart_item[index].dressSize,
                        style: const TextStyle(
                            fontSize: 11,
                            color: Colors.black,
                            fontWeight: FontWeight.w400)),
                  ])),
              const SizedBox(height: 10,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      decreaseQuantity(index);
                    },
                    child: const SizedBox(
                      height: 36,
                      width: 36,
                      child: Card(
                        color: Colors.white,
                        elevation: 3,
                        shape: CircleBorder(),
                        child: Center(
                          child: Icon(
                            Icons.remove,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10,),
                  Text(
                    cart_item[index].dressQuantity.toString(),
                    style: const TextStyle(
                      fontSize: 14,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                  const SizedBox(width: 10,),
                  GestureDetector(
                    onTap: () {
                      increaseQuantity(index);
                    },
                    child: const SizedBox(
                      height: 36,
                      width: 36,
                      child: Card(
                        color: Colors.white,
                        elevation: 3,
                        shape: CircleBorder(),
                        child: Center(
                          child: Icon(
                            Icons.add,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Expanded(child: SizedBox()),
                  Text(
                    '${cart_item[index].dressPrice.toString()}\$',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                  const SizedBox(width: 10,)
                ],
              )
            ],
          ),
        )),
      ],
    ),
  );
}
