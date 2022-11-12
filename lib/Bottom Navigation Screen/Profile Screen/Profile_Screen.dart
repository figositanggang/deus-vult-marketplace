import 'package:code_project/Firebase/auth_helper.dart';
import 'package:code_project/database/dbHelper.dart';
import 'package:code_project/Widget.dart';
import 'package:code_project/database/user_class.dart';

import 'package:code_project/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  DBHelper? dbHelper;
  List<UserClass> userData = [];
  AuthHelper authHelper = AuthHelper();

  @override
  void initState() {
    super.initState();

    setState(() {
      dbHelper = DBHelper();
    });
  }

  @override
  void dispose() {
    super.dispose();

    dbHelper!.closeDB();
  }

  @override
  Widget build(BuildContext context) {
    dbHelper!.getUser().then((value) {
      setState(() {
        userData = value;
      });
    });

    return FutureBuilder(
      future: authHelper.getUser(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return HomeContainer(
            gradient: false,
            bgColor: primaryColor,
            context: context,
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: Center(
                child: SingleChildScrollView(
                  child: Container(
                    width: MediaQuery.of(context).size.width / 1.35,
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(.5),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      children: [
                        Text(snapshot.data!.displayName.toString()),
                        Text(snapshot.data!.email.toString()),
                        SizedBox(height: 10),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: MyPrimaryTextButton(
                            elevation: 1,
                            onPressed: () => Navigator.pushNamed(
                                context, "/edit-data_screen"),
                            text: "Edit",
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              floatingActionButton: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 8,
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.black,
                ),
                onPressed: () async {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: Text("Apakah anda ingin keluar?"),
                        actions: [
                          MyPrimaryTextButton(
                            text: "Ya",
                            onPressed: () async {
                              await authHelper.signOut();
                              setState(() {
                                Navigator.pop(context);
                              });
                            },
                          ),
                          MySecondaryTextButton(
                            text: "Tidak",
                            onPressed: (() => Navigator.pop(context)),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text("Sign Out"),
              ),
            ),
          );
        } else {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AlertDialog(
                alignment: Alignment.center,
                backgroundColor: Colors.white.withOpacity(.75),
                elevation: 24.0,
                actionsPadding: EdgeInsets.all(16),
                actions: [
                  MyPrimaryTextButton(
                    text: "Login",
                    elevation: 1,
                    onPressed: () =>
                        Navigator.pushNamed(context, '/login_screen'),
                  ),
                ],
                contentPadding:
                    EdgeInsets.symmetric(vertical: 16, horizontal: 10),
                content: Column(
                  children: [
                    Text("Silahkan login terlebih dahulu"),
                  ],
                ),
              ),
            ],
          );
        }
      },
    );
  }
}
