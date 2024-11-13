import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  bool _isMenuMobile = false;
  bool get isMenuMobile => _isMenuMobile;
  set isMenuMobile(bool value) {
    _isMenuMobile = value;
  }

  String _modelSelected = '';
  String get modelSelected => _modelSelected;
  set modelSelected(String value) {
    _modelSelected = value;
  }

  bool _isModelSelected = false;
  bool get isModelSelected => _isModelSelected;
  set isModelSelected(bool value) {
    _isModelSelected = value;
  }
}
