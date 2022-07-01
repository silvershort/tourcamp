import 'package:json_annotation/json_annotation.dart';

part 'area_code.g.dart';

@JsonSerializable(explicitToJson: true)
class AreaCode {
  Response response;

  AreaCode({required this.response});

  factory AreaCode.fromJson(Map<String, dynamic> json) => _$AreaCodeFromJson(json);

  Map<String, dynamic> toJson() => _$AreaCodeToJson(this);
}

@JsonSerializable()
class Response {
  Header header;
  Body body;

  Response({required this.header, required this.body,});

  factory Response.fromJson(Map<String, dynamic> json) => _$ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseToJson(this);
}

@JsonSerializable()
class Header {
  String resultCode;
  String resultMsg;

  Header({required this.resultCode, required this.resultMsg,});

  factory Header.fromJson(Map<String, dynamic> json) => _$HeaderFromJson(json);

  Map<String, dynamic> toJson() => _$HeaderToJson(this);
}

@JsonSerializable()
class Body {
  Items items;
  int numOfRows;
  int pageNo;
  int totalCount;

  Body({required this.items, required this.numOfRows, required this.pageNo, required this.totalCount,});

  factory Body.fromJson(Map<String, dynamic> json) => _$BodyFromJson(json);

  Map<String, dynamic> toJson() => _$BodyToJson(this);
}

@JsonSerializable()
class Items {
  List<AreaCodeItem> item;

  Items({required this.item});

  factory Items.fromJson(Map<String, dynamic> json) => _$ItemsFromJson(json);

  Map<String, dynamic> toJson() => _$ItemsToJson(this);
}

@JsonSerializable()
class AreaCodeItem {
  int code;
  String name;
  int rnum;

  AreaCodeItem({required this.code, required this.name, required this.rnum});

  factory AreaCodeItem.fromJson(Map<String, dynamic> json) => _$AreaCodeItemFromJson(json);

  Map<String, dynamic> toJson() => _$AreaCodeItemToJson(this);
}