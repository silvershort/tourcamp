// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_intro.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailIntro _$DetailIntroFromJson(Map<String, dynamic> json) => DetailIntro(
      response: Response.fromJson(json['response'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DetailIntroToJson(DetailIntro instance) =>
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
      item: DetailIntroItem.fromJson(json['item'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ItemsToJson(Items instance) => <String, dynamic>{
      'item': instance.item,
    };

DetailIntroItem _$DetailIntroItemFromJson(Map<String, dynamic> json) =>
    DetailIntroItem(
      bookingplace: json['bookingplace'] as String?,
      contentid: json['contentid'] as int?,
      contenttypeid: json['contenttypeid'] as int?,
      discountinfofestival: json['discountinfofestival'] as String?,
      eventenddate: json['eventenddate'] as int?,
      eventplace: json['eventplace'] as String?,
      eventstartdate: json['eventstartdate'] as int?,
      festivaltype: json['festivaltype'] as String?,
      placeinfo: json['placeinfo'] as String?,
      playtime: json['playtime'] as String?,
      program: json['program'] as String?,
      progresstype: json['progresstype'] as String?,
      sponsor1: json['sponsor1'] as String?,
      sponsor1tel: json['sponsor1tel'] as String?,
      sponsor2: json['sponsor2'] as String?,
      sponsor2tel: json['sponsor2tel'] as String?,
      subevent: json['subevent'] as String?,
      usetimefestival: json['usetimefestival'] as String?,
      chkbabycarriage: json['chkbabycarriage'] as String?,
      chkcreditcard: json['chkcreditcard'] as String?,
      chkpet: json['chkpet'] as String?,
      expguide: json['expguide'] as String?,
      heritage1: json['heritage1'] as int?,
      heritage2: json['heritage2'] as int?,
      heritage3: json['heritage3'] as int?,
      infocenter: json['infocenter'] as String?,
      parking: json['parking'] as String?,
      restdate: json['restdate'] as String?,
      usetime: json['usetime'] as String?,
      chkbabycarriageculture: json['chkbabycarriageculture'] as String?,
      chkcreditcardculture: json['chkcreditcardculture'] as String?,
      chkpetculture: json['chkpetculture'] as String?,
      infocenterculture: json['infocenterculture'] as String?,
      parkingculture: json['parkingculture'] as String?,
      parkingfee: json['parkingfee'] as String?,
      restdateculture: json['restdateculture'] as String?,
      scale: json['scale'] as String?,
      usefee: json['usefee'] as String?,
      usetimeculture: json['usetimeculture'] as String?,
      distance: json['distance'] as String?,
      schedule: json['schedule'] as String?,
      taketime: json['taketime'] as String?,
      theme: json['theme'] as String?,
      chkbabycarriageleports: json['chkbabycarriageleports'] as String?,
      chkcreditcardleports: json['chkcreditcardleports'] as String?,
      chkpetleports: json['chkpetleports'] as String?,
      infocenterleports: json['infocenterleports'] as String?,
      parkingfeeleports: json['parkingfeeleports'] as String?,
      parkingleports: json['parkingleports'] as String?,
      reservation: json['reservation'] as String?,
      restdateleports: json['restdateleports'] as String?,
      usefeeleports: json['usefeeleports'] as String?,
      usetimeleports: json['usetimeleports'] as String?,
      accomcountlodging: json['accomcountlodging'] as String?,
      barbecue: json['barbecue'] as int?,
      beauty: json['beauty'] as int?,
      benikia: json['benikia'] as int?,
      beverage: json['beverage'] as int?,
      bicycle: json['bicycle'] as int?,
      campfire: json['campfire'] as int?,
      checkintime: json['checkintime'] as String?,
      checkouttime: json['checkouttime'] as String?,
      fitness: json['fitness'] as int?,
      foodplace: json['foodplace'] as String?,
      goodstay: json['goodstay'] as int?,
      hanok: json['hanok'] as int?,
      infocenterlodging: json['infocenterlodging'] as String?,
      karaoke: json['karaoke'] as int?,
      parkinglodging: json['parkinglodging'] as String?,
      publicbath: json['publicbath'] as int?,
      publicpc: json['publicpc'] as int?,
      reservationlodging: json['reservationlodging'] as String?,
      roomcount: json['roomcount'] as int?,
      roomtype: json['roomtype'] as String?,
      sauna: json['sauna'] as int?,
      seminar: json['seminar'] as int?,
      sports: json['sports'] as int?,
      subfacility: json['subfacility'] as String?,
      chkbabycarriageshopping: json['chkbabycarriageshopping'] as String?,
      chkcreditcardshopping: json['chkcreditcardshopping'] as String?,
      chkpetshopping: json['chkpetshopping'] as String?,
      infocentershopping: json['infocentershopping'] as String?,
      opentime: json['opentime'] as String?,
      parkingshopping: json['parkingshopping'] as String?,
      restdateshopping: json['restdateshopping'] as String?,
      saleitem: json['saleitem'] as String?,
      saleitemcost: json['saleitemcost'] as String?,
      shopguide: json['shopguide'] as String?,
      chkcreditcardfood: json['chkcreditcardfood'] as String?,
      discountinfofood: json['discountinfofood'] as String?,
      firstmenu: json['firstmenu'] as String?,
      infocenterfood: json['infocenterfood'] as String?,
      kidsfacility: json['kidsfacility'] as int?,
      lcnsno: json['lcnsno'] as int?,
      opentimefood: json['opentimefood'] as String?,
      parkingfood: json['parkingfood'] as String?,
      restdatefood: json['restdatefood'] as String?,
      treatmenu: json['treatmenu'] as String?,
    );

Map<String, dynamic> _$DetailIntroItemToJson(DetailIntroItem instance) =>
    <String, dynamic>{
      'bookingplace': instance.bookingplace,
      'contentid': instance.contentid,
      'contenttypeid': instance.contenttypeid,
      'discountinfofestival': instance.discountinfofestival,
      'eventenddate': instance.eventenddate,
      'eventplace': instance.eventplace,
      'eventstartdate': instance.eventstartdate,
      'festivaltype': instance.festivaltype,
      'placeinfo': instance.placeinfo,
      'playtime': instance.playtime,
      'program': instance.program,
      'progresstype': instance.progresstype,
      'sponsor1': instance.sponsor1,
      'sponsor1tel': instance.sponsor1tel,
      'sponsor2': instance.sponsor2,
      'sponsor2tel': instance.sponsor2tel,
      'subevent': instance.subevent,
      'usetimefestival': instance.usetimefestival,
      'chkbabycarriage': instance.chkbabycarriage,
      'chkcreditcard': instance.chkcreditcard,
      'chkpet': instance.chkpet,
      'expguide': instance.expguide,
      'heritage1': instance.heritage1,
      'heritage2': instance.heritage2,
      'heritage3': instance.heritage3,
      'infocenter': instance.infocenter,
      'parking': instance.parking,
      'restdate': instance.restdate,
      'usetime': instance.usetime,
      'chkbabycarriageculture': instance.chkbabycarriageculture,
      'chkcreditcardculture': instance.chkcreditcardculture,
      'chkpetculture': instance.chkpetculture,
      'infocenterculture': instance.infocenterculture,
      'parkingculture': instance.parkingculture,
      'parkingfee': instance.parkingfee,
      'restdateculture': instance.restdateculture,
      'scale': instance.scale,
      'usefee': instance.usefee,
      'usetimeculture': instance.usetimeculture,
      'distance': instance.distance,
      'schedule': instance.schedule,
      'taketime': instance.taketime,
      'theme': instance.theme,
      'chkbabycarriageleports': instance.chkbabycarriageleports,
      'chkcreditcardleports': instance.chkcreditcardleports,
      'chkpetleports': instance.chkpetleports,
      'infocenterleports': instance.infocenterleports,
      'parkingfeeleports': instance.parkingfeeleports,
      'parkingleports': instance.parkingleports,
      'reservation': instance.reservation,
      'restdateleports': instance.restdateleports,
      'usefeeleports': instance.usefeeleports,
      'usetimeleports': instance.usetimeleports,
      'accomcountlodging': instance.accomcountlodging,
      'barbecue': instance.barbecue,
      'beauty': instance.beauty,
      'benikia': instance.benikia,
      'beverage': instance.beverage,
      'bicycle': instance.bicycle,
      'campfire': instance.campfire,
      'checkintime': instance.checkintime,
      'checkouttime': instance.checkouttime,
      'fitness': instance.fitness,
      'foodplace': instance.foodplace,
      'goodstay': instance.goodstay,
      'hanok': instance.hanok,
      'infocenterlodging': instance.infocenterlodging,
      'karaoke': instance.karaoke,
      'parkinglodging': instance.parkinglodging,
      'publicbath': instance.publicbath,
      'publicpc': instance.publicpc,
      'reservationlodging': instance.reservationlodging,
      'roomcount': instance.roomcount,
      'roomtype': instance.roomtype,
      'sauna': instance.sauna,
      'seminar': instance.seminar,
      'sports': instance.sports,
      'subfacility': instance.subfacility,
      'chkbabycarriageshopping': instance.chkbabycarriageshopping,
      'chkcreditcardshopping': instance.chkcreditcardshopping,
      'chkpetshopping': instance.chkpetshopping,
      'infocentershopping': instance.infocentershopping,
      'opentime': instance.opentime,
      'parkingshopping': instance.parkingshopping,
      'restdateshopping': instance.restdateshopping,
      'saleitem': instance.saleitem,
      'saleitemcost': instance.saleitemcost,
      'shopguide': instance.shopguide,
      'chkcreditcardfood': instance.chkcreditcardfood,
      'discountinfofood': instance.discountinfofood,
      'firstmenu': instance.firstmenu,
      'infocenterfood': instance.infocenterfood,
      'kidsfacility': instance.kidsfacility,
      'lcnsno': instance.lcnsno,
      'opentimefood': instance.opentimefood,
      'parkingfood': instance.parkingfood,
      'restdatefood': instance.restdatefood,
      'treatmenu': instance.treatmenu,
    };
