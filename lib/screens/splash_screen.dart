// import 'dart:async';

// import 'package:animated_text_kit/animated_text_kit.dart';
// import 'package:authapi/screens/homepage.dart';
// import 'package:authapi/screens/signin.dart';
// import 'package:flutter/material.dart';
// import 'dart:math' as math;

// import 'package:shared_preferences/shared_preferences.dart';

// var isLogged;

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({Key? key}) : super(key: key);

//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen>
//     with TickerProviderStateMixin {
//   late final AnimationController _controller = AnimationController(
//     duration: const Duration(seconds: 10),
//     vsync: this,
//   )..repeat();
//   Future<void> UserLoggedIn() async {
//     SharedPreferences pref = await SharedPreferences.getInstance();
//     var isLoggedIn = pref.getString("usernameoremail");
//     setState(() {
//       isLogged = isLoggedIn;
//     });
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   void initState() {
//     // TODO: implement initState
//     UserLoggedIn().whenComplete(() async {
//       Timer(const Duration(seconds: 5), () {
//         isLogged.toString() == null
//             ? Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                     builder: (context) => HomePage(
//                           username: isLogged.toString(),
//                         )))
//             : Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => SignIn()),
//               );
//       });
//     });
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             AnimatedBuilder(
//               animation: _controller,
//               child: Container(
//                 width: 200.0,
//                 height: 200.0,
//                 child: const Center(
//                   child: Text(""),
//                 ),
//               ),
//               builder: (BuildContext context, Widget? child) {
//                 return Transform.rotate(
//                   angle: _controller.value * 2.0 * math.pi,
//                   child: child,
//                 );
//               },
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * .08,
//             ),
//             const Align(
//                 alignment: Alignment.center,
//                 child: Text(
//                   'Covid-19\nTracker App',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
//                 ))
//           ],
//         ),
//       ),
//     );
//   }
// }
