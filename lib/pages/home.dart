// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test3/model/item.dart';
import 'package:test3/pages/checkout.dart';
import 'package:test3/pages/details_screen.dart';
import 'package:test3/pages/profilepage.dart';
import 'package:test3/provider/cart.dart';
import 'package:test3/shared/appbar.dart';
import 'package:test3/shared/colors.dart';
import 'package:test3/shared/user_img_from_firestore.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final classInstancee = Provider.of<Cart>(context);
    // final userrr = FirebaseAuth.instance.currentUser; //tnajem tekhou menou données gmail
    return Scaffold(
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                UserAccountsDrawerHeader(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/img/test.jpg"),
                          fit: BoxFit.cover),
                    ),
                    accountName: Text("Sy Omar",
                        style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                        )),
                    accountEmail: Text("Laamyr@gmail.com"),
                    currentAccountPictureSize: Size.square(60),
                    currentAccountPicture: ImgUser()),
                ListTile(
                    title: Text("Home"),
                    leading: Icon(Icons.home),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Home(),
                        ),
                      );
                    }),
                ListTile(
                    title: Text("My products"),
                    leading: Icon(Icons.add_shopping_cart),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CheckOut(),
                        ),
                      );
                    }),
                ListTile(
                    title: Text("About"),
                    leading: Icon(Icons.help_center),
                    onTap: () {}),
                ListTile(
                  title: Text("Profile Page"),
                  leading: Icon(Icons.person),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProfilePage()),
                    );
                  },
                ),
                ListTile(
                    title: Text("Logout"),
                    leading: Icon(Icons.exit_to_app),
                    onTap: () async {
                      await FirebaseAuth.instance.signOut();
                    }),
              ],
            ),
            Container(
              margin: EdgeInsets.only(bottom: 12),
              child: Text("Developed by Sy Omar © 2023",
                  style: TextStyle(fontSize: 16)),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: appbarGreen,
        title: Text("Home"),
        actions: const [
          ProductAndPrice(),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 22.0),
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 33),
            itemCount: items.length,
            itemBuilder: (BuildContext context, int index) {
              return GridTile(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Details(
                          product: Item(
                              name: items[index].name,
                              imgPath: items[index].imgPath,
                              price: items[index].price,
                              loaction: items[index].loaction),
                        ),
                      ),
                    );
                  },
                  // use ClipRRect & Positioned
                  child: Image.asset(items[index].imgPath),
                ),
                footer: GridTileBar(
                  // backgroundColor: Color.fromARGB(66, 73, 127, 110),
                  trailing: IconButton(
                      color: Color.fromARGB(255, 62, 94, 70),
                      onPressed: () {
                        classInstancee.add(items[index]);
                      },
                      icon: Icon(Icons.add)),

                  leading: Text("\$ ${items[index].price}"),

                  title: Text(
                    "",
                  ),
                ),
              );
            }),
      ),
    );
  }
}
