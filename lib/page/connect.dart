import 'package:arctobt_app/backend/device_list.dart';
import 'package:arctobt_app/model/device_model.dart';
import 'package:flutter/material.dart';

class Connect extends StatefulWidget {
  final String loginKey;
  final dynamic paireds;
  const Connect({required this.loginKey, required this.paireds,Key? key}) : super(key: key);

  @override
  State<Connect> createState() => _ConnectState();
}

class _ConnectState extends State<Connect> {
  @override
  Widget build(BuildContext context) {
    List<dynamic> _devices = DeviceList.fromJson(widget.paireds).devices ?? <DeviceModel>[];
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('연결 페이지'),
          centerTitle: true,
          elevation: 0,
          leading: const IconButton(icon: Icon(Icons.find_replace), onPressed: null,),
        ),
        body: Column(
          children: [
            const SizedBox(height: 10,),
            ListView.separated(
              scrollDirection: Axis.vertical,
              itemCount: _devices.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  child: SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Text(_devices[index].name),
                    ),
                  ),
                  onTap: () {

                  },
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return Divider();
              },
            ),
            const Divider(),
            const SizedBox(height: 20,),
          ],
        )
      ),
    );
  }
}
