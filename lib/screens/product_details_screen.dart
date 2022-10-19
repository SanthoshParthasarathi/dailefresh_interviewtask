import 'package:dailefresh_interview/provider/cart_provider.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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

  final int productId;
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
              Consumer<Cart>(
                builder: (context, cart, child) => cart.count <= 0
                    ? InkWell(
                        onTap: () {
                          // cart.addToCart({
                          //   "id": ProductModelProvider.productId,
                          //   "title":
                          //       ProductModelProvider.productName,
                          //   "price": ProductModelProvider
                          //       .priceList![0].productMRP,
                          //   "qty": ProductModelProvider.qty,
                          //   "imageURL":
                          //       ProductModelProvider.productSmallImg
                          // });
                          cart.addItem(
                            // productName.toString(),
                            int.parse(productId.toString()),
                            // imageUrl.toString(),
                          );
                          print(productName.toString());
                          print(cart.count);
                          print(cart);
                        },
                        child: Padding(
                          padding: EdgeInsets.only(right: 20),
                          child: Container(
                            padding: EdgeInsets.all(4),
                            alignment: Alignment.center,
                            height: size.height * 0.05,
                            width: size.width * 0.25,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              'ADD',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      )
                    : Consumer<Cart>(
                        builder: (context, cart, child) {
                          return Padding(
                            padding: EdgeInsets.only(right: 20),
                            child: Container(
                              // padding: EdgeInsets.all(4),
                              alignment: Alignment.center,
                              height: size.height * 0.05,
                              width: size.width * 0.25,
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(10),
                                // border: Border.all(
                                //   width: 0.5,
                                // ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  // InkWell(
                                  //   onTap: () {
                                  //     cart.removeItem(productId);
                                  //     print('-');
                                  //   },
                                  //   child: Text(
                                  //     '-',
                                  //     style: TextStyle(
                                  //       color: Colors.white,
                                  //       fontSize: 24,
                                  //       fontWeight: FontWeight.w500,
                                  //     ),
                                  //   ),
                                  // ),
                                  Text(
                                    cart.getCountForId(productId).toString(),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      // cart.addToCart({
                                      //   "id": ProductModelProvider.productId,
                                      //   "title":
                                      //       ProductModelProvider.productName,
                                      //   "price": ProductModelProvider
                                      //       .priceList![0].productMRP,
                                      //   "qty": ProductModelProvider.qty,
                                      //   "imageURL":
                                      //       ProductModelProvider.productSmallImg
                                      // });
                                      cart.addItem(
                                        // productName.toString(),
                                        int.parse(productId.toString()),
                                        // imageUrl.toString(),
                                      );
                                      print(productName.toString());
                                      print(cart.count);
                                      print(cart);
                                      // print(cart.items.isEmpty);
                                    },
                                    child: Text(
                                      '+',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 22,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
              ),
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
