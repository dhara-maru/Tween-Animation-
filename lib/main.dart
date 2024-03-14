import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login with animation',
      home: homepage(),
    );
  }
}

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage>
    with SingleTickerProviderStateMixin {
  late Animation animation;
  late Animation coloranimation;
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();

    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 5));

    animation = Tween(begin: 200.0, end: 0.0).animate(animationController);
    coloranimation = ColorTween(begin: Colors.green[400], end: Colors.purple[800]).animate(animationController);

    animationController.addListener(() {
      // print(animation.value);

      setState(() {});
      
    });

    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color:coloranimation.value,
          ),
          
          width: animation.value,
          height: animation.value,
        ),
      ),
    );
  }
}
