import 'package:flutter/material.dart';
import 'package:task_management_app/pages/on_boarding_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const OnBoardingPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
