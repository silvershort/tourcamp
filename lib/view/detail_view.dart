import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:kakaomap_webview/kakaomap_webview.dart';
import 'package:provider/provider.dart';
import 'package:tourcamp/models/detail_intro.dart';
import 'package:tourcamp/models/location_base.dart';
import 'package:tourcamp/view/detail_web_view.dart';
import 'package:tourcamp/view_model/main_view_model.dart';
import 'package:url_launcher/url_launcher_string.dart';

class DetailView extends StatefulWidget {
  const DetailView({Key? key}) : super(key: key);

  @override
  State<DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      LocationBaseItem item = context.read<MainViewModel>().currentItem;
      context.read<MainViewModel>().initDetailData(item.contentid, item.contenttypeid);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("상세화면"),
      ),
      body: Center(
        child: Scrollbar(
          child: SingleChildScrollView(
              child: !context.watch<MainViewModel>().loading && context.watch<MainViewModel>().detailCommon != null
                  ? Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      topItemBlock(),
                      const SizedBox(height: 10.0),
                      middleItemBlock(),
                      const SizedBox(height: 10.0),
                      bottomItemBlock(),
                    ],
                  ))
                  : const Center(
                child: CircularProgressIndicator(),
              )),
        ),
      )
    );
  }

  Widget topItemBlock() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.deepOrange,
            style: BorderStyle.solid,
            width: 1.0,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(2.0))),
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          createImageView(),
          const SizedBox(height: 10.0),
          Text(
            context.read<MainViewModel>().detailCommon!.title,
            style: const TextStyle(fontSize: 18.0),
          ),
          const SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                child: const Text(
                  "구글로 검색",
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (materialContext) => DetailWebView(
                          siteType: SiteType.google,
                          keyword: context.read<MainViewModel>().detailCommon!.title
                      ),
                    ),
                  );
                },
              ),
              ElevatedButton(
                child: const Text(
                  "네이버로 검색",
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (materialContext) => DetailWebView(
                          siteType: SiteType.naver,
                          keyword: context.read<MainViewModel>().detailCommon!.title
                      ),
                    ),
                  );
                },
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget middleItemBlock() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.deepOrange,
            style: BorderStyle.solid,
            width: 1.0,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(2.0))),
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "카카오맵으로 길찾기",
            style: TextStyle(fontSize: 18.0),
          ),
          const SizedBox(height: 10.0),
          KakaoMapView(
              width: double.infinity,
              height: 150.0,
              kakaoMapKey: "9721c89a27cb311a80082f49fedb3933",
              lat: double.parse(context.read<MainViewModel>().currentItem.mapy.toString()),
              lng: double.parse(context.read<MainViewModel>().currentItem.mapx.toString()),
              onTapMarker: (message) {
                //event callback when the marker is tapped
              }),
          const SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                child: const Text(
                  "대중교통",
                ),
                onPressed: () async {
                  String startX = context.read<MainViewModel>().mapX;
                  String startY = context.read<MainViewModel>().mapY;
                  String endX = context.read<MainViewModel>().currentItem.mapx.toString();
                  String endY = context.read<MainViewModel>().currentItem.mapy.toString();
                  await launchUrlString(
                    "kakaomap://route?sp=$startY,$startX&ep=$endY,$endX&by=PUBLICTRANSIT"
                  );
                },
              ),
              ElevatedButton(
                child: const Text(
                  "자가용",
                ),
                onPressed: () async {
                  String startX = context.read<MainViewModel>().mapX;
                  String startY = context.read<MainViewModel>().mapY;
                  String endX = context.read<MainViewModel>().currentItem.mapx.toString();
                  String endY = context.read<MainViewModel>().currentItem.mapy.toString();
                  await launchUrlString(
                      "kakaomap://route?sp=$startY,$startX&ep=$endY,$endX&by=CAR"
                  );
                },
              ),
              ElevatedButton(
                child: const Text(
                  "도보",
                ),
                onPressed: () async {
                  String startX = context.read<MainViewModel>().mapX;
                  String startY = context.read<MainViewModel>().mapY;
                  String endX = context.read<MainViewModel>().currentItem.mapx.toString();
                  String endY = context.read<MainViewModel>().currentItem.mapy.toString();
                  await launchUrlString(
                      "kakaomap://route?sp=$startY,$startX&ep=$endY,$endX&by=FOOT"
                  );
                },
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget bottomItemBlock() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.deepOrange,
            style: BorderStyle.solid,
            width: 1.0,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(2.0))),
      padding: const EdgeInsets.all(10.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: bottomContents()),
    );
  }

  List<Widget> bottomContents() {
    DetailIntroItem item = context.read<MainViewModel>().detailIntro!;
    List<Widget> widgetList = [];
    switch (context.read<MainViewModel>().currentItem.contenttypeid) {
      case 12:
        if ((item.infocenter ?? "").isNotEmpty) {
          widgetList.add(titleAndDesc("문의 및 안내", item.infocenter!));
        }
        if ((item.restdate ?? "").isNotEmpty) {
          widgetList.add(titleAndDesc("쉬는 날", item.restdate!));
        }
        if ((item.usetime ?? "").isNotEmpty) {
          widgetList.add(titleAndDesc("이용시간", item.usetime!));
        }
        if ((item.expguide ?? "").isNotEmpty) {
          widgetList.add(titleAndDesc("체험안내", item.expguide!));
        }
        if ((item.parking ?? "").isNotEmpty) {
          widgetList.add(titleAndDesc("주차시설", item.parking!));
        }
        if ((item.chkpet ?? "").isNotEmpty) {
          widgetList.add(titleAndDesc("애완동물 동반가능 정보", item.chkpet!));
        }
        break;
      case 14:
        if ((item.infocenterculture ?? "").isNotEmpty) {
          widgetList.add(titleAndDesc("문의 및 안내", item.infocenterculture!));
        }
        if ((item.scale ?? "").isNotEmpty) {
          widgetList.add(titleAndDesc("규모", item.scale!));
        }
        if ((item.usefee ?? "").isNotEmpty) {
          widgetList.add(titleAndDesc("이용요금", item.usefee!));
        }
        if ((item.parkingculture ?? "").isNotEmpty) {
          widgetList.add(titleAndDesc("주차시설", item.parkingculture!));
        }
        if ((item.chkpetculture ?? "").isNotEmpty) {
          widgetList.add(titleAndDesc("애완동물 동반가능 정보", item.chkpetculture!));
        }
        break;
      case 15:
        if ((item.placeinfo ?? "").isNotEmpty) {
          widgetList.add(titleAndDesc("행사장 위치안내", item.placeinfo!));
        }
        if ((item.playtime ?? "").isNotEmpty) {
          widgetList.add(titleAndDesc("공연시간", item.playtime!));
        }
        if ((item.program ?? "").isNotEmpty) {
          widgetList.add(titleAndDesc("행사 프로그램", item.program!));
        }
        if ((item.subevent ?? "").isNotEmpty) {
          widgetList.add(titleAndDesc("부대행사", item.subevent!));
        }
        if ((item.bookingplace ?? "").isNotEmpty) {
          widgetList.add(titleAndDesc("예매처", item.bookingplace!));
        }
        if ((item.usetimefestival ?? "").isNotEmpty) {
          widgetList.add(titleAndDesc("이용요금", item.usetimefestival!));
        }
        if ((item.chkpetculture ?? "").isNotEmpty) {
          widgetList.add(titleAndDesc("애완동물 동반가능 정보", item.chkpetculture!));
        }
        break;
      case 25:
        if ((item.infocentertourcourse ?? "").isNotEmpty) {
          widgetList.add(titleAndDesc("문의 및 안내", item.infocentertourcourse!));
        }
        if ((item.distance ?? "").isNotEmpty) {
          widgetList.add(titleAndDesc("코스 총거리", item.distance!));
        }
        if ((item.schedule ?? "").isNotEmpty) {
          widgetList.add(titleAndDesc("코스 일정", item.schedule!));
        }
        if ((item.taketime ?? "").isNotEmpty) {
          widgetList.add(titleAndDesc("코스 총 소요시간", item.taketime!));
        }
        if ((item.theme ?? "").isNotEmpty) {
          widgetList.add(titleAndDesc("코스 테마", item.theme!));
        }
        break;
      case 28:
        if ((item.infocenterleports ?? "").isNotEmpty) {
          widgetList.add(titleAndDesc("문의 및 안내", item.infocenterleports!));
        }
        if ((item.openperiod ?? "").isNotEmpty) {
          widgetList.add(titleAndDesc("개장기간", item.openperiod!));
        }
        if ((item.usetimeleports ?? "").isNotEmpty) {
          widgetList.add(titleAndDesc("이용시간", item.usetimeleports!));
        }
        if ((item.restdateleports ?? "").isNotEmpty) {
          widgetList.add(titleAndDesc("쉬는 날", item.restdateleports!));
        }
        if ((item.reservation ?? "").isNotEmpty) {
          widgetList.add(titleAndDesc("예약 안내", item.reservation!));
        }
        if ((item.usefeeleports ?? "").isNotEmpty) {
          widgetList.add(titleAndDesc("입장료", item.usefeeleports!));
        }
        if ((item.parkingleports ?? "").isNotEmpty) {
          widgetList.add(titleAndDesc("주차시설", item.parkingleports!));
        }
        if ((item.chkpetleports ?? "").isNotEmpty) {
          widgetList.add(titleAndDesc("애완동물 동반가능 정보", item.chkpetleports!));
        }
        break;
      case 32:
        if ((item.infocenterlodging ?? "").isNotEmpty) {
          widgetList.add(titleAndDesc("문의 및 안내", item.infocenterlodging!));
        }
        if ((item.accomcountlodging ?? "").isNotEmpty) {
          widgetList.add(titleAndDesc("수용 가능인원", item.accomcountlodging!));
        }
        if ((item.checkintime ?? "").isNotEmpty) {
          widgetList.add(titleAndDesc("입실 시간", item.checkintime!));
        }
        if ((item.checkouttime ?? "").isNotEmpty) {
          widgetList.add(titleAndDesc("퇴실 시간", item.checkouttime!));
        }
        if ((item.subfacility ?? "").isNotEmpty) {
          widgetList.add(titleAndDesc("부대시설 (기타)", item.subfacility!));
        }
        if ((item.chkcooking ?? "").isNotEmpty) {
          widgetList.add(titleAndDesc("객실 내 취사 여부", item.chkcooking!));
        }
        if ((item.foodplace ?? "").isNotEmpty) {
          widgetList.add(titleAndDesc("식음료장", item.foodplace!));
        }
        if ((item.reservationlodging ?? "").isNotEmpty) {
          widgetList.add(titleAndDesc("예약안내", item.reservationlodging!));
        }
        if ((item.reservationurl ?? "").isNotEmpty) {
          widgetList.add(titleAndDesc("예약안내 홈페이지", item.reservationurl!));
        }
        break;
      case 38:
        if ((item.infocentershopping ?? "").isNotEmpty) {
          widgetList.add(titleAndDesc("문의 및 안내", item.infocentershopping!));
        }
        if ((item.fairday ?? "").isNotEmpty) {
          widgetList.add(titleAndDesc("장서는 날", item.fairday!));
        }
        if ((item.opendateshopping ?? "").isNotEmpty) {
          widgetList.add(titleAndDesc("개장일", item.opendateshopping!));
        }
        if ((item.opentime ?? "").isNotEmpty) {
          widgetList.add(titleAndDesc("영업시간", item.opentime!));
        }
        if ((item.restdateshopping ?? "").isNotEmpty) {
          widgetList.add(titleAndDesc("쉬는날", item.restdateshopping!));
        }
        if ((item.saleitem ?? "").isNotEmpty) {
          widgetList.add(titleAndDesc("판매 품목", item.saleitem!));
        }
        if ((item.shopguide ?? "").isNotEmpty) {
          widgetList.add(titleAndDesc("매장 안내", item.shopguide!));
        }
        if ((item.culturecenter ?? "").isNotEmpty) {
          widgetList.add(titleAndDesc("문화센터 바로가기", item.culturecenter!));
        }
        if ((item.parkingshopping ?? "").isNotEmpty) {
          widgetList.add(titleAndDesc("주차시설", item.parkingshopping!));
        }
        if ((item.chkpetshopping ?? "").isNotEmpty) {
          widgetList.add(titleAndDesc("애완동물 동반가능 정보", item.chkpetshopping!));
        }
        break;
      case 39:
        if ((item.infocenterfood ?? "").isNotEmpty) {
          widgetList.add(titleAndDesc("문의 및 안내", item.infocenterfood!));
        }
        if ((item.opentimefood ?? "").isNotEmpty) {
          widgetList.add(titleAndDesc("영업시간", item.opentimefood!));
        }
        if ((item.restdatefood ?? "").isNotEmpty) {
          widgetList.add(titleAndDesc("쉬는 날", item.restdatefood!));
        }
        if ((item.firstmenu ?? "").isNotEmpty) {
          widgetList.add(titleAndDesc("대표 메뉴", item.firstmenu!));
        }
        if ((item.treatmenu ?? "").isNotEmpty) {
          widgetList.add(titleAndDesc("취급 메뉴", item.treatmenu!));
        }
        if ((item.reservationfood ?? "").isNotEmpty) {
          widgetList.add(titleAndDesc("예약안내", item.reservationfood!));
        }
        if ((item.parkingfood ?? "").isNotEmpty) {
          widgetList.add(titleAndDesc("주차시설", item.parkingfood!));
        }
        break;
    }
    return widgetList;
  }

  Widget titleAndDesc(String title, String desc) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "- $title",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 5.0,
        ),
        HtmlWidget(desc),
        const SizedBox(
          height: 10.0,
        ),
      ],
    );
  }

  Widget createImageView() {
    String url = context.read<MainViewModel>().detailCommon!.firstimage ?? "";
    if (url.isNotEmpty) {
      return ExtendedImage.network(
        url,
        width: double.infinity,
        fit: BoxFit.fitWidth,
      );
    } else {
      return Image.asset(
        "assets/not_found_image.png",
        width: double.infinity,
        fit: BoxFit.fitWidth,
      );
    }
  }
}
