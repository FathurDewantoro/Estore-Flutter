import 'dart:convert';

import 'package:estore/components/colors.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/products.dart';
import '../screens/detail_product.dart';

class HotSaleCard extends StatefulWidget {
  const HotSaleCard({Key? key}) : super(key: key);

  @override
  State<HotSaleCard> createState() => _HotSaleCardState();
}

class _HotSaleCardState extends State<HotSaleCard> {
  List<Products> hotSale = [];

  Future getHotSale() async {
    try {
      var response = await http.get(Uri.parse(
          "https://fakestoreapi.com/products/category/men's clothing"));
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
        future: getHotSale(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return SizedBox(
              height: 250,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.all(15),
                    margin: EdgeInsets.all(10),
                    width: 170,
                    decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(10)),
                  );
                },
              ),
            );
          } else {
            return Container(
              height: 270,
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
                      width: 170,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey
                                  .withOpacity(0.3), //color of shadow
                              spreadRadius: 1, //spread radius
                              blurRadius: 5, // blur radius
                              offset:
                                  Offset(0, 1), // changes position of shadow
                              //first paramerter of offset is left-right
                              //second parameter is top to down
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
                                height: 5,
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
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                "${hotSale[index].title}",
                                style: const TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                "\$ ${hotSale[index].price}",
                                style: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 15,
                                ),
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    size: 22,
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  Text(
                                    "${hotSale[index].rating.rate}",
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 45,
                                  ),
                                  Text(
                                    "Sold ${hotSale[index].rating.count}",
                                    style: const TextStyle(
                                        fontSize: 12, color: Colors.grey),
                                  ),
                                ],
                              ),
                            ],
                          )
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
