import 'package:dailefresh_interview/model/product_model.dart';
import 'package:dailefresh_interview/provider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:splashscreen/splashscreen.dart';

import 'screens/firstpage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProductModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => Cart(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'dailefresh',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: SafeArea(
          child: Center(
            child: SplashScreen(
              seconds: 4,
              navigateAfterSeconds: FirstPage(),
              image: new Image.asset('assets/images/dailefreshlogo.png'),
              backgroundColor: Colors.white,
              photoSize: 200.0,
              // loadingText: Text(
              //   'Loading please wait...',
              //   style: TextStyle(
              //     fontSize: 20,
              //     color: Colors.green,
              //   ),
              // ),
              loaderColor: Colors.green,
            ),
          ),
        ),
      ),
    );
  }
}
