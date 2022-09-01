// import 'package:flutter/material.dart';

// class MyWidget extends StatelessWidget {
//   const MyWidget({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//         toolbarHeight: 65,
//         shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.only(
//                 bottomLeft: Radius.circular(20),
//                 bottomRight: Radius.circular(20))),
//         centerTitle: false,
//         elevation: 0,
//         title: Container(
//           width: 600,
//           height: 40,
//           margin: EdgeInsets.only(bottom: 10),
//           decoration: BoxDecoration(
//               color: Colors.white, borderRadius: BorderRadius.circular(10)),
//           child: Center(
//             child: TextField(
//               decoration: InputDecoration(
//                   prefix: const SizedBox(
//                     width: 20,
//                   ),
//                   suffixIcon: IconButton(
//                     icon: const Icon(
//                       Icons.search,
//                       color: Colors.grey,
//                     ),
//                     onPressed: () {
//                       /* Clear the search field */
//                     },
//                   ),
//                   hintText: 'Search...',
//                   border: InputBorder.none),
//             ),
//           ),
//         ),
//         backgroundColor: Color(0xffFF37C8A5),
//         actions: [
//           FutureBuilder(
//             future: getCart(),
//             builder: (BuildContext context, snapshot) {
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return Container(
//                   margin: EdgeInsets.only(right: 25, top: 10),
//                   padding: EdgeInsets.only(bottom: 18),
//                   child: Badge(
//                     padding: const EdgeInsets.all(7),
//                     badgeContent: const Text(
//                       "0",
//                       style: TextStyle(color: Colors.white, fontSize: 12),
//                     ),
//                     child: IconButton(
//                         onPressed: () {
//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) =>
//                                     MyCart(productGet: dataCartProducts),
//                               ));
//                         },
//                         icon: const Icon(
//                           Icons.shopping_cart_outlined,
//                           color: Colors.white,
//                         )),
//                   ),
//                 );
//               } else {
//                 return Container(
//                   margin: EdgeInsets.only(right: 25, top: 10),
//                   padding: EdgeInsets.only(bottom: 18),
//                   child: Badge(
//                     padding: EdgeInsets.all(7),
//                     badgeContent: Text(
//                       dataCartProducts.length.toString(),
//                       style: TextStyle(color: Colors.white, fontSize: 12),
//                     ),
//                     child: IconButton(
//                         onPressed: () {
//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) =>
//                                     MyCart(productGet: dataCartProducts),
//                               ));
//                         },
//                         icon: const Icon(
//                           Icons.shopping_cart_outlined,
//                           color: Colors.white,
//                         )),
//                   ),
//                 );
//               }
//             },
//           ),
//         ],
//       ),
//       ),
//     )
//   }
// }