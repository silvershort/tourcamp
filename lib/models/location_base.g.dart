// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_base.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationBase _$LocationBaseFromJson(Map<String, dynamic> json) => LocationBase(
      response: Response.fromJson(json['response'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LocationBaseToJson(LocationBase instance) =>
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
      item: (json['item'] as List<dynamic>)
          .map((e) => LocationBaseItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ItemsToJson(Items instance) => <String, dynamic>{
      'item': instance.item,
    };

LocationBaseItem _$LocationBaseItemFromJson(Map<String, dynamic> json) =>
    LocationBaseItem(
      addr1: json['addr1'] as String?,
      addr2: json['addr2'] as String?,
      areacode: json['areacode'] as int?,
      booktour: json['booktour'] as int?,
      cat1: json['cat1'] as String?,
      cat2: json['cat2'] as String?,
      cat3: json['cat3'] as String?,
      contentid: json['contentid'] as int,
      contenttypeid: json['contenttypeid'] as int,
      createdtime: json['createdtime'] as int?,
      dist: json['dist'] as int,
      firstimage: json['firstimage'] as String?,
      firstimage2: json['firstimage2'] as String?,
      mapx: json['mapx'],
      mapy: json['mapy'],
      mlevel: json['mlevel'] as int?,
      modifiedtime: json['modifiedtime'] as int?,
      readcount: json['readcount'] as int?,
      sigungucode: json['sigungucode'] as int?,
      title: json['title'] as String?,
      tel: json['tel'] as String?,
    );

Map<String, dynamic> _$LocationBaseItemToJson(LocationBaseItem instance) =>
    <String, dynamic>{
      'addr1': instance.addr1,
      'addr2': instance.addr2,
      'areacode': instance.areacode,
      'booktour': instance.booktour,
      'cat1': instance.cat1,
      'cat2': instance.cat2,
      'cat3': instance.cat3,
      'contentid': instance.contentid,
      'contenttypeid': instance.contenttypeid,
      'createdtime': instance.createdtime,
      'dist': instance.dist,
      'firstimage': instance.firstimage,
      'firstimage2': instance.firstimage2,
      'mapx': instance.mapx,
      'mapy': instance.mapy,
      'mlevel': instance.mlevel,
      'modifiedtime': instance.modifiedtime,
      'readcount': instance.readcount,
      'sigungucode': instance.sigungucode,
      'title': instance.title,
      'tel': instance.tel,
    };
