extension IntParser on String {
  int toInt() => int.tryParse(this) ?? 0;
}

extension DoubleParser on String {
  double toDouble() => double.tryParse(this) ?? 0.0;
}
