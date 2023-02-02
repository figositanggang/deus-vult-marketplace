import 'package:code_project/Bottom%20Navigation%20Screen/Home%20Screen/Home_Screen.dart';
import 'package:code_project/Bottom%20Navigation%20Screen/Home%20Screen/Provider/scroll_provider.dart';
import 'package:code_project/Bottom%20Navigation%20Screen/Home%20Screen/Provider/search_provider.dart';
import 'package:code_project/Bottom%20Navigation%20Screen/Profile%20Screen/Profile_Screen.dart';
import 'package:code_project/Bottom%20Navigation%20Screen/Search%20Screen/Search_Screen.dart';

import 'package:code_project/main.dart';
import 'package:code_project/notification_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<Widget> body = [
    HomeScreen(),
    SearchNavigation(),
    ProfileScreen(),
  ];

  @override
  void initState() {
    super.initState();

    NotificationHelper.initialize(flutterLocalNotificationsPlugin);
  }

  @override
  Widget build(BuildContext context) {
    final bottomProv = Provider.of<BottomNavProvider>(context);
    final List<IconData> icons = [
      Iconsax.home,
      Iconsax.search_normal,
      Icons.account_circle_outlined,
    ];
    final scrollProv = Provider.of<ScrollProvider>(context);
    final searchProv = Provider.of<HomeSearchProvider>(context);

    return Scaffold(
      body: body[bottomProv.index],
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(color: Colors.transparent),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(icons.length, (index) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: bottomProv.index == index
                    ? Colors.black.withOpacity(.25)
                    : Colors.transparent,
              ),
              child: InkWell(
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Icon(
                    icons[index],
                    color: bottomProv.index == index
                        ? Colors.white
                        : Color.fromARGB(255, 77, 77, 77),
                  ),
                ),
                onTap: () async {
                  bottomProv.setIndex = await index;
                  if (index == 0 && scrollProv.scrollController.offset > 0) {
                    try {
                      scrollProv.scrollTop();
                      searchProv.found.clear();
                    } catch (e) {}
                  } else if (index == 2) {
                    searchProv.found.clear();
                  }
                  throw Exception();
                },
              ),
            );
          }),
        ),
      ),
      backgroundColor: primaryColor(context),
    );
  }
}

// Provider
class BottomNavProvider extends ChangeNotifier {
  int _index = 0;
  int get index => _index;
  set setIndex(val) {
    _index = val;
    notifyListeners();
  }
}
