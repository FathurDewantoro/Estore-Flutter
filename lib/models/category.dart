import 'package:flutter/material.dart';

class Category {
  String thumbnail;
  String title;
  String url;

  Category({required this.thumbnail, required this.title, required this.url});
}

List<Category> categoryList = [
  Category(
    thumbnail: 'assets/images/electronics.png',
    title: "Electronics",
    url: "category/electronics",
  ),
  Category(
    thumbnail: 'assets/images/men-cloths.png',
    title: "Men's",
    url: "category/men's clothing",
  ),
  Category(
    thumbnail: 'assets/images/women-clothing.png',
    title: "Women's",
    url: "category/women's clothing",
  ),
  Category(
    thumbnail: 'assets/images/jewelery.png',
    title: "Jewelery",
    url: "category/jewelery",
  ),
];
