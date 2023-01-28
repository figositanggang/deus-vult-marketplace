import 'package:flutter/cupertino.dart';

class DiskonModelClass extends ChangeNotifier {
  List<Map> _DiskonModel = [
    {
      "name": "Speaker JBL Flip 5",
      "image":
          "https://res.cloudinary.com/angelo-della-morte-company/image/upload/v1665323182/Deus%20Vult%20MarketPlace/accessories/JBL_Flip_5_arb8fl.png",
      "harga": 2199000.00 - (45 / 100 * 2199000.00),
      "spec": "https://id.jbl.com/bluetooth-portables/JBL+FLIP+5-.html",
      "kategori": "Accessories",
    },
    {
      "name": "Canon Eos 1300d",
      "image":
          "https://res.cloudinary.com/angelo-della-morte-company/image/upload/v1665323191/Deus%20Vult%20MarketPlace/camera/Canon_Eos_1300d_qxtblw.png",
      "harga": 3300000 - (45 / 100 * 3300000),
      "spec": "https://iprice.co.id/harga/canon-eos-1300d/",
      "kategori": "Camera",
    },
    {
      "name": "Macbook Pro 2020",
      "image":
          "https://res.cloudinary.com/angelo-della-morte-company/image/upload/v1665323203/Deus%20Vult%20MarketPlace/computer/Macbook_Pro_2020_iuuahl.png",
      "harga": 16694000 - (45 / 100 * 16694000),
      "spec": "https://www.apple.com/id/macbook-pro-13/",
      "kategori": "Computer",
    },
  ];

  List<Map> get DiskonModel => this._DiskonModel;

  set DiskonModel(List<Map> value) {
    notifyListeners();
  }
}
