import 'package:flutter/cupertino.dart';

class HomeSearchProvider extends ChangeNotifier {
  TextEditingController _controller = TextEditingController();
  TextEditingController get controller => this._controller;

  set controller(value) {
    this._controller.text = value;
    this._controller.selection = TextSelection.fromPosition(
        TextPosition(offset: this.controller.text.length));
    notifyListeners();
  }

  List<Map<String, dynamic>> _found = [];
  List<Map<String, dynamic>> get found => this._found;

  set found(value) {
    this._found = value;
    notifyListeners();
  }
}
