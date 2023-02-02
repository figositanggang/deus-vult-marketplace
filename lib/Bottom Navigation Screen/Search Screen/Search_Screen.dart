import 'package:code_project/Bottom%20Navigation%20Screen/Home%20Screen/Navigation/Kategori_Navigation.dart';
import 'package:code_project/Bottom%20Navigation%20Screen/Home%20Screen/Provider/search_provider.dart';
import 'package:code_project/Screen/Product_Screen.dart';
import 'package:code_project/Widget.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:iconsax/iconsax.dart';
import 'package:localization/localization.dart';

import 'package:provider/provider.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class SearchNavigation extends StatefulWidget {
  const SearchNavigation({Key? key}) : super(key: key);

  @override
  State<SearchNavigation> createState() => _SearchNavigationState();
}

class _SearchNavigationState extends State<SearchNavigation> {
  late BannerAd bannerAd;
  bool isBannerAdReady = false;

  late stt.SpeechToText speechToText;
  bool isListening = false;

  @override
  void initState() {
    super.initState();

    speechToText = stt.SpeechToText();

    loadBanner();
  }

  @override
  Widget build(BuildContext context) {
    final _prov = Provider.of<HomeSearchProvider>(context);

    return HomeContainer(
      context: context,
      gradient: true,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: MyAppBar(
          context,
          elevation: 0,
          bgColor: Colors.transparent,
          spacing: 20,
          title: TextFormField(
            controller: _prov.controller,
            decoration: InputDecoration(
              labelText: "${"Search".i18n()}...",
            ),
            onChanged: (val) async {
              _prov.controller = await val;
              _searching(_prov);
            },
            autofocus: false,
          ),
          actions: [
            IconButton(
              padding: EdgeInsets.zero,
              tooltip: "Find Stuff".i18n(),
              onPressed: () {
                _prov.controller = "";
              },
              icon: Icon(Icons.close_rounded),
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                future: _searching(_prov),
                builder: (context, snapshot) {
                  var data = snapshot.data;

                  if (_prov.controller.text.length == 0) {
                    return Center(
                        child: Text("Please search for items".i18n()));
                  } else if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData && data.length != 0) {
                      return GridView.count(
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: .78,
                        children: List.generate(data.length, (index) {
                          var _data = data[index];

                          return ProductCard(
                            context,
                            data: _data,
                            onTap: () {
                              FocusScope.of(context).unfocus();
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    ProductScreen(product: _data),
                              ));
                            },
                          );
                        }),
                      );
                    }
                    return Center(child: Text("Item Not Found".i18n()));
                  } else if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  return Center(
                    child: Text("Ada Error"),
                  );
                },
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              child: isBannerAdReady
                  ? Container(
                      width: bannerAd.size.width.toDouble(),
                      height: bannerAd.size.height.toDouble(),
                      child: AdWidget(ad: bannerAd),
                    )
                  : Text("Iklan"),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            listen(_prov);
          },
          child: Icon(isListening ? Iconsax.microphone : Icons.mic_off),
        ),
      ),
    );
  }

  Future _searching(HomeSearchProvider provider) async {
    var search = await provider.controller.text;

    if (search.length > 0 && RegExp(r'^[A-Za-z0-9_.]+$').hasMatch(search)) {
      return await allModel.allModel
          .where((element) =>
              element['name'].toLowerCase().contains(search.toLowerCase()))
          .toList();
    } else {
      return [];
    }
  }

  void loadBanner() async {
    bannerAd = await BannerAd(
      size: AdSize.banner,
      adUnitId: "ca-app-pub-3940256099942544/6300978111",
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          print("Loaded");
          setState(() {
            isBannerAdReady = true;
          });
        },
        onAdFailedToLoad: (ad, error) {
          setState(() {
            isBannerAdReady = false;
          });
          ad.dispose();
        },
      ),
      request: AdRequest(),
    );

    bannerAd.load();
  }

  void listen(HomeSearchProvider provider) async {
    if (!isListening) {
      bool available = false;
      await speechToText.initialize();
      available = true;

      if (available) {
        setState(() {
          isListening = true;
        });
        speechToText.listen(
          onResult: (result) {
            provider.controller = result.recognizedWords;
            setState(() {
              isListening = false;
            });
          },
        );
      }
    } else {
      setState(() {
        isListening = false;
      });
      speechToText.stop();
    }
  }
}
