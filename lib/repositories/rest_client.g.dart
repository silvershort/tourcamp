// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rest_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps

class _RestClient implements RestClient {
  _RestClient(this._dio, {this.baseUrl}) {
    baseUrl ??= 'http://api.visitkorea.or.kr/openapi/service/rest/KorService';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<HttpResponse<AreaCode>> getAreaCode(
      {serviceKey = apiKey,
      numOfRows = "20",
      pageNo = "1",
      mobileOS = "ETC",
      mobileApp = "TestApp",
      type = "json"}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'ServiceKey': serviceKey,
      r'numOfRows': numOfRows,
      r'pageNo': pageNo,
      r'MobileOS': mobileOS,
      r'MobileApp': mobileApp,
      r'_type': type
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<AreaCode>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/areaCode',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = AreaCode.fromJson(_result.data!);
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<LocationBase>> getLocationBasedList(
      {serviceKey = apiKey,
      numOfRows = "20",
      pageNo = "1",
      mapX = "126.981611",
      mapY = "37.568477",
      radius = "1000",
      listYN = "Y",
      arrange = "E",
      mobileOS = "ETC",
      mobileApp = "TourCam",
      type = "json"}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'ServiceKey': serviceKey,
      r'numOfRows': numOfRows,
      r'pageNo': pageNo,
      r'mapX': mapX,
      r'mapY': mapY,
      r'radius': radius,
      r'listYN': listYN,
      r'arrange': arrange,
      r'MobileOS': mobileOS,
      r'MobileApp': mobileApp,
      r'_type': type
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<LocationBase>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/locationBasedList',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = LocationBase.fromJson(_result.data!);
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<DetailCommon>> getDetailCommon(
      {serviceKey = apiKey,
      required contentId,
      defaultYN = "Y",
      firstImageYN = "Y",
      mobileOS = "ETC",
      mobileApp = "TourCam",
      type = "json"}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'ServiceKey': serviceKey,
      r'contentId': contentId,
      r'defaultYN': defaultYN,
      r'firstImageYN': firstImageYN,
      r'MobileOS': mobileOS,
      r'MobileApp': mobileApp,
      r'_type': type
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<DetailCommon>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/detailCommon',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = DetailCommon.fromJson(_result.data!);
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<DetailIntro>> getDetailIntro(
      {serviceKey = apiKey,
      required contentId,
      required contentTypeId,
      defaultYN = "Y",
      mobileOS = "ETC",
      mobileApp = "TourCam",
      type = "json"}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'ServiceKey': serviceKey,
      r'contentId': contentId,
      r'contentTypeId': contentTypeId,
      r'defaultYN': defaultYN,
      r'MobileOS': mobileOS,
      r'MobileApp': mobileApp,
      r'_type': type
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<DetailIntro>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/detailIntro',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = DetailIntro.fromJson(_result.data!);
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
