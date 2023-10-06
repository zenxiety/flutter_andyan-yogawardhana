import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_restapi/models/data_model.dart';
import 'package:flutter_restapi/models/json_user_model.dart';
import 'package:flutter_restapi/models/user_model.dart';
import 'package:flutter_restapi/services/services.dart';
import 'package:flutter_restapi/utils/states/fetch_state.dart';

class UserProvider extends ChangeNotifier {
  final ApiService service = ApiService();

  UserModel? userModel;
  JsonUserModel? jsonUserModel;
  DataModel? dataModel;

  FetchState fetchState = FetchState.initial;

  Future postUserData(String path, UserModel data) async {
    try {
      fetchState = FetchState.loading;
      notifyListeners();

      userModel = await service.postUser(path: path, data: data);

      fetchState = FetchState.loaded;
      notifyListeners();
    } on DioException catch (_) {
      fetchState = FetchState.failed;
      notifyListeners();
      rethrow;
    }
  }

  Future userFromJson(String path) async {
    try {
      fetchState = FetchState.loading;
      notifyListeners();

      jsonUserModel = await service.userFromJson(path: path);

      fetchState = FetchState.loaded;
      notifyListeners();
    } on DioException catch (_) {
      rethrow;
    }
  }

  Future updateData(String path, DataModel data) async {
    try {
      fetchState = FetchState.loading;
      notifyListeners();

      dataModel = await service.updateData(path: path, data: data);

      fetchState = FetchState.loaded;
      notifyListeners();
    } on DioException catch (_) {
      rethrow;
    }
  }

  Future getData(String path) async {
    try {
      fetchState = FetchState.loading;
      notifyListeners();

      dataModel = await service.getData(path: path);

      fetchState = FetchState.initial;
      notifyListeners();
    } on DioException catch (_) {
      rethrow;
    }
  }
}
