import 'package:estore/models/detail_product.dart';
import 'package:flutter/material.dart';

import '../components/colors.dart';

class BodyDetailProduct extends StatefulWidget {
  List<DetailProduct> dataProduct = [];
  BodyDetailProduct({Key? key, required this.dataProduct}) : super(key: key);

  @override
  State<BodyDetailProduct> createState() => _BodyDetailProductState();
}

class _BodyDetailProductState extends State<BodyDetailProduct> {
  Icon suffixCuponIcon =
      const Icon(Icons.create_rounded, color: unselectedColor);
  Color borderEnableColor = unselectedColor;
  int count = 1;
  bool favourite = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Container(
              width: double.infinity,
              height: 320,
              decoration: BoxDecoration(
                // color: Colors.grey[300],
                image: DecorationImage(
                  image: NetworkImage(
                    widget.dataProduct.first.image,
                  ),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                width: 100,
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: const Text(
                  "Free Shipping",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 0.3, color: unselectedColor),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: IconButton(
                  onPressed: () {
                    favourite == false ? favourite = true : favourite = false;
                    setState(() {});
                  },
                  icon: Icon(
                    Icons.favorite,
                    color: favourite == true ? Colors.pink : unselectedColor,
                    size: 18,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 60),
            child: Text(
              widget.dataProduct.first.title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              maxLines: 3,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const Icon(
                Icons.star,
                size: 22,
                color: Colors.amber,
              ),
              const SizedBox(
                width: 3,
              ),
              Text(
                widget.dataProduct.first.rating.rate.toString(),
                style:
                    const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            widget.dataProduct.first.description,
            style: const TextStyle(
                fontSize: 13,
                color: unselectedColor,
                fontWeight: FontWeight.w600),
            maxLines: 6,
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "\$ ${widget.dataProduct.first.price.toString()}",
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
              ),
              Text(
                  "Terjual ${widget.dataProduct.first.rating.count.toString()}")
            ],
          ),
          const SizedBox(
            height: 15,
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
            textCapitalization: TextCapitalization.characters,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            autocorrect: false,
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: borderEnableColor)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: primaryColor)),
              hintText: "Enter here",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              suffixIcon: suffixCuponIcon,
            ),
            onSubmitted: (value) {
              if (value != "") {
                suffixCuponIcon = const Icon(Icons.check, color: primaryColor);
                borderEnableColor = primaryColor;
              } else {
                null;
              }
              setState(() {});
            },
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  count == 1 ? null : count--;
                  setState(() {});
                },
                child: Icon(
                  Icons.remove,
                  size: 20,
                  color: primaryColor,
                ),
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: const BorderSide(color: primaryColor)),
                    padding: const EdgeInsets.all(10),
                    primary: Colors.white,
                    minimumSize: const Size(5, 5)),
              ),
              SizedBox(
                width: 40,
                child: Text(
                  count.toString(),
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  count++;
                  setState(() {});
                },
                child: Icon(
                  Icons.add,
                  size: 20,
                ),
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    padding: const EdgeInsets.all(10),
                    primary: primaryColor,
                    minimumSize: const Size(5, 5)),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "Checkout",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      primary: primaryColor,
                      padding: EdgeInsets.all(10)),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
