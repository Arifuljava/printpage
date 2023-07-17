

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class BottomView extends StatefulWidget {
  const BottomView({Key? key});

  @override
  State<BottomView> createState() => _BottomViewState();
}

class _BottomViewState extends State<BottomView> {
  int selectedItemIndex = 0;
  List<String> items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

  /*
  void _showPickerDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext builder) {
        return Container(
          height: 200.0, // Adjust the height as per your requirement
          child: CupertinoPicker(
            itemExtent: 32.0, // Height of each item in the picker
            onSelectedItemChanged: (int index) {
              setState(() {
                selectedItemIndex = index;
                String value = items[selectedItemIndex];
                print(value);
              });

            },
            children: items.map((String item) {
              return Text(item);
            }).toList(),
          ),
        );
      },
    );
  }
   */
  void _showPickerDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext builder) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
               Container(
                 margin: EdgeInsets.all(10),
                 padding: EdgeInsets.all(2),
                 alignment: Alignment.centerLeft,
                 child: GestureDetector(
                   onTap: (){
                     Navigator.pop(context);
                   },
                   child:  Icon(
                     Icons.close,size: 20,
                     color: Colors.black54,
                   ),
                 ),
               ),
                Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(2),
                  alignment: Alignment.centerRight,
                  child:   Text(
                    "Printer",
                    style: TextStyle(color: Colors.black54,fontWeight: FontWeight.bold,fontSize: 15),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(2),

                  alignment: Alignment.centerRight,
                  child:  GestureDetector(
                    onTap: (){
                      String selectedValue = items[selectedItemIndex];
                      print('Selected: $selectedValue');
                      Navigator.pop(context);
                    },
                    child: Icon(

                      Icons.done,size: 20,
                      color: Colors.black54,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: 200.0, // Adjust the height as per your requirement
              child: CupertinoPicker(
                itemExtent: 32.0, // Height of each item in the picker
                onSelectedItemChanged: (int index) {
                  setState(() {
                    selectedItemIndex = index;
                    String value = items[selectedItemIndex];
                    print(value);
                  });
                },
                children: items.map((String item) {
                  return Text(item);
                }).toList(),
              ),
            ),

          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              _showPickerDialog(context);
            },
            child: Text("Show View"),
          ),
        ),
      ),
    );
  }
}
