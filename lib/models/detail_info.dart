import 'package:json_annotation/json_annotation.dart';

part 'detail_info.g.dart';

@JsonSerializable(explicitToJson: true)
class DetailInfo {
  Response response;

  DetailInfo({required this.response});

  factory DetailInfo.fromJson(Map<String, dynamic> json) => _$DetailInfoFromJson(json);

  Map<String, dynamic> toJson() => _$DetailInfoToJson(this);
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
  DetailInfoItem item;

  Items({required this.item});

  factory Items.fromJson(Map<String, dynamic> json) => _$ItemsFromJson(json);

  Map<String, dynamic> toJson() => _$ItemsToJson(this);
}

@JsonSerializable()
class DetailInfoItem {
  int? contentid;
  int? contenttypeid;
  int? fldgubun;
  String? infoname;
  String? infotext;
  int? serialnum;

  DetailInfoItem(
      {this.contentid,
        this.contenttypeid,
        this.fldgubun,
        this.infoname,
        this.infotext,
        this.serialnum});

  factory DetailInfoItem.fromJson(Map<String, dynamic> json) => _$DetailInfoItemFromJson(json);

  Map<String, dynamic> toJson() => _$DetailInfoItemToJson(this);
}
