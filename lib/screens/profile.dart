import 'dart:convert';

import 'package:estore/components/colors.dart';
import 'package:estore/models/user_model.dart';
import 'package:estore/widgets/menu_profile.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:recase/recase.dart';

class ScreenProfile extends StatefulWidget {
  const ScreenProfile({Key? key}) : super(key: key);

  @override
  State<ScreenProfile> createState() => _ScreenProfileState();
}

class _ScreenProfileState extends State<ScreenProfile> {
  List<UserModel> userData = [];

  Future getUserData() async {
    try {
      var response =
          await http.get(Uri.parse("https://fakestoreapi.com/users/4"));
      Map<String, dynamic> data = json.decode(response.body);
      data.forEach((key, value) {
        userData.add(UserModel.fromJson(data));
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Container(
          margin: EdgeInsets.only(left: 10),
          child: Text(
            "Profile",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        elevation: 0,
        centerTitle: false,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: FutureBuilder(
            future: getUserData(),
            builder: (BuildContext context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: Container(child: Text("Loading..."),));
              } else {
                return ListView.builder(
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(60),
                                image: const DecorationImage(
                                    image:
                                        AssetImage("assets/images/profile.jpg"),
                                    fit: BoxFit.cover),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("Hello, welcome back !"),
                                Text(
                                  "${userData[index].name.firstname.sentenceCase} ${userData[index].name.lastname.sentenceCase}",
                                  style: const TextStyle(
                                      color: primaryColor,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 17),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "+${userData[index].phone}",
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                )
                              ],
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        MenuProfile()
                      ],
                    );
                  },
                );
              }
            }),
      ),
    );
  }
}
