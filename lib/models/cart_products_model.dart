// To parse required this JSON data, do
//
//     final cartProcutsModel = cartProcutsModelFromJson(jsonString);

import 'dart:convert';

CartProcutsModel cartProcutsModelFromJson(String str) =>
    CartProcutsModel.fromJson(json.decode(str));

String cartProcutsModelToJson(CartProcutsModel data) =>
    json.encode(data.toJson());

class CartProcutsModel {
  CartProcutsModel({
    required this.productId,
    required this.quantity,
  });

  int productId;
  int quantity;

  factory CartProcutsModel.fromJson(Map<String, dynamic> json) =>
      CartProcutsModel(
        productId: json["productId"],
        quantity: json["quantity"],
      );

  Map<String, dynamic> toJson() => {
        "productId": productId,
        "quantity": quantity,
      };
}
