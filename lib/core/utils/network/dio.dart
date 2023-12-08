import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://student.valuxapps.com/api/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> postData(
      {
        required String methodUrl,
      Map<String, dynamic>? query,
      required Map<String, dynamic> data,
      String lang = 'en',
      String? token,
      a}) async {
    dio!.options.headers = {
      'lang': lang,
      'Content-Type': 'application/json',
      'Authorization': token ?? '',
    };
    return dio!.post(
      methodUrl,
      queryParameters: query,
      data: data,
    );
  }

  static Future<Response> getData({
    required String methodUrl,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? token,
  }) async {
    dio!.options.headers = {
      'lang': lang,
      'Content-Type': 'application/json',
      'Authorization': token ?? '',
    };
    return await dio!.get(methodUrl, queryParameters: query);
  }

  static Future<Response> putData({
    @required String? methodUrl,
    Map<String, dynamic>? query,
    @required Map<String, dynamic>? data,
    String lang = 'en',
    String? token,
  }) async {
    dio!.options.headers = {
      'lang': lang,
      'Content-Type': 'application/json',
      'Authorization': token ?? '',
    };
    return dio!.put(
      methodUrl!,
      queryParameters: query,
      data: data,
    );
  }
}

class ApiService {

  final Dio _dio;
  final String _baseUrl = 'https://student.valuxapps.com/api/';
  final String lang = 'en';

  ApiService(this._dio);

  Future<Map<String, dynamic>> get({
    required String urlEndPoint,
    String? token,
    Map<String, dynamic>? queryParameters,
  }) async {
    var response = await _dio.get(
      '$_baseUrl$urlEndPoint',
      options: Options(
        receiveDataWhenStatusError: true,
        headers: {
          "lang": lang,
          "Content-Type": "application/json",
          'Authorization': token ?? '',
        },
      ),
      queryParameters: queryParameters,
    );
    return response.data;
  }

  Future<Map<String, dynamic>> post({
    required String urlEndPoint,
    String? token,
    Map<String, dynamic>? queryParameters,
  }) async {
    var response =await  _dio.post(
      '$_baseUrl$urlEndPoint',
        options: Options(
        headers: {
        "lang": lang,
        "Content-Type": "application/json",
        'Authorization': token ?? '',
        },

    ),
      queryParameters: queryParameters
    );

    return response.data;
  }




}
