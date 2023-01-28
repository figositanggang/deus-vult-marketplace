import 'package:code_project/Firebase/auth_helper.dart';
import 'package:code_project/Screen/SignUp_Screen.dart';
import 'package:code_project/Widget.dart';
import 'package:code_project/database/dbHelper.dart';
import 'package:code_project/database/user_class.dart';
import 'package:code_project/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditDataScreen extends StatefulWidget {
  const EditDataScreen({super.key});

  @override
  State<EditDataScreen> createState() => _EditDataScreenState();
}

class _EditDataScreenState extends State<EditDataScreen> {
  final key = GlobalKey<FormState>();
  AuthHelper authHelper = AuthHelper();

  @override
  Widget build(BuildContext context) {
    final signUpProv = Provider.of<SignUpScreenProvider>(context);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: primaryColor(context),
      appBar: AppBar(
        foregroundColor: Colors.white,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.close, size: 30),
          )
        ],
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Align(
          alignment: Alignment.center,
          child: HomeContainer(
            context: context,
            gradient: false,
            width: MediaQuery.of(context).size.width / 1.25,
            child: Column(
              children: [
                Image.network(
                  "https://res.cloudinary.com/angelo-della-morte-company/image/upload/v1664288499/Deus%20Vult%20MarketPlace/deus_vult_ldopaf.png",
                  width: 200,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Edit Data",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Form(
                  key: key,
                  child: Column(
                    children: [
                      // ======== Name ========
                      MyTextInput(
                        textEditingController: signUpProv.name,
                        type: TextInputType.name,
                        subtitle: "Name",
                        onChanged: (val) {
                          signUpProv.name = val;
                        },
                      ),
                      SizedBox(height: 15),

                      SizedBox(height: 20),
                      Align(
                        alignment: Alignment.centerRight,
                        child: MyPrimaryTextButton(
                          text: "Edit",
                          padding: EdgeInsets.symmetric(horizontal: 30),
                          elevation: 1,
                          onPressed: () async {
                            if (key.currentState!.validate()) {
                              authHelper.updateData(
                                context,
                                name: signUpProv.name.text,
                              );
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> addToDatabase(SignUpScreenProvider provider, String id) async {
    DBHelper().insertUser(
      UserClass(
        id: id,
        name: provider.name.text,
        email: provider.email.text,
        password: provider.password.text,
      ),
    );
  }
}
