import 'package:permission_handler/permission_handler.dart';
import 'dart:io';

class PermissionService {
  Future<bool> checkAndRequestPermissions() async {
    if (Platform.isAndroid) {
      Map<Permission, PermissionStatus> statuses = await [
        Permission.location,
        Permission.bluetoothScan,
        Permission.bluetoothConnect,
        Permission.bluetoothAdvertise,
        Permission.nearbyWifiDevices,
      ].request();

      return statuses.values.every((status) => status.isGranted);
    } else if (Platform.isIOS) {
      Map<Permission, PermissionStatus> statuses = await [
        Permission.bluetooth,
        Permission.location,
      ].request();

      return statuses.values.every((status) => status.isGranted);
    }
    return true;
  }

  Future<bool> isLocationEnabled() async {
    return await Permission.location.serviceStatus.isEnabled;
  }

  Future<void> openSettings() async {
    await openAppSettings();
  }
}
