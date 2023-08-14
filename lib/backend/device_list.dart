import 'package:arctobt_app/model/device_model.dart';

class DeviceList {
  final List<DeviceModel>? devices;
  DeviceList({this.devices});

  factory DeviceList.fromJson(List<dynamic> jsonString) {
    List<DeviceModel> devices = <DeviceModel>[];

    devices = jsonString.map((device) => DeviceModel.fromJSON(device)).toList();
    return DeviceList(devices: devices);
  }
}