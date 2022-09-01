import 'dart:convert';

import 'package:estore/components/colors.dart';
import 'package:estore/models/cart_model.dart';
import 'package:estore/models/cart_products_model.dart';
import 'package:estore/models/products.dart';
import 'package:estore/widgets/card_cart_product.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyCart extends StatefulWidget {
  List<CartProcutsModel> productGet = [];
  MyCart({Key? key, required this.productGet}) : super(key: key);

  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  TextEditingController _codeC = TextEditingController();
  Icon suffixCuponIcon =
      const Icon(Icons.create_rounded, color: unselectedColor);
  Color borderEnableColor = unselectedColor;
  int count = 1;
  bool favourite = false;
  double discount = 0;
  double totalPriceCart = 0;

  List<Products> dataProduct = [];

  Future getProduct() async {
    try {
      for (var element in widget.productGet) {
        var responseProduct = await http.get(Uri.parse(
            "https://fakestoreapi.com/products/${element.productId}"));
        var dataHasilResponse =
            json.decode(responseProduct.body) as Map<String, dynamic>;
        dataProduct.add(Products.fromJson(dataHasilResponse));
      }
      for (var i = 0; i < widget.productGet.length; i++) {
        totalPriceCart += dataProduct[i].price * widget.productGet[i].quantity;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Montserrat'),
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          title: const Text(
            "My Cart",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w700, fontSize: 17),
          ),
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: FutureBuilder(
            future: getProduct(),
            builder: (BuildContext context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: Text('Loading..'),
                );
              } else {
                return ListView(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Deliver to Fathur",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                            ),
                          ),
                          Row(
                            children: const [
                              Text(
                                "Puhpelem, Wonogiri",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  color: primaryColor,
                                ),
                              ),
                              Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color: primaryColor,
                                size: 18,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      child: CardCartProduct(
                          productGet: widget.productGet,
                          dataProduct: dataProduct),
                    ),
                    const Text(
                      "Have a cupon code? enter here",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: unselectedColor,
                          fontSize: 12),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextField(
                      controller: _codeC,
                      textCapitalization: TextCapitalization.characters,
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w600),
                      autocorrect: false,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: borderEnableColor)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: primaryColor)),
                        hintText: "Enter here",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        suffixIcon: suffixCuponIcon,
                      ),
                      onSubmitted: (value) {
                        if (value != "") {
                          suffixCuponIcon =
                              const Icon(Icons.check, color: primaryColor);
                          borderEnableColor = primaryColor;
                          _codeC.text = value;
                          discount = 15.9;
                        } else {
                          null;
                        }
                        setState(() {
                          totalPriceCart = 0;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Subtotal  :",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: unselectedColor),
                        ),
                        Text(
                          "\$ ${totalPriceCart}",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 16),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Delivery Fee  :",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: unselectedColor),
                        ),
                        Text(
                          "\$ 9.9",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 16),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Discount  :",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: unselectedColor),
                        ),
                        Text(
                          _codeC.text == "" ? "-" : "\$ ${discount}",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 16),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total  :",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: unselectedColor),
                        ),
                        Text(
                          "\$ ${(totalPriceCart + 9.9 - discount).toStringAsFixed(2)}",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                              color: primaryColor),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        "Checkout",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 16),
                      ),
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          primary: primaryColor,
                          padding: EdgeInsets.all(15)),
                    ),
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
