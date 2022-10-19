import 'package:badges/badges.dart';
import 'package:dailefresh_interview/model/product_model.dart';
import 'package:dailefresh_interview/provider/cart_provider.dart';
import 'package:dailefresh_interview/services/api_handler.dart';
import 'package:dailefresh_interview/widgets/grid_card_widget.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:loading/indicator/ball_pulse_indicator.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:loading/loading.dart';
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
  //   productList = await ApiHandler.getProduct();
  //   setState(() {});
  //   print('hello from function');
  //   print(productList.length);
  // }

  @override
  Widget build(BuildContext context) {
    print('buildcontext');

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
            builder: (context, cart, child) {
              return Padding(
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
              );
            },
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
                return ChangeNotifierProvider.value(
                  value: snapshot.data![index],
                  child: GridWidget(),
                );
              },
            );
          }
        },
      ),
    );
  }
}
