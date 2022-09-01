import 'package:estore/components/colors.dart';
import 'package:flutter/material.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            width: double.infinity,
            height: 100,
            child: Column(
              children: [
                Text(
                  "Sorry :(",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      color: primaryColor),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "E-wallet is still under development right now.",
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
                ),
              ],
            ),
          ),
        ));
  }
}
