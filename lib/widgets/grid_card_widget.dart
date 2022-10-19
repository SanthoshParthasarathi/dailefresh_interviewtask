import 'dart:ui';
import 'package:dailefresh_interview/model/pricelist_model.dart';
import 'package:dailefresh_interview/model/product_model.dart';
import 'package:dailefresh_interview/provider/cart_provider.dart';
import 'package:dailefresh_interview/screens/product_details_screen.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class GridWidget extends StatelessWidget {
  GridWidget({
    Key? key,
    // required this.productData,
  }) : super(key: key);

  // List productAddList = [];
  // final Data productData;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final ProductModelProvider = Provider.of<Data>(context);
    // final PriceListModelProvider = Provider.of<PriceList>(context);
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        // itemCount: ProductModelProvider.data?.length,
        itemBuilder: (context, index) => ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Card(
            child: Container(
              child: Column(
                children: [
                  Stack(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            PageTransition(
                              child: ProductDetailScreen(
                                productId:
                                    ProductModelProvider.productId.toString(),
                                productName:
                                    ProductModelProvider.productName.toString(),
                                price: ProductModelProvider
                                    .priceList![0].productMRP
                                    .toString(),
                                imageUrl: ProductModelProvider.productSmallImg
                                    .toString(),
                                productDescription: ProductModelProvider
                                    .productDescription
                                    .toString(),
                                productWeight: ProductModelProvider
                                    .priceList![0].productWeight
                                    .toString(),
                              ),
                              type: PageTransitionType.fade,
                            ),
                          );
                        },
                        child: Column(
                          children: [
                            FancyShimmerImage(
                              height: size.height * 0.22,
                              width: double.infinity,
                              boxFit: BoxFit.fill,
                              imageUrl: ProductModelProvider.productSmallImg
                                  .toString(),
                              // ProductModelProvider.productSmallImg
                              //     .toString(),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Container(
                              width: size.width * 0.22,
                              padding: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                color: Colors.deepOrange,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20.0),
                                ),
                              ),
                              child: Text(
                                ProductModelProvider.discountValue
                                        .toString()
                                        .isEmpty
                                    ? "0% off"
                                    : "${ProductModelProvider.discountValue.toString()}% off",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          // 'Beans Avare double',
                          ProductModelProvider.productName.toString(),
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        Container(
                          alignment: Alignment.center,
                          height: size.height * 0.04,
                          width: size.width * 0.16,
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Text(
                            ProductModelProvider.priceList![0].productWeight
                                    .toString() +
                                ' ' +
                                ProductModelProvider
                                    .priceList![0].productWeightType
                                    .toString(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "₹${ProductModelProvider.priceList![0].productMRP}",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Consumer<Cart>(
                                builder: (context, cart, child) => cart.count <=
                                        0
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
                                            ProductModelProvider.productName
                                                .toString(),
                                            ProductModelProvider.productId!
                                                .toInt(),
                                            ProductModelProvider.productSmallImg
                                                .toString(),
                                          );
                                          print(ProductModelProvider.productName
                                              .toString());
                                          print(cart.count);
                                          print(cart);
                                          print(cart.items);
                                        },
                                        child: Container(
                                          padding: EdgeInsets.all(4),
                                          alignment: Alignment.center,
                                          height: size.height * 0.04,
                                          width: size.width * 0.16,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                              width: 0.5,
                                            ),
                                          ),
                                          child: Text(
                                            'ADD',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                      )
                                    : Consumer<Cart>(
                                        builder: (context, cart, child) {
                                          return Container(
                                            padding: EdgeInsets.all(4),
                                            alignment: Alignment.center,
                                            height: size.height * 0.043,
                                            width: size.width * 0.27,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                width: 0.5,
                                              ),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    cart.removeItem(
                                                        ProductModelProvider);
                                                    print('-');
                                                  },
                                                  child: Text(
                                                    '-',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 24,
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  cart.count.toString(),
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 18,
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
                                                      ProductModelProvider
                                                          .productName
                                                          .toString(),
                                                      ProductModelProvider
                                                          .productId!
                                                          .toInt(),
                                                      ProductModelProvider
                                                          .productSmallImg
                                                          .toString(),
                                                    );
                                                    print(ProductModelProvider
                                                        .productName
                                                        .toString());
                                                    // print(cart.count);
                                                    // print(cart);
                                                    // print(cart.items);
                                                  },
                                                  child: Text(
                                                    '+',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 22,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                              ),
                            ])
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
