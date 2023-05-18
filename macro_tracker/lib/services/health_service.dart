import 'package:health/health.dart';

class HealthService {
  HealthService();

  Future addToHealth(double amount, HealthDataType type, DateTime datetime) async {
  HealthFactory health = HealthFactory();

    var types = [
      HealthDataType.DIETARY_ENERGY_CONSUMED,
      HealthDataType.DIETARY_CARBS_CONSUMED,
      HealthDataType.DIETARY_PROTEIN_CONSUMED,
      HealthDataType.DIETARY_FATS_CONSUMED,
    ];

  var permissions = [
    HealthDataAccess.READ_WRITE,
    HealthDataAccess.READ_WRITE,
    HealthDataAccess.READ_WRITE,
    HealthDataAccess.READ_WRITE,
  ];

    // requesting access to the data types before reading them
    bool requested = await health.requestAuthorization(types, permissions: permissions);
    print("Request for Health value $requested");
    if (!requested) return false;
    //bool requested = await health.requestAuthorization(types);

    //var now = DateTime.now();
    bool success = false;
    try {
      success = await health.writeHealthData(amount, type, datetime, datetime);
      print("Inserting $amount $type in health = $success");
    } catch (e) {
      print("Error inserting Health Data: $e.");
    }
    return success;
}

Future removeFromHealth(HealthDataType type, DateTime datetime) async {
    HealthFactory health = HealthFactory();

    var types = [
      HealthDataType.DIETARY_ENERGY_CONSUMED,
      HealthDataType.DIETARY_CARBS_CONSUMED,
      HealthDataType.DIETARY_PROTEIN_CONSUMED,
      HealthDataType.DIETARY_FATS_CONSUMED,
    ];

    var permissions = [
    HealthDataAccess.READ_WRITE,
    HealthDataAccess.READ_WRITE,
    HealthDataAccess.READ_WRITE,
    HealthDataAccess.READ_WRITE,
    ];

    // requesting access to the data types before reading them
    bool requested = await health.requestAuthorization(types, permissions: permissions);
    print("Request for Health value $requested");
    if (!requested) return false;
    DateTime startTime = datetime.subtract(const Duration(milliseconds: 5));
    DateTime stopTime = datetime.add(const Duration(milliseconds: 5));
    return health.delete(type, startTime, stopTime);
}
}