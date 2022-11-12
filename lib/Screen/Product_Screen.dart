import 'package:cached_network_image/cached_network_image.dart';
import 'package:code_project/Bottom%20Navigation%20Screen/Home%20Screen/Home_Screen.dart';
import 'package:code_project/Widget.dart';

import 'package:flutter/material.dart';

class ProductScreen extends StatefulWidget {
  final Map product;

  const ProductScreen({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  get product => widget.product;
  Map<String, String> get spec => product['spec'];

  @override
  Widget build(BuildContext context) {
    return HomeContainer(
      context: context,
      gradient: false,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
        appBar: MyAppBar(
          leading: SizedBox(),
          elevation: 0,
          bgColor: Colors.transparent,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.close_rounded),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 32.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CachedNetworkImage(
                  imageUrl: product['image'],
                  fadeInCurve: Curves.easeInOutCirc,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product['name'],
                        style: TextStyle(fontSize: 30),
                      ),
                      Text(
                        "IDR ${format.format(product['harga'])}",
                        style: TextStyle(fontSize: 15),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: List.generate(spec.length, (index) {
                          return Text(
                            spec.keys.toString(),
                          );
                        }),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
