import 'package:json_annotation/json_annotation.dart';

part 'detail_intro.g.dart';

@JsonSerializable(explicitToJson: true)
class DetailIntro {
  Response response;

  DetailIntro({required this.response});

  factory DetailIntro.fromJson(Map<String, dynamic> json) => _$DetailIntroFromJson(json);

  Map<String, dynamic> toJson() => _$DetailIntroToJson(this);
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
  DetailIntroItem item;

  Items({required this.item});

  factory Items.fromJson(Map<String, dynamic> json) => _$ItemsFromJson(json);

  Map<String, dynamic> toJson() => _$ItemsToJson(this);
}

@JsonSerializable()
class DetailIntroItem {
  String? bookingplace;
  int? contentid;
  int? contenttypeid;
  String? discountinfofestival;
  int? eventenddate;
  String? eventplace;
  int? eventstartdate;
  String? festivaltype;
  String? placeinfo;
  String? playtime;
  String? program;
  String? progresstype;
  String? sponsor1;
  String? sponsor1tel;
  String? sponsor2;
  String? sponsor2tel;
  String? subevent;
  String? usetimefestival;
  String? chkbabycarriage;
  String? chkcreditcard;
  String? chkpet;
  String? expguide;
  int? heritage1;
  int? heritage2;
  int? heritage3;
  String? infocenter;
  String? parking;
  String? restdate;
  String? usetime;
  String? chkbabycarriageculture;
  String? chkcreditcardculture;
  String? chkpetculture;
  String? infocenterculture;
  String? parkingculture;
  String? parkingfee;
  String? restdateculture;
  String? scale;
  String? usefee;
  String? usetimeculture;
  String? distance;
  String? schedule;
  String? taketime;
  String? theme;
  String? chkbabycarriageleports;
  String? chkcreditcardleports;
  String? chkpetleports;
  String? infocenterleports;
  String? parkingfeeleports;
  String? parkingleports;
  String? reservation;
  String? restdateleports;
  String? usefeeleports;
  String? usetimeleports;
  String? accomcountlodging;
  int? barbecue;
  int? beauty;
  int? benikia;
  int? beverage;
  int? bicycle;
  int? campfire;
  String? checkintime;
  String? checkouttime;
  int? fitness;
  String? foodplace;
  int? goodstay;
  int? hanok;
  String? infocenterlodging;
  int? karaoke;
  String? parkinglodging;
  int? publicbath;
  int? publicpc;
  String? reservationlodging;
  int? roomcount;
  String? roomtype;
  int? sauna;
  int? seminar;
  int? sports;
  String? subfacility;
  String? chkbabycarriageshopping;
  String? chkcreditcardshopping;
  String? chkpetshopping;
  String? infocentershopping;
  String? opentime;
  String? parkingshopping;
  String? restdateshopping;
  String? saleitem;
  String? saleitemcost;
  String? shopguide;
  String? chkcreditcardfood;
  String? discountinfofood;
  String? firstmenu;
  String? infocenterfood;
  int? kidsfacility;
  int? lcnsno;
  String? opentimefood;
  String? parkingfood;
  String? restdatefood;
  String? treatmenu;
  String? infocentertourcourse;
  String? openperiod;
  String? chkcooking;
  String? reservationurl;
  String? culturecenter;
  String? fairday;
  String? opendateshopping;
  String? reservationfood;

  DetailIntroItem({
    this.bookingplace,
    this.contentid,
    this.contenttypeid,
    this.discountinfofestival,
    this.eventenddate,
    this.eventplace,
    this.eventstartdate,
    this.festivaltype,
    this.placeinfo,
    this.playtime,
    this.program,
    this.progresstype,
    this.sponsor1,
    this.sponsor1tel,
    this.sponsor2,
    this.sponsor2tel,
    this.subevent,
    this.usetimefestival,
    this.chkbabycarriage,
    this.chkcreditcard,
    this.chkpet,
    this.expguide,
    this.heritage1,
    this.heritage2,
    this.heritage3,
    this.infocenter,
    this.parking,
    this.restdate,
    this.usetime,
    this.chkbabycarriageculture,
    this.chkcreditcardculture,
    this.chkpetculture,
    this.infocenterculture,
    this.parkingculture,
    this.parkingfee,
    this.restdateculture,
    this.scale,
    this.usefee,
    this.usetimeculture,
    this.distance,
    this.schedule,
    this.taketime,
    this.theme,
    this.chkbabycarriageleports,
    this.chkcreditcardleports,
    this.chkpetleports,
    this.infocenterleports,
    this.parkingfeeleports,
    this.parkingleports,
    this.reservation,
    this.restdateleports,
    this.usefeeleports,
    this.usetimeleports,
    this.accomcountlodging,
    this.barbecue,
    this.beauty,
    this.benikia,
    this.beverage,
    this.bicycle,
    this.campfire,
    this.checkintime,
    this.checkouttime,
    this.fitness,
    this.foodplace,
    this.goodstay,
    this.hanok,
    this.infocenterlodging,
    this.karaoke,
    this.parkinglodging,
    this.publicbath,
    this.publicpc,
    this.reservationlodging,
    this.roomcount,
    this.roomtype,
    this.sauna,
    this.seminar,
    this.sports,
    this.subfacility,
    this.chkbabycarriageshopping,
    this.chkcreditcardshopping,
    this.chkpetshopping,
    this.infocentershopping,
    this.opentime,
    this.parkingshopping,
    this.restdateshopping,
    this.saleitem,
    this.saleitemcost,
    this.shopguide,
    this.chkcreditcardfood,
    this.discountinfofood,
    this.firstmenu,
    this.infocenterfood,
    this.kidsfacility,
    this.lcnsno,
    this.opentimefood,
    this.parkingfood,
    this.restdatefood,
    this.treatmenu,
    this.infocentertourcourse,
    this.openperiod,
    this.chkcooking,
    this.reservationurl,
    this.culturecenter,
    this.fairday,
    this.opendateshopping,
    this.reservationfood,
  });

  factory DetailIntroItem.fromJson(Map<String, dynamic> json) => _$DetailIntroItemFromJson(json);

  Map<String, dynamic> toJson() => _$DetailIntroItemToJson(this);
}
