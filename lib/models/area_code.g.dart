// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'area_code.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AreaCode _$AreaCodeFromJson(Map<String, dynamic> json) => AreaCode(
      response: Response.fromJson(json['response'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AreaCodeToJson(AreaCode instance) => <String, dynamic>{
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
      item: (json['item'] as List<dynamic>)
          .map((e) => AreaCodeItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ItemsToJson(Items instance) => <String, dynamic>{
      'item': instance.item,
    };

AreaCodeItem _$AreaCodeItemFromJson(Map<String, dynamic> json) => AreaCodeItem(
      code: json['code'] as int,
      name: json['name'] as String,
      rnum: json['rnum'] as int,
    );

Map<String, dynamic> _$AreaCodeItemToJson(AreaCodeItem instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'rnum': instance.rnum,
    };
