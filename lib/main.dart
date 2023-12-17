import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:zenlap/Navbar.dart';
import 'package:zenlap/view/splash_screen.dart';

late final FirebaseApp app;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  app = await Firebase.initializeApp(
    // options: DefaultFirebaseOptions.currentPlatform,
    options: FirebaseOptions(
      apiKey: "AIzaSyAEEEYGZUh4_Qtr84feLnSM0HzVRXqLI80",
      appId: "1:531602764064:android:448cf297f73ac27b452745",
      messagingSenderId: "Messaging sender id here",
      projectId: "review-jam-tangan",
      // apiKey: "AIzaSyClr-W3ARL7blafah09L20RxnRmX_d9HL4",
      // appId: "1:885284014446:android:4824d17ac69ee19b61197f",
      // messagingSenderId: "Messaging sender id here";
      // projectId: "zenlap",
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: SplashScreen(),
      debugShowCheckedModeBanner: false,
      title: 'ZenLap',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 37, 14, 185)),
        useMaterial3: true,
      ),
      home: SplashScreen(),
      // home: Login(),
      // home: Register(),
      // home: ListPage(),
      // home: Profile(),
      // home: Navbar(),

      // SplashScreen
      //  home: SplashScreen(
      //   seconds: 8,
      //   navigateAfterSeconds:Login(),
      //   title: new Text(
      //     'SplashScreen Example',
      //     style: new TextStyle(
      //         fontWeight: FontWeight.bold,
      //         fontSize: 20.0,
      //         color: Colors.white),
      //   ),
      //   backgroundColor: Colors.lightBlue[200],
      // )
    );
  }
}
