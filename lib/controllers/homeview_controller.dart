import 'package:get/get.dart';

import '../models/userdata_model.dart';
import '../services/api_services.dart';

class HomeViewController extends GetxController {
  UserDataModel? result;
  var isDataLoading = true.obs;

  @override
  void onInit() {
    onActiveVisitors();

    super.onInit();
  }

  onActiveVisitors() async {
    isDataLoading(true);
    result = await ApiServices.getUsers();

    isDataLoading(false);
  }
}
