import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:tourcamp/models/area_code.dart';
import 'package:tourcamp/models/detail_common.dart';
import 'package:tourcamp/models/detail_intro.dart';
import 'package:tourcamp/models/location_base.dart';

part 'rest_client.g.dart';

const String apiKey = "3irZQgr/+ZVVTv5d5EIo3drRbb7YRX/3kF3Z8lj9tK9MNLZEkQbwD8Q/CwZzLoTQ8PLksSOQYhkSAi0ODeKc8Q==";

@RestApi(baseUrl: 'http://api.visitkorea.or.kr/openapi/service/rest/KorService')
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  // 지역코드 조회
  @GET("/areaCode")
  Future<HttpResponse<AreaCode>> getAreaCode({
    @Query("ServiceKey") String serviceKey = apiKey,
    @Query("numOfRows") String numOfRows = "20",
    @Query("pageNo") String pageNo = "1",
    @Query("MobileOS") String mobileOS = "ETC",
    @Query("MobileApp") String mobileApp = "TestApp",
    @Query("_type") String type = "json",
  });

  // 위치기반 관광정보 조회
  @GET("/locationBasedList")
  Future<HttpResponse<LocationBase>> getLocationBasedList({
    @Query("ServiceKey") String serviceKey = apiKey,
    @Query("numOfRows") String numOfRows = "20",
    @Query("pageNo") String pageNo = "1",
    @Query("mapX") String mapX = "126.981611",
    @Query("mapY") String mapY = "37.568477",
    @Query("radius") String radius = "1000",
    @Query("listYN") String listYN = "Y",
    @Query("arrange") String arrange = "E",
    @Query("MobileOS") String mobileOS = "ETC",
    @Query("MobileApp") String mobileApp = "TourCam",
    @Query("_type") String type = "json",
  });

  // 공통정보 조회
  @GET("/detailCommon")
  Future<HttpResponse<DetailCommon>> getDetailCommon({
    @Query("ServiceKey") String serviceKey = apiKey,
    @Query("contentId") required String contentId,
    @Query("defaultYN") String defaultYN = "Y",
    @Query("firstImageYN") String firstImageYN = "Y",
    @Query("MobileOS") String mobileOS = "ETC",
    @Query("MobileApp") String mobileApp = "TourCam",
    @Query("_type") String type = "json",
  });

  // 소개정보 조회
  @GET("/detailIntro")
  Future<HttpResponse<DetailIntro>> getDetailIntro({
    @Query("ServiceKey") String serviceKey = apiKey,
    @Query("contentId") required String contentId,
    @Query("contentTypeId") required String contentTypeId,
    @Query("defaultYN") String defaultYN = "Y",
    @Query("MobileOS") String mobileOS = "ETC",
    @Query("MobileApp") String mobileApp = "TourCam",
    @Query("_type") String type = "json",
  });

  /*// 반복정보 조회
  @GET("/detailInfo")
  Future<HttpResponse<LocationBase>> getDetailInfo({
    @Query("ServiceKey") String serviceKey = apiKey,
    @Query("contentId") required String contentId,
    @Query("contentTypeId") required String contentTypeId,
    @Query("defaultYN") String defaultYN = "Y",
    @Query("MobileOS") String mobileOS = "ETC",
    @Query("MobileApp") String mobileApp = "TourCam",
    @Query("_type") String type = "json",
  });*/
}
