// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailInfo _$DetailInfoFromJson(Map<String, dynamic> json) => DetailInfo(
      response: Response.fromJson(json['response'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DetailInfoToJson(DetailInfo instance) =>
    <String, dynamic>{
      'response': instance.response.toJson(),
    };

Response _$ResponseFromJson(Map<String, dynamic> json) => Response(
      header: Header.fromJson(json['header'] as Map<String, dynamic>),
      body: Body.fromJson(json['body'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ResponseToJson(Response instance) => <String, dynamic>{
      'header': instance.header,
      'body': instance.body,
    };

Header _$HeaderFromJson(Map<String, dynamic> json) => Header(
      resultCode: json['resultCode'] as String,
      resultMsg: json['resultMsg'] as String,
    );

Map<String, dynamic> _$HeaderToJson(Header instance) => <String, dynamic>{
      'resultCode': instance.resultCode,
      'resultMsg': instance.resultMsg,
    };

Body _$BodyFromJson(Map<String, dynamic> json) => Body(
      items: Items.fromJson(json['items'] as Map<String, dynamic>),
      numOfRows: json['numOfRows'] as int,
      pageNo: json['pageNo'] as int,
      totalCount: json['totalCount'] as int,
    );

Map<String, dynamic> _$BodyToJson(Body instance) => <String, dynamic>{
      'items': instance.items,
      'numOfRows': instance.numOfRows,
      'pageNo': instance.pageNo,
      'totalCount': instance.totalCount,
    };

Items _$ItemsFromJson(Map<String, dynamic> json) => Items(
      item: DetailInfoItem.fromJson(json['item'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ItemsToJson(Items instance) => <String, dynamic>{
      'item': instance.item,
    };

DetailInfoItem _$DetailInfoItemFromJson(Map<String, dynamic> json) =>
    DetailInfoItem(
      contentid: json['contentid'] as int?,
      contenttypeid: json['contenttypeid'] as int?,
      fldgubun: json['fldgubun'] as int?,
      infoname: json['infoname'] as String?,
      infotext: json['infotext'] as String?,
      serialnum: json['serialnum'] as int?,
    );

Map<String, dynamic> _$DetailInfoItemToJson(DetailInfoItem instance) =>
    <String, dynamic>{
      'contentid': instance.contentid,
      'contenttypeid': instance.contenttypeid,
      'fldgubun': instance.fldgubun,
      'infoname': instance.infoname,
      'infotext': instance.infotext,
      'serialnum': instance.serialnum,
    };
