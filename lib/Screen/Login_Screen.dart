import 'package:code_project/Firebase/auth_helper.dart';
import 'package:code_project/Screen/SignUp_Screen.dart';
import 'package:code_project/Widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../main.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  AuthHelper auth = AuthHelper();

  @override
  Widget build(BuildContext context) {
    final loginProv = Provider.of<LoginScreenProvider>(context);

    return Scaffold(
      backgroundColor: primaryColor(context),
      appBar: AppBar(
        foregroundColor: Colors.white,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
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
            width: MediaQuery.of(context).size.width / 1.25,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.network(
                  "https://res.cloudinary.com/angelo-della-morte-company/image/upload/v1664288499/Deus%20Vult%20MarketPlace/deus_vult_ldopaf.png",
                  width: 200,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Login",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5),
                  ),
                ),
                SizedBox(height: 10),

                // Email
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      MyTextInput(
                        textEditingController: loginProv.email,
                        type: TextInputType.emailAddress,
                        subtitle: "Email",
                        onChanged: (val) {
                          loginProv.email = val;
                        },
                      ),
                      SizedBox(height: 15),

                      // Password
                      MyTextInput(
                        textEditingController: loginProv.password,
                        type: TextInputType.text,
                        subtitle: "Password",
                        onChanged: (val) {
                          loginProv.password = val;
                        },
                        secure: loginProv.isSecure,
                      ),

                      SizedBox(height: 20),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Column(
                          children: [
                            // Login
                            MyPrimaryTextButton(
                              text: "Login",
                              padding: EdgeInsets.symmetric(horizontal: 30),
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  await auth.loginWithEMailPassword(
                                    context,
                                    email: loginProv.email.text,
                                    password: loginProv.password.text,
                                  );
                                }
                                loginProv.password.text = "";
                                throw Exception();
                              },
                            ),

                            // SignUp
                            MySecondaryTextButton(
                              text: "SignUp",
                              padding: EdgeInsets.symmetric(horizontal: 30),
                              bgColor: primaryColor(context),
                              elevation: 0,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SignUpScreen(),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "--------------- atau ---------------",
                ),

                // ================= Login dengan Google ========================
                SizedBox(height: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    backgroundColor: Colors.white.withOpacity(.25),
                    foregroundColor: Color.fromARGB(255, 16, 73, 120),
                    elevation: 0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(FontAwesomeIcons.google,
                          color: Color.fromARGB(255, 16, 73, 120)),
                      Text(
                        "Login dengan Google",
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  onPressed: () async {
                    await auth.signInWithGoogle(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LoginScreenProvider extends ChangeNotifier {
  TextEditingController _email = TextEditingController();
  TextEditingController get email => this._email;

  set email(value) {
    this._email.text = value;
    this._email.selection = TextSelection.fromPosition(
        TextPosition(offset: this._email.text.length));
    notifyListeners();
  }

  TextEditingController _password = TextEditingController();
  TextEditingController get password => this._password;

  set password(value) {
    this._password.text = value;
    this._password.selection = TextSelection.fromPosition(
        TextPosition(offset: this._password.text.length));
    notifyListeners();
  }

  bool _isSecure = true;
  bool get isSecure => this._isSecure;

  set setSecure(bool value) {
    this._isSecure = value;
    notifyListeners();
  }
}
