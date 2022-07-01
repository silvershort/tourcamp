class NumberUtil {
  static String distance(int rawDist) {
    int km = rawDist ~/ 1000;
    int decimalM = rawDist % 1000;
    if (km > 0) {
      return "$km.$decimalM KM";
    } else {
      return "$rawDist M";
    }
  }
}