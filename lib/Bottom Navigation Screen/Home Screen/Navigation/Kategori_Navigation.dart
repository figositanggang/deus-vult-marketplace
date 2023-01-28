import 'package:code_project/Model/all_model.dart';
import 'package:code_project/Screen/Product_Screen.dart';
import 'package:code_project/Widget.dart';

import 'package:flutter/material.dart';
import 'package:localization/localization.dart';

final allModel = AllModelClass();

class KategoriNavigationScreen extends StatefulWidget {
  final Map kategori;

  const KategoriNavigationScreen({
    Key? key,
    required this.kategori,
  }) : super(key: key);

  @override
  State<KategoriNavigationScreen> createState() =>
      _KategoriNavigationScreenState();
}

class _KategoriNavigationScreenState extends State<KategoriNavigationScreen> {
  @override
  Widget build(BuildContext context) {
    final _kategoriData = allModel.allModel
        .where((element) => element['kategori'] == widget.kategori['name'])
        .toList();

    return HomeContainer(
      gradient: true,
      context: context,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: MyAppBar(
          context,
          title: Text('${widget.kategori["name"]}'.i18n()),
          bgColor: Theme.of(context).primaryColor,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              childAspectRatio: .75,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              physics: NeverScrollableScrollPhysics(),
              children: List.generate(
                _kategoriData.length,
                (index) {
                  var data = _kategoriData[index];
                  return ProductCard(
                    context,
                    data: data,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductScreen(product: data),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
