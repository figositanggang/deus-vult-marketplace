import 'package:code_project/Widget.dart';
import 'package:code_project/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    final settingProv = Provider.of<SettingScreenProvider>(context);

    return HomeContainer(
      context: context,
      gradient: false,
      bgColor: primaryColor(context),
      child: Scaffold(
        backgroundColor: Colors.white.withOpacity(.2),
        appBar: MyAppBar(
          context,
          title: Text("Settings"),
          bgColor: Colors.transparent,
          foreColor: Colors.white,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // ListTile(
              //   tileColor: Colors.white.withOpacity(.5),
              //   title: Text("Ganti Warna Primary"),
              //   trailing: Container(
              //     decoration: BoxDecoration(color: settingProv.color),
              //     width: 25,
              //     height: 25,
              //   ),
              //   onTap: () {
              //     _showColorPicker(context, settingProv);
              //   },
              // ),
              SizedBox(height: 1),
              FutureBuilder(
                future: settingProv.readDark(),
                builder: (context, snapshot) {
                  return ListTile(
                    tileColor: Colors.white.withOpacity(.5),
                    title: Text("Dark Mode"),
                    trailing: Switch(
                      value: snapshot.data ?? settingProv.dark,
                      onChanged: (val) async {
                        await settingProv.saveDark(val);
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  // _showColorPicker(BuildContext context, SettingScreenProvider provider) {
  //   showDialog(
  //     context: context,
  //     builder: (context) {
  //       return AlertDialog(
  //         content: SingleChildScrollView(
  //           child: ColorPicker(
  //             pickerColor: provider.color,
  //             onColorChanged: (val) {},
  //           ),
  //         ),
  //         actions: [
  //           ElevatedButton(
  //             onPressed: () {
  //               setState(() {});
  //               Navigator.pop(context);
  //             },
  //             child: Text("OK"),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }
}

class SettingScreenProvider extends ChangeNotifier {
  String key = "color";
  Color _color = Color.fromARGB(255, 19, 153, 151);
  Color get color => this._color;

  String key2 = "dark";
  bool _dark = false;
  bool get dark => this._dark;

  Future<bool?> readDark() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    return await preferences.getBool(key2);
  }

  Future<bool?> saveDark(bool val) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    this._dark = val;
    notifyListeners();

    return await preferences.setBool(key2, val);
  }
}
