import 'package:flutter/material.dart';
import 'package:news_api/Screen/Provider/home_provider.dart';
import 'package:news_api/Screen/view/home_screen.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Homeprovider(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/' : (context) => Home_screen(),
        },
      ),
    ),
  );
}