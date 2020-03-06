import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easy/demo/service/service.dart';
import 'package:flutter_easy/repository/api_response.dart';

class ServiceProvider extends ChangeNotifier {
  ServiceProvider(this.currentID) {
    if (_services[currentID] == null) {
      _services[currentID] = ApiResponse<Service>();
      loadCurrentService();
    } else {
      if (currentService.isLoadFinish() == false) {
        loadCurrentService();
      }
    }
  }

  final int currentID;

  ApiResponse<Service> get currentService => _services[currentID];

  static final Map<int, ApiResponse<Service>> _services =
      <int, ApiResponse<Service>>{};

  Future loadCurrentService() async {
    try {
      _services[currentID].loading = 'Loading';
      notifyListeners();
      await Future.delayed(const Duration(seconds: 1));
      final body = await rootBundle.loadString('assets/datas/service.json');
      final Map result = json.decode(body);
      final data = Service.fromJson(result['data']);
      if (data == null) {
        _services[currentID].error = 'Load fail';
      } else {
        _services[currentID].completed = data;
      }
      notifyListeners();
    } catch (e) {
      _services[currentID].error = 'Exception: $e';
      notifyListeners();
    }
  }
}
