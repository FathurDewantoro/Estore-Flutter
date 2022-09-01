import 'package:estore/components/colors.dart';
import 'package:flutter/material.dart';

class MenuProfile extends StatelessWidget {
  const MenuProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10),
            child: Text(
              "Profile",
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
            ),
          ),
          Row(
            children: const [
              Icon(
                Icons.person_outline,
                size: 32,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "Personal Data",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                    color: Colors.black),
              )
            ],
          ),
          const Divider(
            color: Colors.white,
            indent: 4,
            height: 40,
          ),
          Row(
            children: const [
              Icon(
                Icons.shopping_cart_outlined,
                size: 32,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "Cart",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
              )
            ],
          ),
          const Divider(
            color: Colors.white,
            indent: 4,
            height: 40,
          ),
          Container(
            margin: EdgeInsets.only(bottom: 15),
            child: Text(
              "Service",
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
            ),
          ),
          Row(
            children: const [
              Icon(
                Icons.phone_in_talk_outlined,
                size: 32,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "Contact Us",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
              )
            ],
          ),
          const Divider(
            color: Colors.white,
            indent: 4,
            height: 40,
          ),
          Row(
            children: const [
              Icon(
                Icons.favorite_border,
                size: 32,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "Term and Conditions",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
              )
            ],
          ),
          const Divider(
            color: Colors.white,
            indent: 4,
            height: 40,
          ),
          Row(
            children: const [
              Icon(
                Icons.logout_outlined,
                size: 32,
                color: unselectedColor,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "Log out",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
