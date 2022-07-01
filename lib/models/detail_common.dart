import 'package:json_annotation/json_annotation.dart';

part 'detail_common.g.dart';

@JsonSerializable(explicitToJson: true)
class DetailCommon {
  Response response;

  DetailCommon({required this.response});

  factory DetailCommon.fromJson(Map<String, dynamic> json) => _$DetailCommonFromJson(json);

  Map<String, dynamic> toJson() => _$DetailCommonToJson(this);
}

@JsonSerializable()
class Response {
  Header header;
  Body body;

  Response({required this.header, required this.body});

  factory Response.fromJson(Map<String, dynamic> json) => _$ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseToJson(this);
}

@JsonSerializable()
class Header {
  String resultCode;
  String resultMsg;

  Header({required this.resultCode, required this.resultMsg});

  factory Header.fromJson(Map<String, dynamic> json) => _$HeaderFromJson(json);

  Map<String, dynamic> toJson() => _$HeaderToJson(this);
}

@JsonSerializable()
class Body {
  Items items;
  int numOfRows;
  int pageNo;
  int totalCount;

  Body({required this.items, required this.numOfRows, required this.pageNo, required this.totalCount});

  factory Body.fromJson(Map<String, dynamic> json) => _$BodyFromJson(json);

  Map<String, dynamic> toJson() => _$BodyToJson(this);
}

@JsonSerializable()
class Items {
  DetailCommonItem item;

  Items({required this.item});

  factory Items.fromJson(Map<String, dynamic> json) => _$ItemsFromJson(json);

  Map<String, dynamic> toJson() => _$ItemsToJson(this);
}

@JsonSerializable()
class DetailCommonItem {
  int? booktour;
  int? contentid;
  int? contenttypeid;
  int? createdtime;
  String? firstimage;
  String? firstimage2;
  String? homepage;
  int? modifiedtime;
  String title;

  DetailCommonItem(
      {this.booktour,
        this.contentid,
        this.contenttypeid,
        this.createdtime,
        this.firstimage,
        this.firstimage2,
        this.homepage,
        this.modifiedtime,
        required this.title});

  factory DetailCommonItem.fromJson(Map<String, dynamic> json) => _$DetailCommonItemFromJson(json);

  Map<String, dynamic> toJson() => _$DetailCommonItemToJson(this);
}