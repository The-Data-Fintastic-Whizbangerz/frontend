class Chart {
  final DateTime x;
  double? y;
  double? low;
  double? high;
  double? open;
  double? close;
  Chart({
    required this.x,
    this.y,
    this.low,
    this.high,
    this.open,
    this.close,
  });
}
