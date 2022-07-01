import 'package:json_annotation/json_annotation.dart';

part 'location_base.g.dart';

@JsonSerializable(explicitToJson: true)
class LocationBase {
  Response response;

  LocationBase({required this.response});

  factory LocationBase.fromJson(Map<String, dynamic> json) => _$LocationBaseFromJson(json);

  Map<String, dynamic> toJson() => _$LocationBaseToJson(this);
}

@JsonSerializable()
class Response {
  Header header;
  Body body;

  Response({
    required this.header,
    required this.body,
  });

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
  List<LocationBaseItem> item;

  Items({required this.item});

  factory Items.fromJson(Map<String, dynamic> json) => _$ItemsFromJson(json);

  Map<String, dynamic> toJson() => _$ItemsToJson(this);
}

@JsonSerializable()
class LocationBaseItem {
  String? addr1;
  String? addr2;
  int? areacode;
  int? booktour;
  String? cat1;
  String? cat2;
  String? cat3;
  int contentid;
  int contenttypeid;
  int? createdtime;
  int dist;
  String? firstimage;
  String? firstimage2;
  dynamic mapx;
  dynamic mapy;
  int? mlevel;
  int? modifiedtime;
  int? readcount;
  int? sigungucode;
  String? title;
  String? tel;

  LocationBaseItem(
      {this.addr1,
      this.addr2,
      this.areacode,
      this.booktour,
      this.cat1,
      this.cat2,
      this.cat3,
      required this.contentid,
      required this.contenttypeid,
      this.createdtime,
      required this.dist,
      this.firstimage,
      this.firstimage2,
      this.mapx,
      this.mapy,
      this.mlevel,
      this.modifiedtime,
      this.readcount,
      this.sigungucode,
      this.title,
      this.tel});

  factory LocationBaseItem.fromJson(Map<String, dynamic> json) => _$LocationBaseItemFromJson(json);

  Map<String, dynamic> toJson() => _$LocationBaseItemToJson(this);
}
