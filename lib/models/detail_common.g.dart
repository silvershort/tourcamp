// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_common.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailCommon _$DetailCommonFromJson(Map<String, dynamic> json) => DetailCommon(
      response: Response.fromJson(json['response'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DetailCommonToJson(DetailCommon instance) =>
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
      item: DetailCommonItem.fromJson(json['item'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ItemsToJson(Items instance) => <String, dynamic>{
      'item': instance.item,
    };

DetailCommonItem _$DetailCommonItemFromJson(Map<String, dynamic> json) =>
    DetailCommonItem(
      booktour: json['booktour'] as int?,
      contentid: json['contentid'] as int?,
      contenttypeid: json['contenttypeid'] as int?,
      createdtime: json['createdtime'] as int?,
      firstimage: json['firstimage'] as String?,
      firstimage2: json['firstimage2'] as String?,
      homepage: json['homepage'] as String?,
      modifiedtime: json['modifiedtime'] as int?,
      title: json['title'] as String,
    );

Map<String, dynamic> _$DetailCommonItemToJson(DetailCommonItem instance) =>
    <String, dynamic>{
      'booktour': instance.booktour,
      'contentid': instance.contentid,
      'contenttypeid': instance.contenttypeid,
      'createdtime': instance.createdtime,
      'firstimage': instance.firstimage,
      'firstimage2': instance.firstimage2,
      'homepage': instance.homepage,
      'modifiedtime': instance.modifiedtime,
      'title': instance.title,
    };
