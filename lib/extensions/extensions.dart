extension StringExtension on String {
  int toInt({vlrPadrao = 0}) {
    return int.tryParse(this) ?? vlrPadrao;
  }

  double toDouble({double vlrPadrao = 0.0}) {
    try {
      return double.parse(this);
    } on Exception catch (_) {
      return vlrPadrao;
    }
  }
}