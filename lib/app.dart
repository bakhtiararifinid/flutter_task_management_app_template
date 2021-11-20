import 'package:flutter/material.dart';
import 'package:task_management_app/pages/home_page.dart';
import 'package:task_management_app/pages/on_boarding_page.dart';
import 'package:task_management_app/pages/task_detail_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: OnBoardingPage.routeName,
      routes: {
        OnBoardingPage.routeName: (context) => const OnBoardingPage(),
        HomePage.routeName: (context) => const HomePage(),
        TaskDetailPage.routeName: (context) => const TaskDetailPage(),
      },
    );
  }
}
