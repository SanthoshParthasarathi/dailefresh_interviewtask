import 'package:flutter/material.dart';

class PriceList with ChangeNotifier {
  int? prodPriceId;
  int? proId;
  String? productMRP;
  String? mRPValue;
  String? productWeight;
  String? productWeightType;
  bool? availabilityFlag;
  int? qty;

  PriceList(
      {this.prodPriceId,
      this.proId,
      this.productMRP,
      this.mRPValue,
      this.productWeight,
      this.productWeightType,
      this.availabilityFlag,
      this.qty});

  PriceList.fromJson(Map<String, dynamic> json) {
    prodPriceId = json['prod_price_id'];
    proId = json['Pro_id'];
    productMRP = json['product_MRP'];
    mRPValue = json['MRPValue'];
    productWeight = json['product_weight'];
    productWeightType = json['product_weight_type'];
    availabilityFlag = json['AvailabilityFlag'];
    qty = json['qty'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['prod_price_id'] = this.prodPriceId;
  //   data['Pro_id'] = this.proId;
  //   data['product_MRP'] = this.productMRP;
  //   data['MRPValue'] = this.mRPValue;
  //   data['product_weight'] = this.productWeight;
  //   data['product_weight_type'] = this.productWeightType;
  //   data['AvailabilityFlag'] = this.availabilityFlag;
  //   data['qty'] = this.qty;
  //   return data;
  // }

  static List<PriceList> priceListFromSnapshot(List priceListSnapshot) {
    return priceListSnapshot.map((data) {
      return PriceList.fromJson(data);
    }).toList();
  }
}
