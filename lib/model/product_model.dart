import 'package:dailefresh_interview/model/pricelist_model.dart';
import 'package:flutter/material.dart';

class ProductModel with ChangeNotifier {
  List<Data>? data;
  String? responseCode;
  String? responseMessage;

  ProductModel({this.data, this.responseCode, this.responseMessage});

  ProductModel.fromJson(Map<String, dynamic> json) {
    if (json['Data'] != null) {
      data = <Data>[];
      json['Data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    responseCode = json['ResponseCode'];
    responseMessage = json['ResponseMessage'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   if (this.data != null) {
  //     data['Data'] = this.data!.map((v) => v.toJson()).toList();
  //   }
  //   data['ResponseCode'] = this.responseCode;
  //   data['ResponseMessage'] = this.responseMessage;
  //   return data;
  // }

  static List<ProductModel> productModelFromSnapshot(List productSnapshot) {
    return productSnapshot.map((data) {
      return ProductModel.fromJson(data);
    }).toList();
  }
}

class Data with ChangeNotifier {
  String? discountValue;
  String? discountFlag;
  String? offerType;
  dynamic decrementFlag;
  int? productId;
  String? productName;
  String? productSmallImg;
  bool? wishlistFlag;
  bool? subscriptionFlag;
  String? productDescription;
  List<PriceList>? priceList;
  List<dynamic>? cartList;
  bool? availabilityFlag;
  dynamic productMRP;
  dynamic pWeight;
  dynamic pWeightType;
  dynamic pSalePrice;
  int? prodPriceId;
  int? qty;
  int? minValue;
  int? maxValue;
  dynamic aboutProduct;
  dynamic productBenefits;
  dynamic storageUses;
  dynamic otherProductInfo;
  dynamic variableWeight;
  dynamic weightDetails;
  dynamic wPrice;
  dynamic wMRP;

  Data(
      {this.discountValue,
      this.discountFlag,
      this.offerType,
      this.decrementFlag,
      this.productId,
      this.productName,
      this.productSmallImg,
      this.wishlistFlag,
      this.subscriptionFlag,
      this.productDescription,
      this.priceList,
      this.cartList,
      this.availabilityFlag,
      this.productMRP,
      this.pWeight,
      this.pWeightType,
      this.pSalePrice,
      this.prodPriceId,
      this.qty,
      this.minValue,
      this.maxValue,
      this.aboutProduct,
      this.productBenefits,
      this.storageUses,
      this.otherProductInfo,
      this.variableWeight,
      this.weightDetails,
      this.wPrice,
      this.wMRP});

  Data.fromJson(Map<String, dynamic> json) {
    discountValue = json['DiscountValue'];
    discountFlag = json['DiscountFlag'];
    offerType = json['OfferType'];
    decrementFlag = json['DecrementFlag'];
    productId = json['product_id'];
    productName = json['product_name'];
    productSmallImg = json['product_small_img'];
    wishlistFlag = json['Wishlist_Flag'];
    subscriptionFlag = json['Subscription_Flag'];
    productDescription = json['ProductDescription'];
    if (json['PriceList'] != null) {
      priceList = <PriceList>[];
      json['PriceList'].forEach((v) {
        priceList!.add(new PriceList.fromJson(v));
      });
    }
    // if (json['CartList'] != null) {
    //   cartList = <dynamic>[];
    //   json['CartList'].forEach((v) {
    //     cartList!.add(new dynamic.fromJson(v));
    //   });
    // }
    availabilityFlag = json['AvailabilityFlag'];
    productMRP = json['product_MRP'];
    pWeight = json['P_Weight'];
    pWeightType = json['P_Weight_type'];
    pSalePrice = json['P_SalePrice'];
    prodPriceId = json['prod_price_id'];
    qty = json['qty'];
    minValue = json['MinValue'];
    maxValue = json['MaxValue'];
    aboutProduct = json['AboutProduct'];
    productBenefits = json['ProductBenefits'];
    storageUses = json['StorageUses'];
    otherProductInfo = json['OtherProductInfo'];
    variableWeight = json['VariableWeight'];
    weightDetails = json['WeightDetails'];
    wPrice = json['WPrice'];
    wMRP = json['WMRP'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['DiscountValue'] = this.discountValue;
  //   data['DiscountFlag'] = this.discountFlag;
  //   data['OfferType'] = this.offerType;
  //   data['DecrementFlag'] = this.decrementFlag;
  //   data['product_id'] = this.productId;
  //   data['product_name'] = this.productName;
  //   data['product_small_img'] = this.productSmallImg;
  //   data['Wishlist_Flag'] = this.wishlistFlag;
  //   data['Subscription_Flag'] = this.subscriptionFlag;
  //   data['ProductDescription'] = this.productDescription;
  //   if (this.priceList != null) {
  //     data['PriceList'] = this.priceList!.map((v) => v.toJson()).toList();
  //   }
  //   if (this.cartList != null) {
  //     data['CartList'] = this.cartList!.map((v) => v.toJson()).toList();
  //   }
  //   data['AvailabilityFlag'] = this.availabilityFlag;
  //   data['product_MRP'] = this.productMRP;
  //   data['P_Weight'] = this.pWeight;
  //   data['P_Weight_type'] = this.pWeightType;
  //   data['P_SalePrice'] = this.pSalePrice;
  //   data['prod_price_id'] = this.prodPriceId;
  //   data['qty'] = this.qty;
  //   data['MinValue'] = this.minValue;
  //   data['MaxValue'] = this.maxValue;
  //   data['AboutProduct'] = this.aboutProduct;
  //   data['ProductBenefits'] = this.productBenefits;
  //   data['StorageUses'] = this.storageUses;
  //   data['OtherProductInfo'] = this.otherProductInfo;
  //   data['VariableWeight'] = this.variableWeight;
  //   data['WeightDetails'] = this.weightDetails;
  //   data['WPrice'] = this.wPrice;
  //   data['WMRP'] = this.wMRP;
  //   return data;
  // }

 

  static List<Data> dataFromSnapshot(List dataSnapshot) {
    return dataSnapshot.map((data) {
      return Data.fromJson(data);
    }).toList();
  }
}
