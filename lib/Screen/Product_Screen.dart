import 'package:cached_network_image/cached_network_image.dart';
import 'package:code_project/Bottom%20Navigation%20Screen/Home%20Screen/Home_Screen.dart';
import 'package:code_project/Screen/Checkout_Screen.dart';
import 'package:code_project/Widget.dart';

import 'package:flutter/material.dart';
import 'package:localization/localization.dart';
import 'package:url_launcher/url_launcher.dart';

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
  String get spec => product['spec'];

  @override
  Widget build(BuildContext context) {
    return HomeContainer(
      context: context,
      gradient: false,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
        appBar: MyAppBar(
          context,
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
                      Align(
                        alignment: Alignment.bottomRight,
                        child: ElevatedButton(
                          onPressed: _launcUrl,
                          child: Text("More Info".i18n()),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            MyPrimaryTextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CheckOutScreen(product: product),
                  ),
                );
              },
              padding: EdgeInsets.symmetric(horizontal: 10),
              text: "Buy Now".i18n(),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _launcUrl() async {
    final uri = await Uri.parse(spec);
    try {
      await launchUrl(uri);
    } catch (e) {
      print(e);
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text("Link Rusak"),
            actions: [
              MySecondaryTextButton(
                text: "Back",
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        },
      );
    }
  }
}
