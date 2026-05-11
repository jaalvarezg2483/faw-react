import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
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

  List<ModelsStruct> _models = [];
  List<ModelsStruct> get models => _models;
  set models(List<ModelsStruct> value) {
    _models = value;
  }

  void addToModels(ModelsStruct value) {
    models.add(value);
  }

  void removeFromModels(ModelsStruct value) {
    models.remove(value);
  }

  void removeAtIndexFromModels(int index) {
    models.removeAt(index);
  }

  void updateModelsAtIndex(
    int index,
    ModelsStruct Function(ModelsStruct) updateFn,
  ) {
    models[index] = updateFn(_models[index]);
  }

  void insertAtIndexInModels(int index, ModelsStruct value) {
    models.insert(index, value);
  }

  String _menuOptionActive = '';
  String get menuOptionActive => _menuOptionActive;
  set menuOptionActive(String value) {
    _menuOptionActive = value;
  }

  String _expandedNavSection = '';
  String get expandedNavSection => _expandedNavSection;
  set expandedNavSection(String value) {
    _expandedNavSection = value;
  }
}
