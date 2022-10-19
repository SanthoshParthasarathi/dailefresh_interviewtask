import 'package:badges/badges.dart';
import 'package:dailefresh_interview/model/product_model.dart';
import 'package:dailefresh_interview/provider/cart_provider.dart';
import 'package:dailefresh_interview/screens/product_details_screen.dart';
import 'package:dailefresh_interview/services/api_handler.dart';
import 'package:dailefresh_interview/widgets/grid_card_widget.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:loading/indicator/ball_pulse_indicator.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:loading/loading.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  // List<Data> productList = [];

  // @override
  // void initState() {
  //   print('initstate');
  //   getProducts();
  //   super.initState();
  // }

  // @override
  // void didChangeDependencies() {
  //   print('didchangedependencies');
  //   getProducts();
  //   super.didChangeDependencies();
  // }

  // Future<void> getProducts() async {
  //   productList = (await ApiHandler.getProduct()).cast<Data>();
  //   setState(() {});
  //   print('hello from function');
  //   print(productList.length);
  // }

  @override
  Widget build(BuildContext context) {
    print('buildcontext');

    Size size = MediaQuery.of(context).size;

    const RoundedRectangleBorder roundedRectangleBorder =
        RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(20.0),
      ),
    );
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        shape: roundedRectangleBorder,
        leading: Icon(
          Icons.menu,
          size: 25,
        ),
        title: Text(
          'dailefresh',
          style: TextStyle(fontSize: 25, letterSpacing: 0.5),
        ),
        centerTitle: true,
        actions: [
          Consumer<Cart>(
            builder: (context, cart, child) => Padding(
              padding: const EdgeInsets.all(20.0),
              child: Badge(
                animationType: BadgeAnimationType.scale,
                animationDuration: Duration(
                  milliseconds: 300,
                ),
                badgeContent: Text(
                  cart.count.toString(),
                  style: TextStyle(color: Colors.white),
                ),
                child: Icon(
                  Icons.shopping_cart,
                ),
              ),
            ),
          ),
        ],
      ),
      body: FutureBuilder<List<Data>>(
        future: ApiHandler.getProduct(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(
              child: Center(
                child: Loading(
                  indicator: BallPulseIndicator(),
                  size: 100.0,
                  color: Colors.green,
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('An Error Occured ${snapshot.error}'),
            );
          } else if (snapshot.data == null) {
            return Center(
              child: Text('No products has been added'),
            );
          } else {
            return GridView.builder(
              shrinkWrap: true,
              // physics: NeverScrollableScrollPhysics(),
              itemCount: snapshot.data!.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 0.0,
                mainAxisSpacing: 4.0,
                childAspectRatio: 0.6,
              ),
              itemBuilder: (context, index) {
                print(snapshot.data![index]);
                print(index.toString());
                return ChangeNotifierProvider.value(
                  value: snapshot.data![index],
                  child: ClipRRect(
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
                                         
                                          productId: int.parse(snapshot
                                              .data![index].productId
                                              .toString()),
                                          productName: snapshot
                                              .data![index].productName
                                              .toString(),
                                          price: snapshot.data![index]
                                              .priceList![0].productMRP
                                              .toString(),
                                          imageUrl: snapshot
                                              .data![index].productSmallImg
                                              .toString(),
                                          productDescription: snapshot
                                              .data![index].productDescription
                                              .toString(),
                                          productWeight: snapshot.data![index]
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
                                        imageUrl: snapshot
                                            .data![index].productSmallImg
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
                                          snapshot.data![index].discountValue
                                                  .toString()
                                                  .isEmpty
                                              ? "0% off"
                                              : "${snapshot.data![index].discountValue.toString()}% off",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.white),
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
                                    snapshot.data![index].productName
                                        .toString(),
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
                                      snapshot.data![index].priceList![0]
                                              .productWeight
                                              .toString() +
                                          ' ' +
                                          snapshot.data![index].priceList![0]
                                              .productWeightType
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "₹${snapshot.data![index].priceList![0].productMRP}",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 22,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Consumer<Cart>(
                                          builder: (context, cart, child) =>
                                              cart.getCountForId(snapshot
                                                          .data![index]
                                                          .productId) <=
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
                                                          // ProductModelProvider.productName
                                                          //     .toString(),
                                                          snapshot.data![index]
                                                              .productId!,
                                                          // ProductModelProvider.productSmallImg
                                                          //     .toString(),
                                                        );
                                                        print(snapshot
                                                            .data![index]
                                                            .productName
                                                            .toString());
                                                        print(cart.count);
                                                        print(cart);
                                                      },
                                                      child: Container(
                                                        padding:
                                                            EdgeInsets.all(4),
                                                        alignment:
                                                            Alignment.center,
                                                        height:
                                                            size.height * 0.04,
                                                        width:
                                                            size.width * 0.16,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
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
                                                      builder: (context, cart,
                                                          child) {
                                                        return Container(
                                                          // padding: EdgeInsets.all(4),
                                                          alignment:
                                                              Alignment.center,
                                                          height: size.height *
                                                              0.043,
                                                          width:
                                                              size.width * 0.27,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            border: Border.all(
                                                              width: 0.5,
                                                            ),
                                                          ),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                            children: [
                                                              InkWell(
                                                                onTap: () {
                                                                  cart.removeItem(
                                                                      snapshot.data![
                                                                          index]);
                                                                  print('-');
                                                                },
                                                                child: Text(
                                                                  '-',
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize:
                                                                        24,
                                                                  ),
                                                                ),
                                                              ),
                                                              Text(
                                                                cart
                                                                    .getCountForId(snapshot
                                                                        .data![
                                                                            index]
                                                                        .productId)
                                                                    .toString(),
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .black,
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
                                                                    // ProductModelProvider
                                                                    //     .productName
                                                                    //     .toString(),
                                                                    snapshot
                                                                        .data![
                                                                            index]
                                                                        .productId!,
                                                                    // ProductModelProvider
                                                                    //     .productSmallImg
                                                                    //     .toString(),
                                                                  );
                                                                  print(snapshot
                                                                      .data![
                                                                          index]
                                                                      .productName
                                                                      .toString());
                                                                  print(cart
                                                                      .count);
                                                                  // print(cart
                                                                  //     .length);
                                                                  // print(cart
                                                                  //     .items
                                                                  //     .length);

                                                                  // print(cart
                                                                  //     .items[
                                                                  //         index]
                                                                  //     .productId);
                                                                },
                                                                child: Text(
                                                                  '+',
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize:
                                                                        22,
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
                );
              },
            );
          }
        },
      ),
    );
  }
}
