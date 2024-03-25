import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SystemDetailsWidget extends StatefulWidget {
  const SystemDetailsWidget({super.key});

  @override
  State<SystemDetailsWidget> createState() => _SystemDetailsWidgetState();
}

class _SystemDetailsWidgetState extends State<SystemDetailsWidget> {
  static const platform = MethodChannel('samples.myChannel');

  String _systemDetail = 'Unknown system details';

  Future<void> _getSystemDetail() async {
    String systemDetail;
    try {
      final String result = await platform.invokeMethod('getSystemDetail');
      systemDetail = '------System Detail------ \n $result .';
    } on PlatformException catch (e) {
      systemDetail = "Failed to get system details : '${e.message}'.";
    }
    setState(() {
      _systemDetail = systemDetail;
    });
  }

  Future<void> _showNativeDialog(String message) async {
    try {
      await platform.invokeMethod('showNativeDialog', {'message': message});
    } on PlatformException catch (e) {
      print("Failed to show native dialog: '${e.message}'.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(_systemDetail),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _getSystemDetail,
            child: const Text('Get System Detail'),
          ),
          ElevatedButton(
            onPressed: () {
              _showNativeDialog('This is a native dialog!');
            },
            child: const Text('Native dialog'),
          ),
        ],
      ),
    );
  }
}
