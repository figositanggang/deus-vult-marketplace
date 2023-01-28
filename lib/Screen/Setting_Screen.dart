import 'package:code_project/Bottom%20Navigation%20Screen/Home%20Screen/Provider/locale_provider.dart';
import 'package:code_project/Widget.dart';
import 'package:code_project/main.dart';
import 'package:flutter/material.dart';
import 'package:localization/localization.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

enum Language { English, Indonesia }

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    final settingProv = Provider.of<SettingScreenProvider>(context);
    final localeProvider = Provider.of<LocaleProvider>(context);

    return HomeContainer(
      context: context,
      gradient: false,
      bgColor: primaryColor(context),
      child: Scaffold(
        backgroundColor: Colors.white.withOpacity(.2),
        appBar: MyAppBar(
          context,
          title: Text("Settings".i18n()),
          bgColor: Colors.transparent,
          foreColor: Colors.white,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              FutureBuilder(
                future: settingProv.readDark(),
                builder: (context, snapshot) {
                  return ListTile(
                    tileColor: Colors.white.withOpacity(.5),
                    title: Text("Dark Mode".i18n()),
                    trailing: Switch(
                      value: snapshot.data ?? settingProv.dark,
                      onChanged: (val) async {
                        await settingProv.saveDark(val);
                      },
                    ),
                  );
                },
              ),
              Divider(height: 1),
              FutureBuilder(
                future: settingProv.readDark(),
                builder: (context, snapshot) {
                  return ListTile(
                    tileColor: Colors.white.withOpacity(.5),
                    title: Text("Language".i18n()),
                    trailing: FutureBuilder(
                      future: localeProvider.readLocale(),
                      builder: (context, snapshot) {
                        return TextButton(
                          child: snapshot.data == true
                              ? Text("English".i18n())
                              : Text("Indonesia"),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return _dialog(settingProv, localeProvider);
                              },
                            );
                          },
                        );
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

  _dialog(
      SettingScreenProvider settingProvider, LocaleProvider localeProvider) {
    return AlertDialog(
      title: Text("Language".i18n()),
      content: SizedBox(
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FutureBuilder(
              future: localeProvider.readLocale(),
              builder: (context, snapshot) {
                return RadioListTile<Language>(
                  title: Text("English".i18n()),
                  value: Language.English,
                  groupValue: snapshot.data == true
                      ? Language.English
                      : Language.Indonesia,
                  onChanged: (Language? value) async {
                    await localeProvider.saveLocale(true);
                    settingProvider.language = value;
                  },
                );
              },
            ),
            FutureBuilder(
              future: localeProvider.readLocale(),
              builder: (context, snapshot) {
                return RadioListTile<Language>(
                  title: Text("Indonesia"),
                  value: Language.Indonesia,
                  groupValue: snapshot.data == true
                      ? Language.English
                      : Language.Indonesia,
                  onChanged: (Language? value) async {
                    await localeProvider.saveLocale(false);
                    settingProvider.language = value;
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SettingScreenProvider extends ChangeNotifier {
  String keyColor = "color";
  Color _color = Color.fromARGB(255, 19, 153, 151);
  Color get color => this._color;

  String keyDark = "dark";
  bool _dark = false;
  bool get dark => this._dark;

  Future<bool?> readDark() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    return await preferences.getBool(keyDark);
  }

  Future<bool?> saveDark(bool val) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    this._dark = val;
    notifyListeners();

    return await preferences.setBool(keyDark, val);
  }

  Language _language = Language.English;
  Language get language => this._language;

  set language(value) {
    this._language = value;
    notifyListeners();
  }
}
