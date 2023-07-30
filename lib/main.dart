// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:test3/pages/home.dart';
import 'package:test3/pages/signin.dart';
import 'package:provider/provider.dart';
import 'package:test3/provider/cart.dart';
import 'package:test3/provider/google_signin.dart';
import 'package:test3/shared/snackbar.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
//     if (kIsWeb) {
//       await Firebase.initializeApp(
//          options: const FirebaseOptions(
//            apiKey: "dddd",
//            authDomain: "dddd",
//            projectId: "dddd",
//            storageBucket: "dddd",
//            messagingSenderId: "dddd",
//            appId: "dddd"));
//   } else {
//  await Firebase.initializeApp();
//   }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) {
          return Cart();
        }),
        ChangeNotifierProvider(create: (context) {
          return GoogleSignInProvider();
        }),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                );
              } else if (snapshot.hasError) {
                return showSnackBar(context, "Something went wrong");
              } else if (snapshot.hasData) {
                // return VerifyEmailPage();
                return  Home();
              } else {
                return  Login();
              }
            },
          )
          // theme: ThemeData.dark(),
          ),
    );
  }
}
