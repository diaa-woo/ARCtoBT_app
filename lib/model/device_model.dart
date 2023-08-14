class DeviceModel {
  String? mac_address;
  String? name;

  DeviceModel({
    this.mac_address,
    this.name
  });

  factory DeviceModel.fromJSON(Map<String, dynamic> jsonData) {
    return DeviceModel(
      mac_address: jsonData["mac_address"],
      name: jsonData["name"]
    );
  }
}