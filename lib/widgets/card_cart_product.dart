import 'dart:convert';

import 'package:estore/components/colors.dart';
import 'package:estore/models/products.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/cart_products_model.dart';
import '../screens/detail_product.dart';

class CardCartProduct extends StatefulWidget {
  List<CartProcutsModel> productGet = [];
  List<Products> dataProduct = [];
  CardCartProduct(
      {Key? key, required this.productGet, required this.dataProduct})
      : super(key: key);

  @override
  State<CardCartProduct> createState() => _CardCartProductState();
}

class _CardCartProductState extends State<CardCartProduct> {
 @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: widget.productGet.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      DetailProductScreen(idProduct: widget.dataProduct[index].id))),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 80,
                      height: 60,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image:
                                  NetworkImage(widget.dataProduct[index].image))),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      width: 140,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.dataProduct[index].title,
                            style: TextStyle(fontWeight: FontWeight.w600),
                            maxLines: 2,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            widget.dataProduct[index].description,
                            style: const TextStyle(
                                fontWeight: FontWeight.w400,
                                color: unselectedColor,
                                fontSize: 10),
                            maxLines: 2,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            "\$ ${widget.dataProduct[index].price}",
                            style: const TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 15),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: Icon(
                        Icons.remove,
                        size: 8,
                        color: primaryColor,
                      ),
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                              side: const BorderSide(color: primaryColor)),
                          padding: const EdgeInsets.all(5),
                          primary: Colors.white,
                          minimumSize: const Size(5, 5)),
                    ),
                    SizedBox(
                      width: 20,
                      child: Text(
                        widget.productGet[index].quantity.toString(),
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Icon(
                        Icons.add,
                        size: 8,
                      ),
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          padding: const EdgeInsets.all(5),
                          primary: primaryColor,
                          minimumSize: const Size(5, 5)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
