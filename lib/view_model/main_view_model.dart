import 'package:async/async.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:retrofit/retrofit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tourcamp/models/area_code.dart';
import 'package:tourcamp/models/detail_common.dart';
import 'package:tourcamp/models/detail_intro.dart';
import 'package:tourcamp/models/setting_model.dart';
import 'package:tourcamp/repositories/rest_client.dart';

import '../models/location_base.dart';

class MainViewModel with ChangeNotifier {
  final RestClient _restClient = RestClient(Dio());
  late final SharedPreferences pref;
  List<AreaCodeItem> areaCodeList = [];
  List<LocationBaseItem> locationBaseList = [];
  late LocationBaseItem currentItem;
  DetailCommonItem? detailCommon;
  DetailIntroItem? detailIntro;
  bool settingChanged = false;

  // api 변수
  bool loading = false;
  bool error = false;
  String mapX = "126.981611";
  String mapY = "37.568477";
  late double radius; // KM
  late int numOfRows;
  late int pageNo;
  late List<SettingModel> settingList;

  void init() async {
    loading = true;
    pref = await SharedPreferences.getInstance();
    Position position = await Geolocator.getCurrentPosition();
    mapX = position.longitude.toString();
    mapY = position.latitude.toString();
    initSettingData();
    fetchLocationBase();
  }

  void initSettingData() {
    settingList = [
      SettingModel(key: 12, eng: "tour", kor: "관광지", value: pref.getBool("tour") ?? true),
      SettingModel(key: 14, eng: "culture", kor: "문화시설", value: pref.getBool("culture") ?? true),
      SettingModel(key: 15, eng: "festival", kor: "행사/공연/축제", value: pref.getBool("festival") ?? true),
      SettingModel(key: 25, eng: "travel", kor: "여행코스", value: pref.getBool("travel") ?? true),
      SettingModel(key: 28, eng: "leports", kor: "레포츠", value: pref.getBool("leports") ?? true),
      SettingModel(key: 32, eng: "stay", kor: "숙박", value: pref.getBool("stay") ?? true),
      SettingModel(key: 38, eng: "shopping", kor: "쇼핑", value: pref.getBool("shopping") ?? true),
      SettingModel(key: 39, eng: "restaurant", kor: "음식점", value: pref.getBool("restaurant") ?? true),
    ];
    radius = pref.getDouble("radius") ?? 5;
    numOfRows = pref.getInt("numOfRows") ?? 50;
    pageNo = pref.getInt("pageNo") ?? 1;
    notifyListeners();
  }

  void initDetailData(int contentId, int contentTypeId) {
    loading = true;
    error = false;
    notifyListeners();
    FutureGroup futureGroup = FutureGroup();
    futureGroup.add(fetchDetailCommon(contentId));
    futureGroup.add(fetchIntroCommon(contentId, contentTypeId));
    futureGroup.close();
    futureGroup.future.then((value) {
      loading = false;
      notifyListeners();
    }).onError((error, stackTrace) {
      loading = false;
      error = true;
      notifyListeners();
    });
  }

  void resetData() {
    locationBaseList.clear();
    pageNo = 1;
    fetchLocationBase();
    settingChanged = false;
  }

  void setCurrentItem(LocationBaseItem newItem) {
    currentItem = newItem;
    notifyListeners();
  }

  void setSettingCheckData(int index, bool value) {
    pref.setBool(settingList[index].eng, value);
    settingList[index].value = value;
    settingChanged = true;
    notifyListeners();
  }

  void setRadius(double newValue) {
    radius = newValue;
    pref.setDouble("radius", newValue);
    settingChanged = true;
    notifyListeners();
  }

  void setNumOfRows(int newValue) {
    numOfRows = newValue;
    pref.setInt("numOfRows", newValue);
    notifyListeners();
  }

  void setPageNo(int newValue) {
    pageNo = newValue;
    pref.setInt("pageNo", newValue);
    notifyListeners();
  }

  Future fetchAreaCode() async {
    loading = true;
    notifyListeners();
    HttpResponse<AreaCode> result = await _restClient.getAreaCode();
    if (result.response.statusCode == 200) {
      AreaCode data = result.data;
      areaCodeList.addAll(data.response.body.items.item);
    } else {
      print("statusCode error : ${result.response.statusCode}");
    }
    loading = false;
    notifyListeners();
  }

  Future fetchLocationBase() async {
    loading = true;
    error = false;
    notifyListeners();
    HttpResponse<LocationBase> result = await _restClient.getLocationBasedList(
      numOfRows: numOfRows.toString(),
      pageNo: pageNo.toString(),
      mapX: mapX,
      mapY: mapY,
      radius: "${(radius * 1000).toInt()}",
    );
    if (result.response.statusCode == 200) {
      LocationBase data = result.data;
      List<LocationBaseItem> dataList = data.response.body.items.item;
      for (var settingItem in settingList) {
        if (!settingItem.value) {
          dataList = dataList.where((element) => element.contenttypeid != settingItem.key).toList();
        }
      }
      locationBaseList.addAll(dataList);
      pageNo++;
    } else {
      error = true;
    }
    loading = false;
    notifyListeners();
  }

  Future fetchDetailCommon(int contentId) async {
    notifyListeners();
    HttpResponse<DetailCommon> result = await _restClient.getDetailCommon(
      contentId: "$contentId",
    );
    if (result.response.statusCode == 200) {
      DetailCommon data = result.data;
      detailCommon = data.response.body.items.item;
    } else {
    }
    notifyListeners();
  }

  Future fetchIntroCommon(int contentId, int contentTypeId) async {
    notifyListeners();
    HttpResponse<DetailIntro> result = await _restClient.getDetailIntro(
      contentId: "$contentId",
      contentTypeId: "$contentTypeId",
    );
    if (result.response.statusCode == 200) {
      DetailIntro data = result.data;
      detailIntro = data.response.body.items.item;
    } else {
      print("statusCode error : ${result.response.statusCode}");
    }
    notifyListeners();
  }
}