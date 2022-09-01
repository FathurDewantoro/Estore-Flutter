import 'package:estore/components/colors.dart';
import 'package:estore/screens/profile.dart';
import 'package:flutter/material.dart';
import 'profile.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key, required this.halaman}) : super(key: key);
  bool halaman = false;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool hiddenPassword = true;
  @override
  Widget build(BuildContext context) {
    if (widget.halaman == false) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Log in",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: 250,
                    child: Text(
                      "Enter your credentials to access your account.",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                          color: unselectedColor),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Email address",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 13),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextField(
                    style: const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.w400),
                    autocorrect: false,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: unselectedColor)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: primaryColor)),
                      hintText: "name@mail.com",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Password",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 13),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextField(
                    style: const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.w400),
                    autocorrect: false,
                    textInputAction: TextInputAction.done,
                    obscureText: hiddenPassword,
                    decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: unselectedColor)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: primaryColor)),
                        hintText: "Password",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        suffixIcon: IconButton(
                            onPressed: () {
                              if (hiddenPassword == true) {
                                hiddenPassword = false;
                              } else {
                                hiddenPassword = true;
                              }
                              setState(() {});
                            },
                            icon: Icon(
                              hiddenPassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: unselectedColor,
                            ))),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            "Forgot password ?",
                            style: TextStyle(fontSize: 12, color: primaryColor),
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            widget.halaman = true;
                            setState(() {});
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 14),
                          ),
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              primary: primaryColor,
                              padding: EdgeInsets.all(15)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      );
    } else {
      return ScreenProfile();
    }
  }
}
