import 'package:arctobt_app/backend/device_list.dart';
import 'package:arctobt_app/backend/session.dart';
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
  bool _connected = false;
  int? _index;
  List<dynamic>? _device_list;

  @override
  Widget build(BuildContext context) {
    List<dynamic> _devices = DeviceList.fromJson(widget.paireds).devices ?? <DeviceModel>[];
    _device_list = _devices;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('연결 페이지'),
          centerTitle: true,
          elevation: 0,
          leading: const IconButton(icon: Icon(Icons.find_replace), onPressed: null,),
          actions: [
            IconButton(
              onPressed: () async {
                print(_index);
                _connected ?
                  await disconnect()
                  : print("null");
              },
              icon: Icon(_connected ? Icons.check_circle : Icons.circle, color: _connected ? Colors.green : Colors.grey )
            )
          ],
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
                  onTap: () async {
                    _connected ?
                        print('null') :
                        await connect(index: index);
                  },
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider();
              },
            ),
            const Divider(),
            const SizedBox(height: 20,),
          ],
        )
      ),
    );
  }

  Future<dynamic> connect({required int index}) async {
    var data = {
      "key": widget.loginKey,
      "mac_addr": _device_list?[index].mac_address
    };
    final String result = await Session().post(url: 'http://192.168.219.101:5000/connect', data: data);
    if(result == 'Done!') {
      setState(() {
        _connected = true;
        _index = index;
      });
    }
    else {
      print("Fail");
    }
  }

  Future<dynamic> disconnect() async {
    var data = {
      "key": widget.loginKey,
      "mac_addr": _device_list?[_index!].mac_address
    };
    final String result = await Session().post(url: 'http://192.168.219.101:5000/disconnect', data: data);
    if(result == 'Done!') {
      setState(() {
        _connected = true;
        _index = null;
      });
    }
    else {
      print("Fail");
    }
  }
}
