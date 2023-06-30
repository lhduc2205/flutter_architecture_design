enum BatteryStatus { unknown, unplugged, charging, full }

class BatteryResult {
  const BatteryResult({
    this.level = -1,
    this.status = BatteryStatus.unknown,
  });

  final double level;
  final BatteryStatus status;

  factory BatteryResult.fromJson(Map<Object?, Object?> json) {
    return BatteryResult(
      level: json['level'] != null ? json['level']! as double : -1,
      status: json['status'] != null ? _statusIntToEnum(json['status']! as int) : BatteryStatus.unknown,
    );
  }

  static BatteryStatus _statusIntToEnum(int status) {
    switch (status) {
      case 1:
        return BatteryStatus.unplugged;
      case 2:
        return BatteryStatus.charging;
      case 3:
        return BatteryStatus.full;
      default:
        return BatteryStatus.unknown;
    }
  }

  bool get isBatteryLow => level <= 20;

  @override
  String toString() {
    return {'level': level, 'status': status}.toString();
  }
}
