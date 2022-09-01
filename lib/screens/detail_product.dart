import 'dart:convert';

import 'package:estore/components/colors.dart';
import 'package:estore/models/detail_product.dart';
import 'package:estore/models/products.dart';
import 'package:estore/widgets/body_detail_product.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DetailProductScreen extends StatefulWidget {
  final int idProduct;
  const DetailProductScreen({Key? key, required this.idProduct})
      : super(key: key);

  @override
  State<DetailProductScreen> createState() => _DetailProductScreenState();
}

class _DetailProductScreenState extends State<DetailProductScreen> {
  List<DetailProduct> dataProduct = [];

  Future getProduct() async {
    try {
      var response = await http.get(
          Uri.parse("https://fakestoreapi.com/products/${widget.idProduct}"));
      var data = json.decode(response.body) as Map<String, dynamic>;
      data.forEach(
        (key, value) {
          dataProduct.add(DetailProduct.fromJson(data));
        },
      );
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
            "Details Products",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w700, fontSize: 17),
          ),
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: FutureBuilder(
          future: getProduct(),
          builder: (BuildContext context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: Text("Loading.."),
              );
            } else {
              return BodyDetailProduct(dataProduct: dataProduct);
            }
          },
        ),
      ),
    );
  }
}
