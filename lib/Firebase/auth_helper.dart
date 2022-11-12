import 'package:code_project/Widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthHelper {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // ======== Sign In With Email & Password =========
  Future<void> signUpWithEmailPassword(
    BuildContext context, {
    required String email,
    required String password,
  }) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      if (e.code == "email-already-in-use") {
        _showDialog(context, "Email telah digunakan");
      } else if (e.code == "invalid-email") {
        _showDialog(context, "Email tidak valid");
      } else if (e.code == "operation-not-allowed") {
        _showDialog(context, "Gagal");
      } else if (e.code == "weak-password") {
        _showDialog(context, "Password Lemah");
      }
    }
  }

  // ======== Update Data ========
  Future<void> updateData(
    BuildContext context, {
    required String name,
  }) async {
    User? user = await this.getUser();

    if (user != null) {
      try {
        await user.updateDisplayName(name);
        Navigator.pushNamedAndRemoveUntil(context, "/", (route) => false);
      } catch (e) {
        _showDialog(context, e.toString());
      }
    }
  }

  // ======== Login WIth Email & Password ========
  Future<void> loginWithEMailPassword(
    BuildContext context, {
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user!.uid.isNotEmpty) {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text("Tambahkan Data Sekarang?"),
              actions: [
                MyPrimaryTextButton(
                  text: "Ya",
                  onPressed: () => Navigator.pushReplacementNamed(
                      context, "/edit-data_screen"),
                ),
                MySecondaryTextButton(
                  text: "Nanti",
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, "/", (route) => false);
                  },
                ),
              ],
            );
          },
        );
      }
    } on FirebaseAuthException catch (e) {
      _showDialog(context, e.code.toString());
      if (e.code == "email-already-in-use") {
        _showDialog(context, "Email telah digunakan");
      } else if (e.code == "user-not-found") {
        _showDialog(context, "User tidak ditemukan");
      } else if (e.code == "wrong-password") {
        _showDialog(context, "Password salah");
      }
    }

    return null;
  }

  Future<User?> getUser() async {
    User? user = await _auth.currentUser;

    return user;
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}

void _showDialog(BuildContext context, String error) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        content: Text(error),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Back"),
          ),
        ],
      );
    },
  );
}
