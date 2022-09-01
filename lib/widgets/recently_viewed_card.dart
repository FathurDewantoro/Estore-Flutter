import 'dart:convert';

import 'package:estore/components/colors.dart';
import 'package:estore/screens/detail_product.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/products.dart';

class RecentlyViewedCard extends StatefulWidget {
  const RecentlyViewedCard({Key? key}) : super(key: key);

  @override
  State<RecentlyViewedCard> createState() => _RecentlyViewedCardState();
}

class _RecentlyViewedCardState extends State<RecentlyViewedCard> {
  List<Products> hotSale = [];

  Future recentlyViewed() async {
    try {
      var response = await http.get(
          Uri.parse("http://fakestoreapi.com/products/category/electronics"));
      List data = json.decode(response.body);
      data.forEach((element) {
        hotSale.add(Products.fromJson(element));
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: recentlyViewed(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return SizedBox(
              height: 265,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.all(15),
                    margin: EdgeInsets.all(10),
                    width: 200,
                    decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(10)),
                  );
                },
              ),
            );
          } else {
            return Container(
              height: 290,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: hotSale.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailProductScreen(
                                idProduct: hotSale[index].id))),
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      margin: EdgeInsets.all(10),
                      width: 200,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 1,
                              blurRadius: 5,
                              offset: Offset(0, 1),
                            )
                          ]),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 130,
                            height: 100,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage("${hotSale[index].image}"),
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                height: 40,
                                child: Text(
                                  "${hotSale[index].title}",
                                  style: const TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              SizedBox(
                                height: 40,
                                child: Text(
                                  "${hotSale[index].description}",
                                  style: const TextStyle(
                                    fontSize: 11,
                                    color: unselectedColor,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "\$ ${hotSale[index].price}",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16),
                                  ),
                                  Text(
                                    "Sold ${hotSale[index].rating.count}",
                                    style: const TextStyle(
                                        fontSize: 12, color: Colors.grey),
                                  ),
                                ],
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 10),
                                padding: const EdgeInsets.all(2),
                                width: 70,
                                decoration: BoxDecoration(
                                  color: primaryColor,
                                  borderRadius: BorderRadius.circular(3),
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
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
