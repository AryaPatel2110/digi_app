
import 'package:dio/dio.dart';

class HttpService {
  static Future<void> studentLogin(
      String id, String grNumber, String mobileNo) async {
    try {
      final response = await Dio()
          .post('http://laravel.digiinstitute.co.in/api/studentLogin', data: {
        "InstituteId": id,
        "grNumber": grNumber,
        "mobileNo": mobileNo
      });

      print(response.statusCode);
      print(response.data);

      if (response.statusCode == 200) {
        try {
          print(response.data);
          // print(StudentResponse.fromJson(response.data));
          // return StudentResponse.fromJson(response.data);
        } catch (e) {
          print(e);
        }
      }
    } catch (e) {
      print(e);
    }
  }
}
