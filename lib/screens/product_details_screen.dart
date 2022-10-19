import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({
    Key? key,
    required this.productId,
    required this.imageUrl,
    required this.productName,
    required this.price,
    required this.productDescription,
    required this.productWeight,
  }) : super(key: key);

  final String productId;
  final String imageUrl;
  final String productName;
  final String price;
  final String productDescription;
  final String productWeight;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Product Details',
          style: TextStyle(
            letterSpacing: 1,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: FancyShimmerImage(
              height: size.height * 0.4,
              width: double.infinity,
              boxFit: BoxFit.fill,
              imageUrl: imageUrl,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    productName,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      letterSpacing: 0.5,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: Container(
                  padding: EdgeInsets.all(4),
                  alignment: Alignment.center,
                  height: size.height * 0.06,
                  width: size.width * 0.3,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(8),
                    // border: Border.all(),
                  ),
                  child: Text(
                    'ADD',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              "₹$price /${productWeight}kg",
              style: TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              productDescription,
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                letterSpacing: 0.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
