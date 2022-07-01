class ContentTypeId {
  static String convert(int type) {
    switch (type) {
      case 12:
        return "관광지";
      case 14:
        return "문화시설";
      case 15:
        return "행사/공연/축제";
      case 25:
        return "여행코스";
      case 28:
        return "레포츠";
      case 32:
        return "숙박";
      case 38:
        return "쇼핑";
      case 39:
        return "음식점";
      default:
        return "분류없음";
    }
  }
}