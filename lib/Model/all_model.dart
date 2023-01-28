import 'package:flutter/cupertino.dart';

class AllModelClass extends ChangeNotifier {
  List<Map<String, dynamic>> _allModel = [
    {
      "name": "Keyboard Steelseries Apex 5",
      "image":
          "https://res.cloudinary.com/angelo-della-morte-company/image/upload/v1665323189/Deus%20Vult%20MarketPlace/accessories/Steelseries_Apex_5_fj07pv.png",
      "harga": 1834731.09,
      "spec": "https://steelseries.com/gaming-keyboards/apex-5",
      "kategori": "Accessories",
    },
    {
      "name": "Speaker JBL Flip 5",
      "image":
          "https://res.cloudinary.com/angelo-della-morte-company/image/upload/v1665323182/Deus%20Vult%20MarketPlace/accessories/JBL_Flip_5_arb8fl.png",
      "harga": 2199000.00,
      "spec": "https://id.jbl.com/bluetooth-portables/JBL+FLIP+5-.html",
      "kategori": "Accessories",
    },
    {
      "name": "SVEN Mousepad Gaming",
      "image":
          "https://res.cloudinary.com/angelo-della-morte-company/image/upload/v1665323182/Deus%20Vult%20MarketPlace/accessories/SVEN_Mousepad_Gaming_inkj8p.png",
      "harga": 15000.00,
      "spec":
          "https://fantech.id/product/mousepad-gaming/sven-series/sven-mp35",
      "kategori": "Accessories",
    },
    {
      "name": "Headphone Sonic Gearphone 5",
      "image":
          "https://res.cloudinary.com/angelo-della-morte-company/image/upload/v1665323178/Deus%20Vult%20MarketPlace/accessories/Sonic_Gearphone_5_smkyqy.png",
      "harga": 151700,
      "spec": "https://www.pricebook.co.id/Sonicgear-Vibra-5/92/PD_00047415",
      "kategori": "Accessories",
    },
    {
      "name": "Mouse Razer Viper Ultimate Wireless",
      "image":
          "https://res.cloudinary.com/angelo-della-morte-company/image/upload/v1665323178/Deus%20Vult%20MarketPlace/accessories/Razer_Viper_Ultimate_Wireless_oicp6n.png",
      "harga": 2217151.50,
      "spec": "https://www.razer.com/gaming-mice/razer-viper-ultimate",
      "kategori": "Accessories",
    },
    {
      "name": "Nikon D3500",
      "image":
          "https://res.cloudinary.com/angelo-della-morte-company/image/upload/v1665323204/Deus%20Vult%20MarketPlace/camera/Nikon_D3500_w0mtuf.png",
      "harga": 4750000,
      "spec": "https://imaging.nikon.com/lineup/dslr/d3500/spec.htm",
      "kategori": "Camera",
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
      "name": "Canon Eos 1300d",
      "image":
          "https://res.cloudinary.com/angelo-della-morte-company/image/upload/v1665323191/Deus%20Vult%20MarketPlace/camera/Canon_Eos_1300d_qxtblw.png",
      "harga": 3300000,
      "spec": "https://iprice.co.id/harga/canon-eos-1300d/",
      "kategori": "Camera",
    },
    {
      "name": "Sony Handycam",
      "image":
          "https://res.cloudinary.com/angelo-della-morte-company/image/upload/v1665323187/Deus%20Vult%20MarketPlace/camera/Sony_Handycam_jiqfqi.png",
      "harga": 3229000,
      "spec": "https://www.sony.co.id/id/handycam/gallery",
      "kategori": "Camera",
    },
    {
      "name": "Camera Instax Mini 11",
      "image":
          "https://res.cloudinary.com/angelo-della-morte-company/image/upload/v1665323186/Deus%20Vult%20MarketPlace/camera/Camera_Instax_Mini_11_p7xhbi.png",
      "harga": 1000000,
      "spec": "https://instax.id/id/camera/mini-11",
      "kategori": "Camera",
    },
    {
      "name": "Macbook Pro 2020",
      "image":
          "https://res.cloudinary.com/angelo-della-morte-company/image/upload/v1665323203/Deus%20Vult%20MarketPlace/computer/Macbook_Pro_2020_iuuahl.png",
      "harga": 16694000,
      "spec": "https://www.apple.com/id/macbook-pro-13/",
      "kategori": "Computer",
    },
    {
      "name": "Razer Blade Pro 17",
      "image":
          "https://res.cloudinary.com/angelo-della-morte-company/image/upload/v1665323201/Deus%20Vult%20MarketPlace/computer/Razer_Blade_Pro_17_f5iho8.png",
      "harga": 31800000,
      "spec": "https://www.razer.com/gaming-laptops/razer-blade-17",
      "kategori": "Computer",
    },
    {
      "name": "Acer Aspire 5",
      "image":
          "https://res.cloudinary.com/angelo-della-morte-company/image/upload/v1665323201/Deus%20Vult%20MarketPlace/computer/Acer_Aspire_5_v1mhcv.png",
      "harga": 6550000,
      "spec":
          "https://store.acer.com/en-id/laptops/aspire-performance/aspire-5a",
      "kategori": "Computer",
    },
    {
      "name": "Asus Vivobook 14",
      "image":
          "https://res.cloudinary.com/angelo-della-morte-company/image/upload/v1665323198/Deus%20Vult%20MarketPlace/computer/Asus_Vivobook_14_zykdhv.png",
      "harga": 13922000,
      "spec":
          "https://www.asus.com/id/Laptops/For-Home/Vivobook/Vivobook-14-K413/",
      "kategori": "Computer",
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
      "name": "Steering Wheel Logitech G29",
      "image":
          "https://res.cloudinary.com/angelo-della-morte-company/image/upload/v1665323204/Deus%20Vult%20MarketPlace/gaming/Steering_Wheel_Logitech_g29_un9ifz.png",
      "harga": 4368000,
      "spec":
          "https://www.logitechg.com/id-id/products/driving/driving-force-racing-wheel.html",
      "kategori": "Gaming",
    },
    {
      "name": "Xbox X Series",
      "image":
          "https://res.cloudinary.com/angelo-della-morte-company/image/upload/v1665323204/Deus%20Vult%20MarketPlace/gaming/Xbox_X_Series_cfsvzg.png",
      "harga": 7789000,
      "spec": "https://www.xbox.com/en-US/consoles/xbox-series-x",
      "kategori": "Gaming",
    },
    {
      "name": "PlayStation 5",
      "image":
          "https://res.cloudinary.com/angelo-della-morte-company/image/upload/v1665323203/Deus%20Vult%20MarketPlace/gaming/PlayStation_5_zlptad.png",
      "harga": 8600000,
      "spec": "https://www.playstation.com/en-us/ps5/",
      "kategori": "Gaming",
    },
    {
      "name": "Nintendo Switch",
      "image":
          "https://res.cloudinary.com/angelo-della-morte-company/image/upload/v1665323203/Deus%20Vult%20MarketPlace/gaming/Nintendo_Switch_pzl4oa.png",
      "harga": 3712000,
      "spec": "https://www.nintendo.com/switch/",
      "kategori": "Gaming",
    },
    {
      "name": "Oculus Quest 2",
      "image":
          "https://res.cloudinary.com/angelo-della-morte-company/image/upload/v1665323191/Deus%20Vult%20MarketPlace/gaming/Oculus_Quest_2_lcnyyi.png",
      "harga": 4762000,
      "spec": "https://www.oculus.com/experiences/quest/",
      "kategori": "Gaming",
    },
    {
      "name": "Sharp PJ A26MY B Air Cooler",
      "image":
          "https://res.cloudinary.com/angelo-della-morte-company/image/upload/v1665323158/Deus%20Vult%20MarketPlace/kipas%20angin/Sharp_PJ-A26MY-B_Air_Cooler_dpim9a.png",
      "harga": 740000,
      "spec": "https://id.sharp/products/air-care/65-air-cooler-pj-a26my-b",
      "kategori": "Fan",
    },
    {
      "name": "Arashi AR 118 SDW Kipas Angin 3in1 18 inch",
      "image":
          "https://res.cloudinary.com/angelo-della-morte-company/image/upload/v1665323157/Deus%20Vult%20MarketPlace/kipas%20angin/Arashi_AR_118_SDW_Kipas_Angin_3in1_18_inch_bmsyya.png",
      "harga": 255000,
      "spec":
          "https://www.blibli.com/p/arashi-ar-118-sdw-kipas-angin-3in1-18-inch/ps--SEB-60059-00136",
      "kategori": "Fan",
    },
    {
      "name": "Arashi Helifan AR 28 Kipas Angin Gantung 15 Watt",
      "image":
          "https://res.cloudinary.com/angelo-della-morte-company/image/upload/v1665323157/Deus%20Vult%20MarketPlace/kipas%20angin/Arashi_Helifan_AR-28_Kipas_Angin_Gantung_-_15_Watt_g9zual.png",
      "harga": 50000,
      "spec":
          "https://www.blibli.com/p/arashi-helifan-ar-28-kipas-angin-gantung-15-watt-small-40-cm/ps--BPS-60023-00119",
      "kategori": "Fan",
    },
    {
      "name": "SANEX DESK FAN KIPAS ANGIN FD 1287 FD 1287 12 INCH",
      "image":
          "https://res.cloudinary.com/angelo-della-morte-company/image/upload/v1665323157/Deus%20Vult%20MarketPlace/kipas%20angin/SANEX_DESK_FAN_KIPAS_ANGIN_FD-1287_FD_1287_12_INCH_xj11co.png",
      "harga": 134000,
      "spec":
          "https://shopee.co.id/Kipas-Angin-Duduk-Sanex-12-inch-FD-1287-Desk-Fan-SNI-i.134613840.2027322441",
      "kategori": "Fan",
    },
    {
      "name": "KIPAS ANGIN MIYAKO kas 1607",
      "image":
          "https://res.cloudinary.com/angelo-della-morte-company/image/upload/v1665323157/Deus%20Vult%20MarketPlace/kipas%20angin/KIPAS_ANGIN_MIYAKO_kas_1607_elcurs.png",
      "harga": 300000,
      "spec": "https://www.miyako.co.id/electric-fan-miyako-kas-1607/",
      "kategori": "Fan",
    },
    {
      "name": "Mesin Cuci Samsung Front Load 8Kg",
      "image":
          "https://res.cloudinary.com/angelo-della-morte-company/image/upload/v1665323163/Deus%20Vult%20MarketPlace/mesin%20cuci/Mesin_Cuci_Samsung_Front_Load_8kg_m7hh7z.png",
      "harga": 5949000,
      "spec":
          "https://www.samsung.com/id/washers-and-dryers/washing-machines/front-load-8kg-white-ww80j42g0iw-se/",
      "kategori": "Washing Machine",
    },
    {
      "name": "POLYTRON Mesin Cuci Tabung Samba Series KG PWM 8363P",
      "image":
          "https://res.cloudinary.com/angelo-della-morte-company/image/upload/v1665323163/Deus%20Vult%20MarketPlace/mesin%20cuci/POLYTRON_Mesin_Cuci_2_Tabung_Samba_Series_8_KG_-_PWM_8363P_m9hubm.png",
      "harga": 1500000,
      "spec": "https://iprice.co.id/harga/polytron-pwm-8363/",
      "kategori": "Washing Machine",
    },
    {
      "name": "MESIN CUCI SHARP ES-T90MW 8Kg",
      "image":
          "https://res.cloudinary.com/angelo-della-morte-company/image/upload/v1665323162/Deus%20Vult%20MarketPlace/mesin%20cuci/MESIN_CUCI_SHARP_ES-T90MW_8KG_bs819h.png",
      "harga": 1300000,
      "spec":
          "https://www.bhinneka.com/sharp-mesin-cuci-top-load-es-t90mw-pk-sku3324404371",
      "kategori": "Washing Machine",
    },
    {
      "name": "MESIN CUCI TABUNG KG PORTABLE TOP LOADING ARASHI AWM 451A",
      "image":
          "https://res.cloudinary.com/angelo-della-morte-company/image/upload/v1665323162/Deus%20Vult%20MarketPlace/mesin%20cuci/MESIN_CUCI_1_TABUNG_4.5_KG_PORTABLE_TOP_LOADING_ARASHI_AWM_451A_eas1vb.png",
      "harga": 615000,
      "spec":
          "https://www.tokopedia.com/nadhifahsho/mesin-cuci-1-tabung-4-5-kg-portable-top-loading-arashi-awm-451a",
      "kategori": "Washing Machine",
    },
    {
      "name": "MITO Mesin Cuci Portable Wm-1",
      "image":
          "https://res.cloudinary.com/angelo-della-morte-company/image/upload/v1665323161/Deus%20Vult%20MarketPlace/mesin%20cuci/MITO_Mesin_Cuci_Portable_WM-1_xvms3q.png",
      "harga": 600000,
      "spec": "https://www.tokopedia.com/find/mesin-cuci-portable-mito",
      "kategori": "Washing Machine",
    },
    {
      "name": "Setrika Miyako El 1000M",
      "image":
          "https://res.cloudinary.com/angelo-della-morte-company/image/upload/v1665323173/Deus%20Vult%20MarketPlace/setrika/Setrika_Miyako_EI_-_1000_M_zwybjj.png",
      "harga": 195000,
      "spec": "https://www.tokopedia.com/find/setrika-miyako-el-1000",
      "kategori": "Iron",
    },
    {
      "name": "Setrika Maspion HA 110",
      "image":
          "https://res.cloudinary.com/angelo-della-morte-company/image/upload/v1665323173/Deus%20Vult%20MarketPlace/setrika/SETRIKA_MASPION_HA_-_110_dq45ak.png",
      "harga": 195000,
      "spec": "https://www.tokopedia.com/find/setrika-maspion-ha-110",
      "kategori": "Iron",
    },
    {
      "name": "PHILIPS Setrika Listrik HD 1172 Classic Dry Iron",
      "image":
          "https://res.cloudinary.com/angelo-della-morte-company/image/upload/v1665323167/Deus%20Vult%20MarketPlace/setrika/PHILIPS_Setrika_Listrik_HD_1172_Classic_Dry_Iron_tyn5b3.png",
      "harga": 120000,
      "spec": "https://www.tokopedia.com/find/setrika-philips-hd1172",
      "kategori": "Iron",
    },
    {
      "name": "Philips 3000 Series Steam Iron",
      "image":
          "https://res.cloudinary.com/angelo-della-morte-company/image/upload/v1665323162/Deus%20Vult%20MarketPlace/setrika/Philips_3000_Series_Steam_Iron_ojjrn0.png",
      "harga": 270000,
      "spec": "https://www.philips.com/c-p/DST3040_76/3000-series-steam-iron",
      "kategori": "Iron",
    },
    {
      "name": "FeatherLight Setrika Uap",
      "image":
          "https://res.cloudinary.com/angelo-della-morte-company/image/upload/v1665323162/Deus%20Vult%20MarketPlace/setrika/FeatherLight_Setrika_Uap_kyoiss.png",
      "harga": 1500000,
      "spec":
          "https://www.google.com/aclk?sa=l&ai=DChcSEwietP-05rn7AhXKNSsKHSeKDEIYABAAGgJzZg&sig=AOD64_0naFAMjhEpHqwM0Bc5oFf-Lhdfmg&q&adurl&ved=2ahUKEwj4g_m05rn7AhW35nMBHWuMBzgQ0Qx6BAgKEAE",
      "kategori": "Iron",
    },
    {
      "name": "Xiaomi 11T Pro",
      "image":
          "https://res.cloudinary.com/angelo-della-morte-company/image/upload/v1665323169/Deus%20Vult%20MarketPlace/smartphones/Xiaomi_11T_Pro_cwz28y.png",
      "harga": 7324245.30,
      "spec": "https://www.mi.co.id/id/product/xiaomi-11t-pro/",
      "kategori": "Smartphone",
    },
    {
      "name": "Vivo T1 Pro 5G",
      "image":
          "https://res.cloudinary.com/angelo-della-morte-company/image/upload/v1665323169/Deus%20Vult%20MarketPlace/smartphones/Vivo_T1_Pro_5G_a6qqtb.png",
      "harga": 3130000,
      "spec": "https://www.vivo.com/id/products/t1pro5g",
      "kategori": "Smartphone",
    },
    {
      "name": "Samsung Galaxy S22 Plus",
      "image":
          "https://res.cloudinary.com/angelo-della-morte-company/image/upload/v1665323169/Deus%20Vult%20MarketPlace/smartphones/Samsung_Galaxy_S22_Plus_v96omz.png",
      "harga": 13500000,
      "spec": "https://www.samsung.com/id/smartphones/galaxy-s22/buy/",
      "kategori": "Smartphone",
    },
    {
      "name": "OPPO Find X5 Pro",
      "image":
          "https://res.cloudinary.com/angelo-della-morte-company/image/upload/v1665323169/Deus%20Vult%20MarketPlace/smartphones/OPPO_FIND_X5_Pro_yy9e79.png",
      "harga": 14954304.60,
      "spec":
          "https://www.oppo.com/id/smartphones/series-find-x/find-x5-pro/specs/",
      "kategori": "Smartphone",
    },
    {
      "name": "Apple Iphone 11 Pro Max",
      "image":
          "https://res.cloudinary.com/angelo-della-morte-company/image/upload/v1665323166/Deus%20Vult%20MarketPlace/smartphones/Apple_iPhone_11_Pro_Max_512GB_hqdny2.png",
      "harga": 11790000,
      "spec": "https://support.apple.com/kb/SP806?locale=id_ID",
      "kategori": "Smartphone",
    },
    {
      "name": "TCL LED 4K UHD ANDROID TV",
      "image":
          "https://res.cloudinary.com/angelo-della-morte-company/image/upload/v1665323184/Deus%20Vult%20MarketPlace/tv/TCL_LED_4K_UHD_ANDROID_TV_43P615_SMART_ANDROID_10.0_zxdjq9.png",
      "harga": 5000000,
      "spec":
          "https://www.google.com/aclk?sa=l&ai=DChcSEwisy4HR5rn7AhUXmWYCHd-IA4EYABAAGgJzbQ&sig=AOD64_2DicJSfGeKuzCObVLXYGMPiHfrtA&q&adurl&ved=2ahUKEwjTpPnQ5rn7AhViU3wKHatmBQMQ0Qx6BAgJEAE",
      "kategori": "Television",
    },
    {
      "name": "65 inch Class S95B OLED 4K Smart TV 2022",
      "image":
          "https://res.cloudinary.com/angelo-della-morte-company/image/upload/v1665323183/Deus%20Vult%20MarketPlace/tv/65_Class_S95B_OLED_4K_Smart_TV_2022_afyvfk.png",
      "harga": 12000000,
      "spec":
          "https://www.samsung.com/us/televisions-home-theater/tvs/oled-tvs/65-class-s95b-oled-4k-smart-tv-2022-qn65s95bafxza/",
      "kategori": "Television",
    },
    {
      "name": "LG 43 inch 4K Smart UHD TV",
      "image":
          "https://res.cloudinary.com/angelo-della-morte-company/image/upload/v1665323181/Deus%20Vult%20MarketPlace/tv/LG_43_inch_4K_Smart_UHD_TV_43UP7500_gcthn1.png",
      "harga": 5500000,
      "spec": "https://www.lg.com/id/tv/lg-43UN7300PTC",
      "kategori": "Television",
    },
    {
      "name": "Realme Smart TV 32 inch",
      "image":
          "https://res.cloudinary.com/angelo-della-morte-company/image/upload/v1665323175/Deus%20Vult%20MarketPlace/tv/REALME_SMART_TV_32_INCH_TV_43_INCH_olxqn2.png",
      "harga": 2700000,
      "spec": "https://www.realme.com/id/realme-tv",
      "kategori": "Television",
    },
    {
      "name": "POLYTRON 32 inch LED TV",
      "image":
          "https://res.cloudinary.com/angelo-della-morte-company/image/upload/v1665323173/Deus%20Vult%20MarketPlace/tv/POLYTRON_32_Inch_LED_TV_PLD_32S1503_ttfslq.png",
      "harga": 1700000,
      "spec": "https://polytron.co.id/produk/digital-tv-pld-32v1853/",
      "kategori": "Television",
    },
  ];

  List<Map<String, dynamic>> get allModel => _allModel;

  set setModel(val) {
    notifyListeners();
  }
}
