import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

class AuthRequestService {
  static Future authRequestData(String email, String password) async {
    try {
      Response response =
          await Dio().post('https://reqres.in/api/login', data: {
        'email': email,
        'password': password,
      });
      if (response.statusCode == 200 || response.statusCode == 201) {
        print('response data : ${response.data['token']}');
        GetStorage().write('token', response.data['token'].toString());
        return true;
      } else if (response.statusCode == 400) {
        print('Response Data == 400 :" ${response.data}');
        return false;
      }
    } catch (e) {
      print('Error Has Data : $e');
    }
  }
}
