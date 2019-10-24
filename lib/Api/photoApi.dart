import 'dart:io';

import 'package:dio/dio.dart';
import 'package:state_managment/Models/Photo.dart';

final client = Dio()
  ..interceptors.add(
    LogInterceptor(
      request: true,
      responseBody: true,
    ),
  )
  ..options.headers[HttpHeaders.contentTypeHeader] = ContentType.json.value
  ..options.headers[HttpHeaders.acceptHeader] = ContentType.json.value;

abstract class AbstractPhotoApi {
  final path = 'https://jsonplaceholder.typicode.com/photos';
  Future<List<Photo>> getAllphoto();
  Future<Photo> getPhotoById(int id);
  Future<Photo> deletePhotoById(int id);
}

class PhotoApi extends AbstractPhotoApi {
  @override
  Future<List<Photo>> getAllphoto() async {
    try {
      final response = await client.get<List<dynamic>>(path);
      return response.data.map((photo) => Photo.fromJson(photo)).toList();
    } on DioError catch (error) {
      print('error');
    }
  }

  @override
  Future<Photo> getPhotoById(int id) async {
    try {
      final response = await client.get(path);
      return Photo.fromJson(response.data);
    } on DioError catch (error) {
      print('error');
    }
  }

  @override
  Future<Photo> deletePhotoById(int id) async {
    try {
      final response = await client.delete('$path/$id');
      return Photo.fromJson(response.data);
    } on DioError catch (error) {
      print('error');
    }
  }
}
