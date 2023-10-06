import 'package:dio/dio.dart';
import 'package:flutter_restapi/models/data_model.dart';
import 'package:flutter_restapi/models/json_user_model.dart';
import 'package:flutter_restapi/models/user_model.dart';

class ApiService {
  final Dio dio = Dio();

  Future<UserModel> postUser({
    required String path,
    required UserModel data,
  }) async {
    try {
      final Response response = await dio.post(
        path,
        data: {
          'name': data.name,
          'job': data.job,
        },
      );
      return UserModel.fromJSON(response.data);
    } on DioException catch (_) {
      rethrow;
    }
  }

  Future<JsonUserModel> userFromJson({
    required String path,
  }) async {
    try {
      final Response response = await dio.get(path);
      return JsonUserModel.fromJSON(response.data);
    } on DioException catch (_) {
      rethrow;
    }
  }

  Future<DataModel> updateData({
    required String path,
    required DataModel data,
  }) async {
    try {
      final Response response = await dio.put(
        path,
        data: {
          'id': data.id,
          'title': data.title,
          'body': data.body,
          'userId': data.userId,
        },
      );

      return DataModel.fromJSON(response.data);
    } on DioException catch (_) {
      rethrow;
    }
  }

  Future<DataModel> getData({
    required String path,
  }) async {
    try {
      final Response response = await dio.get(path);

      return DataModel.fromJSON(response.data);
    } on DioException catch (_) {
      rethrow;
    }
  }

  Future<String> fetchImage({
    required String path,
    int index = -1,
  }) async {
    try {
      final Response response = await dio.get(path);

      return response.data;
    } on DioException catch (_) {
      rethrow;
    }
  }

  Future<String> fetchGeneratedImage(String path) async {
    try {
      final Response response = await dio.get(path);

      return response.data;
    } on DioException catch (_) {
      rethrow;
    }
  }
}
