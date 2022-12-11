import 'package:cached_network_image/cached_network_image.dart';
import 'package:code_project/Bottom%20Navigation%20Screen/Home%20Screen/Home_Screen.dart';
import 'package:code_project/Widget.dart';
import 'package:code_project/main.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckOutScreen extends StatefulWidget {
  final Map product;
  const CheckOutScreen({super.key, required this.product});

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final checkOutProv = Provider.of<CheckoutProvider>(context);
    final product = widget.product;

    return HomeContainer(
      bgColor: primaryColor(context),
      context: context,
      height: MediaQuery.of(context).size.height,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: MyAppBar(
          context,
          title: Text("Checkout"),
          bgColor: Colors.transparent,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              children: [
                // =================== Preview
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      color: Colors.black.withOpacity(.1),
                      child: Text(
                        "Preview",
                        style: TextStyle(fontSize: 20),
                      ),
                      alignment: Alignment.topLeft,
                    ),
                    Divider(),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          CachedNetworkImage(
                            imageUrl: product['image'],
                            fadeInCurve: Curves.easeInOutCirc,
                            width: MediaQuery.of(context).size.width / 3,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(product['name'],
                                  style: TextStyle(fontSize: 16)),
                              Text("IDR ${format.format(product['harga'])}"),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                // ======================== Metode Pembayaran
                Form(
                  key: _key,
                  child: Column(
                    children: [
                      SizedBox(height: 30),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        color: Colors.black.withOpacity(.1),
                        child: Text(
                          "Metode Pembayaran",
                          style: TextStyle(fontSize: 20),
                        ),
                        alignment: Alignment.topLeft,
                      ),
                      Divider(),
                      Container(
                        width: MediaQuery.of(context).size.width / 1.25,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Data",
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                            SizedBox(height: 10),

                            // Nomor Kartu
                            MyTextInput(
                              textEditingController: checkOutProv.nomor,
                              type: TextInputType.numberWithOptions(
                                  decimal: false),
                              subtitle: checkOutProv == ""
                                  ? "Kode"
                                  : "Kode ${checkOutProv.metode}",
                              onChanged: (val) {
                                checkOutProv.nomor = val;
                              },
                              enabled:
                                  checkOutProv.metode.length > 0 ? true : false,
                            ),

                            SizedBox(height: 15),
                            // Alamat
                            MyTextInput(
                              textEditingController: checkOutProv.alamat,
                              type: TextInputType.name,
                              subtitle: "Alamat",
                              onChanged: (val) {
                                checkOutProv.alamat = val;
                              },
                            ),

                            SizedBox(height: 15),
                            // Metode Pembayaran
                            Align(
                              alignment: Alignment.bottomRight,
                              child: _Pembayaran(checkOutProv),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomSheet: Container(
          width: MediaQuery.of(context).size.width,
          height: 50,
          decoration: BoxDecoration(color: primaryColor(context)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                child: Text("Bayar Sekarang"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 0, 225, 255),
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                ),
                onPressed: () {
                  if (_key.currentState!.validate()) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content: Text("Pembayaran Berhasil"),
                          actions: [
                            MyPrimaryTextButton(
                              text: "OK",
                              onPressed: () =>
                                  Navigator.pushNamedAndRemoveUntil(
                                      context, "/", (route) => false),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _Pembayaran(CheckoutProvider provider) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        value: provider.metode == "" ? null : provider.metode,
        hint: Text("Metode Pembayaran"),
        items: List.generate(provider.items.length, (index) {
          var data = provider.items[index];
          return DropdownMenuItem<String>(
            value: data,
            child: Text(data),
          );
        }),
        onChanged: (value) {
          provider.metode = value as String;
        },
      ),
    );
  }
}

class CheckoutProvider extends ChangeNotifier {
  TextEditingController _nomor = TextEditingController();
  TextEditingController get nomor => this._nomor;

  set nomor(value) {
    this._nomor.text = value;
    this._nomor.selection = TextSelection.fromPosition(
        TextPosition(offset: this._nomor.text.length));
    notifyListeners();
  }

  TextEditingController _alamat = TextEditingController();
  TextEditingController get alamat => this._alamat;

  set alamat(value) {
    this._alamat.text = value;
    this._alamat.selection = TextSelection.fromPosition(
        TextPosition(offset: this._alamat.text.length));
    notifyListeners();
  }

  List<String> items = [
    "COD (Cash On Delivery)",
    "Alfamart",
    "Indomaret",
    "Alfamidi",
    "BANK",
  ];
  String _metode = "";
  String get metode => this._metode;

  set metode(String value) {
    this._metode = value;
    notifyListeners();
  }
}
