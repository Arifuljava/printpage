
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
class printpagedesign extends StatefulWidget {
  const printpagedesign({super.key});

  @override
  State<printpagedesign> createState() => _printpagedesignState();
}
String itemmm="A203";

class _printpagedesignState extends State<printpagedesign> {
  TextEditingController widthcontroller=new TextEditingController();
  TextEditingController heightcontroller=new TextEditingController();
  int selectedItemIndex = 0;
  List<String> items = [
    'A203',
    'B32',
    'B32R',
    'A63',
    'B1',
    "B18",
    "P18",
    "Hi-D110",
    "B21S",
    "B21",
    "Betty",
    "T2S",
    "Fust",
    "T8S",
    "Dxx",
    "P1",
    "A20",
    "A8",
    "P1S",
    "S6",
    "B3S",
    "D11S","Z401","D101","T8","B50W","S1","T7","T6","S3","Jc-M90","D41","B203","B16","D61","B3","D110","JCB3S","Hi-NB-D11","B11","B50","D11"
  ];

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
                      itemmm=selectedValue;

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
  Timer? _timer;

  int _counter = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      // Update the state variable
      setState(() {
        _counter++;


        //  print("gettt");

        //print(widget.data2);
      });
    });
  }
  @override
  void dispose() {
    // Cancel the timer to avoid memory leaks
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: AppBar(
          title: Text("Print  Page Design"),
        ),
        body: Column(
          children: [
            Container(
              width: double.infinity,
              height: 60,
              margin: EdgeInsets.only(left: 10,right: 10,top: 20),
              padding: EdgeInsets.all(10),
             decoration: BoxDecoration(
               color: Colors.white70,

               borderRadius: BorderRadius.circular(10),
               
             ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
               Container(
                 margin: EdgeInsets.only(left: 10),
                 padding: EdgeInsets.zero,

                 alignment: Alignment.centerLeft,
                 child: Text("Printer",style: TextStyle(fontWeight: FontWeight.bold),),
               ),
                  Container(
                    margin: EdgeInsets.only(right: 10),

                    alignment: Alignment.centerRight,

                    child: Row(
                       children: [
                         GestureDetector(
                           onTap: (){
                             _showPickerDialog(context);
                           },
                           child: Text(
                             "$itemmm",
                             style: TextStyle(color: Colors.black54),
                           ),
                         ),
                         GestureDetector(
                           onTap: (){
                             _showPickerDialog(context);
                           },child: Icon(
                           Icons.arrow_forward_ios,size: 15,
                           color: Colors.black54,
                         ),
                         )
                       ],
                    ),
                  )
                ],
              ),

            ),

            //second
            Container(
              width: double.infinity,
              height: 60,
              margin: EdgeInsets.only(left: 10,right: 10,top: 10),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white70,

                borderRadius: BorderRadius.circular(10),

              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    padding: EdgeInsets.zero,

                    alignment: Alignment.centerLeft,
                    child: Text("Width(mm)",style: TextStyle(fontWeight: FontWeight.bold),),
                  ),
        Container(
          margin: EdgeInsets.only(right: 10),
          alignment: Alignment.centerRight,
          width: 50, // Set a specific width for the Container
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  maxLines: 1,
                  keyboardType: TextInputType.number,

                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "30",
                      alignLabelWithHint: true

                  ),
                  controller: widthcontroller,
                ),
              ),
            ],
          ),
        ),

          ],
              ),

            ),
            //thiord
            Container(
              width: double.infinity,
              height: 60,
              margin: EdgeInsets.only(left: 10,right: 10,bottom: 10,top: 10),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white70,

                borderRadius: BorderRadius.circular(10),

              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    padding: EdgeInsets.zero,

                    alignment: Alignment.centerLeft,
                    child: Text("Height(mm)",style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    alignment: Alignment.centerRight,
                    width: 50, // Set a specific width for the Container
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            maxLines: 1,
                            keyboardType: TextInputType.number,

                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "12",
                                alignLabelWithHint: true

                            ),
                            controller: heightcontroller,
                          ),
                        ),
                      ],
                    ),
                  ),

                ],
              ),

            ),
            //button
            Container(
                width: double.infinity,
                height: 60,
                margin: EdgeInsets.only(left: 10,right: 10,bottom: 10,top: 10),
                padding: EdgeInsets.all(10),child: ElevatedButton(onPressed: () {



                  if(widthcontroller.text==null|| widthcontroller.text==""|| heightcontroller.text==null||heightcontroller.text=="")
                    {
                      if(heightcontroller.text==null||heightcontroller.text=="")
                        {
                          print("height must be given");
                        }
                      else if(widthcontroller.text==null|| widthcontroller.text=="")
                        {
                          print("Wight must be given");
                        }
                    }
                  else{
                    print("gooo");

                  }

            }, style: ElevatedButton.styleFrom(
              primary: Color(0xff004368), // Set the background color here
            ),child: Text("OK"),
              
            ),
            )
          ],
        ),
      ),
    );
  }
}


