import 'dart:developer';

import 'package:get/get.dart';
import 'package:ghanshyam_mahotsav/network/api_config.dart';
import 'package:ghanshyam_mahotsav/network/api_strings.dart';

import '../model/getTopUserDataResponseModel.dart';
import '../utils/shared_preference.dart';
import '../utils/string_utils.dart';

class TopUserController extends GetxController {
  final ApiBaseHelper apiBaseHelper = ApiBaseHelper();
  final SharedPreferenceClass sharedPreferenceClass = SharedPreferenceClass();

  var url = ApiStrings.get50Data;
  RxString today = ''.obs;
  RxString week = ''.obs;
  RxString month = ''.obs;
  RxString total = ''.obs;
  RxString totalMantraJap = ''.obs;
  RxString user = ''.obs;
  RxString rank = ''.obs;
  RxList<Top50User> topUserList = <Top50User>[].obs;

  // RxList<Top50User> topUserList = <Top50User>[].obs;

  String id = "";

  Future get50UserData() async {
    var data = await ApiBaseHelper.get50Data(leadAPI: url);
    if (data?.message == "Top 50 User list retrieved successfully") {
      print('get50UserData data is a:--->${data?.data}');
      topUserList.value = data!.data;
      print("data is a:----->${topUserList.value}");
    }
  }

  Future getTotalJapData() async {
    // log("${await sharedPreferenceClass.retrieveData(StringUtils.prefUserPhone)}");
    id = await sharedPreferenceClass.retrieveData(StringUtils.prefUserId);

    var data = await apiBaseHelper.getTotalJap( id: id);
    // if (data.data) {
    //   print('data is a:--->${data.data}');

      today.value = data.data.today.toString();
      week.value = data.data.week.toString();
      month.value = data.data.month.toString();
      total.value = data.data.total.toString();
      totalMantraJap.value = data.data.totalMantrajap.toString();
      user.value = data.data.totalUser.toString();
      rank.value = data.data.myRank.toString();
    // }
  }


}