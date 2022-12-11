import 'package:flutter/cupertino.dart';

class RekomendasiModelClass extends ChangeNotifier {
  List<Map> _rekomendasi = [
    {
      "name": "Keyboard Steelseries Apex 5",
      "image":
          "https://res.cloudinary.com/angelo-della-morte-company/image/upload/v1665323189/Deus%20Vult%20MarketPlace/accessories/Steelseries_Apex_5_fj07pv.png",
      "harga": 1834731.09,
      "spec": "https://steelseries.com/gaming-keyboards/apex-5",
      "kategori": "Accessories",
    },
    {
      "name": "Sony ZV-1",
      "image":
          "https://res.cloudinary.com/angelo-della-morte-company/image/upload/v1665323199/Deus%20Vult%20MarketPlace/camera/Sony_ZV-1_celwrg.png",
      "harga": 10698000,
      "spec":
          "https://www.sony.co.id/id/electronics/cyber-shot-compact-camera/zv-1",
      "kategori": "Camera",
    },
    {
      "name": "MSI Modern 14",
      "image":
          "https://res.cloudinary.com/angelo-della-morte-company/image/upload/v1665323193/Deus%20Vult%20MarketPlace/computer/MSI_Modern_14_jqsvwm.png",
      "harga": 9300000,
      "spec":
          "https://www.google.com/aclk?sa=l&ai=DChcSEwiym7ej5bn7AhVdmWYCHZp7CkMYABADGgJzbQ&sig=AOD64_03tfEGDGb7-FtRWMmgkprxKEVr6w&q&adurl&ved=2ahUKEwiR76-j5bn7AhWdILcAHe5VAHkQ0Qx6BAgMEAM",
      "kategori": "Computer",
    },
    {
      "name": "Arashi AR 118 SDW Kipas Angin 3in1 18 inch",
      "image":
          "https://res.cloudinary.com/angelo-della-morte-company/image/upload/v1665323157/Deus%20Vult%20MarketPlace/kipas%20angin/Arashi_AR_118_SDW_Kipas_Angin_3in1_18_inch_bmsyya.png",
      "harga": 255000,
      "spec":
          "https://www.blibli.com/p/arashi-ar-118-sdw-kipas-angin-3in1-18-inch/ps--SEB-60059-00136",
      "kategori": "Kipas Angin",
    },
    {
      "name": "MESIN CUCI TABUNG KG PORTABLE TOP LOADING ARASHI AWM 451A",
      "image":
          "https://res.cloudinary.com/angelo-della-morte-company/image/upload/v1665323162/Deus%20Vult%20MarketPlace/mesin%20cuci/MESIN_CUCI_1_TABUNG_4.5_KG_PORTABLE_TOP_LOADING_ARASHI_AWM_451A_eas1vb.png",
      "harga": 615000,
      "spec":
          "https://www.tokopedia.com/nadhifahsho/mesin-cuci-1-tabung-4-5-kg-portable-top-loading-arashi-awm-451a",
      "kategori": "Mesin Cuci",
    },
    {
      "name": "Vivo T1 Pro 5G",
      "image":
          "https://res.cloudinary.com/angelo-della-morte-company/image/upload/v1665323169/Deus%20Vult%20MarketPlace/smartphones/Vivo_T1_Pro_5G_a6qqtb.png",
      "harga": 3130000,
      "spec": "https://www.vivo.com/id/products/t1pro5g",
      "kategori": "Smartphone",
    },
  ];
  List<Map> get rekomendasi => this._rekomendasi;

  set rekomendasi(final value) {
    this._rekomendasi = value;
    notifyListeners();
  }
}
