// import 'dart:developer';

// import 'package:http/http.dart' as http;

// import '../constants/urls.dart';

// class ApiServices {
//   static getUsers() async {
//     print("object");
//     try {
//       var url = Uri.parse(Url.baseUrl);
//       var response = await http.get(
//         url,
//       );
//       print("---");
//       print(response.body);
//       if (response.statusCode == 200) {
//         print('---------');
//         print(response.body);
//         // print('---------');
//         // PostModel _model = postModelFromJson(response.body);
//         // return _model;
//       }
//     } catch (e) {
//       log(e.toString());
//     }
//   }
// }

import 'dart:developer';

import 'package:flutter_application_2/models/userdata_model.dart';
import 'package:http/http.dart' as http;

import '../constants/urls.dart';

class ApiServices {
  static Future<UserDataModel?> getUsers() async {
    print("object");
    try {
      print("---");
      var url = Uri.parse(Url.baseUrl);

      var response = await http.get(
        url,
      );
      print(response.statusCode);
      print(response.body);

      if (response.statusCode == 200) {
        print('---------');
        print(response.body);
        // print('---------');
        UserDataModel _model = userDataModelFromJson(response.body);
        return _model;
      }
    } catch (e) {
      print("sajid shaikh bhuru ");
      log(e.toString());
    }
  }
}
