import 'package:code_project/Bottom%20Navigation%20Screen/Home%20Screen/Navigation/Kategori_Navigation.dart';
import 'package:code_project/Bottom%20Navigation%20Screen/Home%20Screen/Provider/search_provider.dart';
import 'package:code_project/Screen/Product_Screen.dart';
import 'package:code_project/Widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchNavigation extends StatefulWidget {
  const SearchNavigation({Key? key}) : super(key: key);

  @override
  State<SearchNavigation> createState() => _SearchNavigationState();
}

class _SearchNavigationState extends State<SearchNavigation> {
  @override
  Widget build(BuildContext context) {
    final _prov = Provider.of<HomeSearchProvider>(context);

    return HomeContainer(
      context: context,
      child: Scaffold(
        appBar: MyAppBar(
          context,
          leading: IconButton(
            onPressed: () {
              _prov.controller = "";
              Navigator.pop(context);
            },
            icon: Icon(Icons.close),
          ),
          title: TextFormField(
            controller: _prov.controller,
            onChanged: (val) {
              _prov.controller = val;
            },
          ),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: FutureBuilder(
              future: _searching(_prov),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done &&
                    snapshot.hasData) {
                  if (snapshot.data is String) {
                    return Text(snapshot.data.toString());
                  }
                  return Column(
                    children: List.generate(
                      snapshot.data.length,
                      (index) {
                        var data = snapshot.data[index];

                        return ProductCard(
                          context,
                          data: data,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      ProductScreen(product: data),
                                ));
                          },
                        );
                      },
                    ),
                  );
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return CircularProgressIndicator();
                }
                return Text("Barang Tidak Ditemukan");
              },
            ),
          ),
        ),
      ),
    );
  }

  Future _searching(HomeSearchProvider provider) async {
    var search = await provider.controller.text;
    List result = [];
    for (var i = 0; i < allModel.allModel.length; i++) {
      Map<String, dynamic> data = await allModel.allModel[i];

      if (search.length > 0) {
        if (data['name'].contains(search)) {
          print("Ada");
          provider.found.add(data);
          return provider.found;
        } else {
          print("Takde");
        }
      } else {
        provider.found.clear();
        return "Cari Barang";
      }
    }
  }
}
