import 'dart:convert';

import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:estore/components/colors.dart';
import 'package:estore/models/category.dart';
import 'package:estore/screens/cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:badges/badges.dart';

import '../models/cart_model.dart';
import '../models/cart_products_model.dart';
import '../widgets/category_card.dart';
import '../widgets/hotsale_card.dart';
import '../widgets/recently_viewed_card.dart';

class PageHome extends StatefulWidget {
  PageHome({Key? key}) : super(key: key);
  @override
  State<PageHome> createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            HomeAppBar(),
            Expanded(child: Body()),
          ],
        ),
      ),
    );
  }
}

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(top: 25),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      children: [
        const HomeCategories(),
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Hot Sale",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  "See all",
                  style: TextStyle(
                      color: unselectedColor, fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ),
        const HotSaleCard(),
        const Padding(
          padding: EdgeInsets.only(left: 20, top: 20, right: 20),
          child: Text(
            "Recently Viewed",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
        ),
        const RecentlyViewedCard(),
      ],
    );
  }
}

class HomeCategories extends StatelessWidget {
  const HomeCategories({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 50,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return CategoryCard(category: categoryList[index]);
          },
          itemCount: categoryList.length,
        ));
  }
}

class HomeAppBar extends StatelessWidget {
  HomeAppBar({Key? key}) : super(key: key);

  List<CartModel> dataCart = [];
  List<CartProcutsModel> dataCartProducts = [];

  Future getCart() async {
    try {
      // Get cart
      var response =
          await http.get(Uri.parse("https://fakestoreapi.com/carts/user/4"));
      List data = json.decode(response.body);
      data.forEach((element) {
        dataCart.add(CartModel.fromJson(element));
      });

      // get product id from cart
      dataCart.asMap().forEach((key, value) {
        value.products.asMap().forEach((key, value) {
          dataCartProducts.add(CartProcutsModel(
              productId: value.productId, quantity: value.quantity));
        });
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          children: [
            Container(
              width: 320,
              height: 40,
              margin: EdgeInsets.only(top: 30),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: TextField(
                  autocorrect: false,
                  decoration: InputDecoration(
                      prefix: const SizedBox(
                        width: 20,
                      ),
                      suffixIcon: IconButton(
                        icon: const Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          /* Clear the search field */
                        },
                      ),
                      hintText: 'Search...',
                      border: InputBorder.none),
                ),
              ),
            ),
            FutureBuilder(
              future: getCart(),
              builder: (BuildContext context, snapshot) {
                return Container(
                  width: 30,
                  height: 45,
                  margin: EdgeInsets.only(top: 30, left: 5),
                  child: Badge(
                    animationType: BadgeAnimationType.fade,
                    padding: EdgeInsets.all(7),
                    badgeContent: Text(
                      dataCartProducts.length.toString(),
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                    child: IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    MyCart(productGet: dataCartProducts),
                              ));
                        },
                        icon: const Icon(
                          Icons.shopping_cart_outlined,
                          color: Colors.white,
                        )),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
