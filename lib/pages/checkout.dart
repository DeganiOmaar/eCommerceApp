import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test3/provider/cart.dart';
import 'package:test3/shared/appbar.dart';
import 'package:test3/shared/colors.dart';

class CheckOut extends StatelessWidget {
  const CheckOut({super.key});

  @override
  Widget build(BuildContext context) {
    final classInstancee = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appbarGreen,
        title: const Text("Check out"),
        actions: const [
          ProductAndPrice(),
        ],
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            child: SizedBox(
              height: 550,
              child: ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: classInstancee.selectedProduct.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: ListTile(
                        subtitle: Text(
                            "\$ ${classInstancee.selectedProduct[index].price} -  ${classInstancee.selectedProduct[index].loaction}"),
                        leading: CircleAvatar(
                          backgroundImage: AssetImage(
                              classInstancee.selectedProduct[index].imgPath),
                        ),
                        title: Text(
                            "${classInstancee.selectedProduct[index].name} "),
                        trailing: IconButton(
                            onPressed: () {
                              classInstancee.delete(
                                  classInstancee.selectedProduct[index]);
                            },
                            icon: const Icon(Icons.delete)),
                      ),
                    );
                  }),
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(bTNpink),
              padding: MaterialStateProperty.all(const EdgeInsets.all(12)),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8))),
            ),
            child: Text(
              "Pay \$${classInstancee.price}",
              style: const TextStyle(fontSize: 19),
            ),
          ),
        ],
      ),
    );
  }
}
