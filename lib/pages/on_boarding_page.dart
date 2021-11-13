import 'package:flutter/material.dart';
import 'package:task_management_app/pages/home_page.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  static const routeName = '/on_boarding';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const <Widget>[
          Expanded(
            child: _Image(),
          ),
          SizedBox(height: 16),
          _Title(),
          SizedBox(height: 16),
          _Description(),
          SizedBox(height: 16),
          _SliderIndicator(),
          SizedBox(height: 64),
          _Button(),
          SizedBox(height: 32),
        ],
      ),
    );
  }
}

class _Image extends StatelessWidget {
  const _Image({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: double.infinity,
          child: Image.asset(
            'assets/images/glenn-carstens-peters-RLw-UC03Gwc-unsplash.jpg',
            fit: BoxFit.cover,
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 64,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: <Color>[
                  Theme.of(context).scaffoldBackgroundColor,
                  Theme.of(context).scaffoldBackgroundColor.withAlpha(0),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        'Manage and prioritize your task easily',
        textAlign: TextAlign.center,
        style: Theme.of(context)
            .textTheme
            .headline4
            ?.copyWith(fontWeight: FontWeight.bold, color: Colors.black87),
      ),
    );
  }
}

class _Description extends StatelessWidget {
  const _Description({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        'Increase your productivity by managing your personal and team task and do them based on the highest priority',
        textAlign: TextAlign.center,
        style:
            Theme.of(context).textTheme.subtitle1?.copyWith(color: Colors.grey),
      ),
    );
  }
}

class _SliderIndicator extends StatelessWidget {
  const _SliderIndicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          _CircleIndicator(),
          _CircleIndicator(),
          _CircleIndicator(isActive: true),
        ],
      ),
    );
  }
}

class _CircleIndicator extends StatelessWidget {
  const _CircleIndicator({
    Key? key,
    this.isActive = false,
  }) : super(key: key);

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: CircleAvatar(
        radius: 6,
        backgroundColor: isActive ? Colors.blue : Colors.blue.shade100,
      ),
    );
  }
}

class _Button extends StatelessWidget {
  const _Button({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        height: 48,
        child: ElevatedButton(
          onPressed: () => _gotoHomePage(context),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text('GetStarted'),
              SizedBox(width: 16),
              Icon(Icons.arrow_forward)
            ],
          ),
        ),
      ),
    );
  }

  void _gotoHomePage(BuildContext context) {
    Navigator.of(context).pushReplacementNamed(HomePage.routeName);
  }
}
