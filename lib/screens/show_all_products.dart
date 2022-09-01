import 'dart:convert';
import 'dart:ui';

import 'package:estore/components/colors.dart';
import 'package:estore/models/products.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'detail_product.dart';

class ShowAllProducts extends StatefulWidget {
  String url;
  String nameCategory;
  ShowAllProducts({Key? key, required this.url, required this.nameCategory})
      : super(key: key);

  @override
  State<ShowAllProducts> createState() => _ShowAllProductsState();
}

class _ShowAllProductsState extends State<ShowAllProducts> {
  List<Products> dataProduct = [];

  Future getProducts() async {
    try {
      var response = await http
          .get(Uri.parse("https://fakestoreapi.com/products/${widget.url}"));
      List data = json.decode(response.body);
      data.forEach((element) {
        dataProduct.add(Products.fromJson(element));
      });
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
          backgroundColor: Colors.white,
          centerTitle: false,
          title: Text(
            "'${widget.nameCategory}' category ",
            style: const TextStyle(
                color: Colors.black, fontSize: 14, fontWeight: FontWeight.w600),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: [
              FutureBuilder(
                builder: (BuildContext context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return GridView.builder(
                      itemCount: 10,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Container(
                          width: double.infinity,
                          height: 250,
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(10)),
                        );
                      },
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 2 / 3.30,
                        crossAxisCount: 2,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                      ),
                    );
                  } else {
                    return GridView.builder(
                      itemCount: dataProduct.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailProductScreen(
                                      idProduct: dataProduct[index].id))),
                          child: Container(
                            margin: EdgeInsets.symmetric(vertical: 5),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            width: double.infinity,
                            height: 250,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey
                                        .withOpacity(0.3), //color of shadow
                                    spreadRadius: 1, //spread radius
                                    blurRadius: 5, // blur radius
                                    offset: Offset(
                                        0, 1), // changes position of shadow
                                    //first paramerter of offset is left-right
                                    //second parameter is top to down
                                  )
                                ]),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.all(10),
                                  width: 130,
                                  height: 90,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          dataProduct[index].image),
                                    ),
                                  ),
                                ),
                                Text(
                                  dataProduct[index].title,
                                  style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600),
                                  maxLines: 2,
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  dataProduct[index].description,
                                  style: const TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w300,
                                      color: unselectedColor),
                                  maxLines: 4,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "\$ ${dataProduct[index].price.toString()}",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          size: 18,
                                          Icons.star,
                                          color: Colors.amber,
                                        ),
                                        Text(
                                          "${dataProduct[index].rating.rate}",
                                          style: const TextStyle(
                                            fontSize: 11,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  padding: const EdgeInsets.all(2),
                                  width: 70,
                                  decoration: BoxDecoration(
                                    color: primaryColor,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: const Text(
                                    "Free Shipping",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 8,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 2 / 3.30,
                        crossAxisCount: 2,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 2,
                      ),
                    );
                  }
                },
                future: getProducts(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
