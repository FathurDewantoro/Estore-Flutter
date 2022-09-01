import 'package:flutter/material.dart';

import '../models/category.dart';
import '../screens/show_all_products.dart';

class CategoryCard extends StatelessWidget {
  final Category category;
  const CategoryCard({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ShowAllProducts(
                    url: category.url,nameCategory: category.title,
                  ))),
      child: Container(
        padding: EdgeInsets.only(right: 10, left: 3),
        margin: EdgeInsets.only(left: 20),
        decoration: BoxDecoration(
          border: Border.all(width: 0.4, color: Colors.grey),
          borderRadius: BorderRadius.circular(7),
        ),
        child: Row(
          children: [
            Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  image: DecorationImage(
                      image: AssetImage(category.thumbnail),
                      fit: BoxFit.cover)),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              category.title,
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
    );
  }
}
