
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(MaterialApp(
    home: PickerSettingsScreen(),
  ));
}

class PickerSettingsScreen extends StatefulWidget {
  @override
  _PickerSettingsScreenState createState() => _PickerSettingsScreenState();
}

class _PickerSettingsScreenState extends State<PickerSettingsScreen> {
  bool showPicker = false;

  void _showPickerDialog() {
    setState(() {
      showPicker = true;
    });
  }

  void _hidePickerDialog() {
    setState(() {
      showPicker = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Picker Settings'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _showPickerDialog,
          child: Text('Open Picker'),
        ),
      ),
      bottomSheet: showPicker
          ? Container(
        height: 300, // Adjust the height according to your needs
        child: pickersettings(),
      )
          : null,
    );
  }
}

class pickersettings extends StatefulWidget {
  const pickersettings({Key? key});

  @override
  State<pickersettings> createState() => _pickersettingsState();
}

class _pickersettingsState extends State<pickersettings> {
  int selectedItemIndex = 0;
  List<String> items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade200,

        body: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.white70,
                borderRadius: BorderRadius.circular(15)
              ),
              height: 150,
              width: double.infinity,
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white70
                    ),
                    height: 150,
                    width: double.infinity,
                    child: CupertinoPicker(
                      itemExtent: 32.0,
                      onSelectedItemChanged: (int index) {
                        setState(() {
                          selectedItemIndex = index;
                        });
                      },
                      children: List<Widget>.generate(items.length, (int index) {
                        return Center(
                          child: Text(
                            items[index],
                            style: TextStyle(fontSize: 20.0),
                          ),
                        );
                      }),
                    ),
                  )
                ],
              ),
            ),

          ],

        ),
        bottomNavigationBar: BottomAppBar(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Selected Item: ${items[selectedItemIndex]}',
              style: TextStyle(fontSize: 18.0),
            ),
          ),
        ),
      ),
    );
  }
}
