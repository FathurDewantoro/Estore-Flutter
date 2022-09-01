// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class HttpFutureBuilder extends StatefulWidget {
//   const HttpFutureBuilder({Key? key}) : super(key: key);

//   @override
//   State<HttpFutureBuilder> createState() => _HttpFutureBuilderState();
// }

// class _HttpFutureBuilderState extends State<HttpFutureBuilder> {
//   // List<UserModel> dataAllUsers = [];

//   Future getAllUsers() async {
//     try {
//       var response = await http.get(Uri.parse("https://reqres.in/api/users"));
//       List data = (json.decode(response.body) as Map<String, dynamic>)['data'];
//       data.forEach((element) {
//         // dataAllUsers.add(UserModel.fromJson(element));
//       });
//     } catch (e) {
//       print(e);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           "Future Builder",
//           style: TextStyle(color: Colors.black),
//         ),
//         centerTitle: false,
//         backgroundColor: Colors.grey[50],
//         elevation: 0,
//       ),
//       body: FutureBuilder(
//         future: getAllUsers(),
//         builder: (BuildContext context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(
//               child: Text("Loading ..."),
//             );
//           } else {
//             return ListView.builder(
//               // itemCount: dataAllUsers.length,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   leading: CircleAvatar(
//                     backgroundImage:
//                         NetworkImage("${dataAllUsers[index].avatar}"),
//                     backgroundColor: Colors.grey[300],
//                   ),
//                   title: Text(
//                       "${dataAllUsers[index].firstName} ${dataAllUsers[index].lastName}"),
//                   subtitle: Text(dataAllUsers[index].email),
//                 );
//               },
//             );
//           }
//         },
//       ),
//     );
//   }
// }
