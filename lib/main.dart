import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Screens/news/news_view/news_view.dart';
import 'Screens/news/provider/news_provider.dart';

void main()
{
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => homeProvider(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/':(context) => home_screen(),
        },
      ),
    ),
  );
}
