import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController textController = TextEditingController();
  String KEYNAME = 'NAME';
  String nameValue = "No value saved";

  @override
  void initState() {
    super.initState();
    getValue();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shared Preferences'),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: textController,
            ),
            SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                saveValue(textController.text);
              },
              child: Text('Save'),
            ),
            SizedBox(height: 15),
            Text(nameValue),
          ],
        ),
      ),
    );
  }

  void saveValue(String value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(KEYNAME, value);
    setState(() {
      nameValue = value;
    });
  }

  void getValue() async {
    final prefs = await SharedPreferences.getInstance();
    final getName = prefs.getString(KEYNAME);
    setState(() {
      nameValue = getName ?? "No value saved";
    });
  }
}
