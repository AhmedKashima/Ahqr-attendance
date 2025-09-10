// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:qr_flutter/qr_flutter.dart';
// import 'package:intl/intl.dart';
// import 'package:flutter/rendering.dart';

// class GeneratePage extends StatefulWidget {
//   final DateTime date;
//   final String cid;
//   final TimeOfDay start;
//   final TimeOfDay end;
//   final String classname;
//   final String id;
//   GeneratePage(
//       this.date, this.start, this.end, this.classname, this.id, this.cid);
//   @override
//   State<StatefulWidget> createState() =>
//       GeneratePageState(date, start, end, classname, id, cid);
// }

// class GeneratePageState extends State<GeneratePage> {
//   DateTime date;
//   TimeOfDay start;
//   TimeOfDay end;
//   String cid;
//   String id;
//   String classname;
//   GeneratePageState(
//       this.date, this.start, this.end, this.classname, this.id, this.cid);

//   String formatTimeOfDay(TimeOfDay tod, DateTime date) {
//     final now = date;
//     final dt = DateTime(now.year, now.month, now.day, tod.hour, tod.minute);
//     final format = DateFormat('yyyy-MM-dd HH:MM:ss');
//     return format.format(dt);
//   }

//   @override
//   Widget build(BuildContext context) {
//     print(cid);
//     String qrData = formatTimeOfDay(start, date) +
//         "," +
//         formatTimeOfDay(end, date) +
//         "," +
//         classname +
//         "," +
//         id +
//         "," +
//         cid;
//     print(qrData);
//     return Scaffold(
//       appBar: AppBar(
//         flexibleSpace: Container(
//           decoration: BoxDecoration(
//               gradient: LinearGradient(
//                   begin: Alignment.centerLeft,
//                   end: Alignment.centerRight,
//                   stops: [0.5,1],

//                   colors: [Color(0xff661EFF), Color(0xffFFA3FD)])),

//         ),
//         title: Text("QR ATTENDANCE SYSTEM",style: TextStyle(fontFamily: "Poppins",fontWeight: FontWeight.bold),),
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//           padding: EdgeInsets.all(20.0),
//           child: Center(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 Center(
//                   child: Container(
//                     height: 339,
//                     width: 405,
//                     child:Center(
//                     child: Container(
//                       height: 339,
//                       width: 405,
//                       child: Center(
//                         child: QrImage(
//                           data: qrData,             // required, your QR string
//                           version: QrVersions.auto, // automatically choose QR version
//                           size: 200.0,              // size in pixels
//                           gapless: false,           // optional
//                         ),
//                       ),
//                     ),
//                   ),

//                 new Padding(padding: const EdgeInsets.only(top: 30)),

//                 new Divider(height: 20,thickness: 1,color: Color(0xff6C63FF),indent: 60,endIndent: 60,),

//                 new Padding(padding: const EdgeInsets.only(top: 30)),

//                Center(
//                  child: Container(
//                    padding: EdgeInsets.only(left: 5),
//                    child: Column(

//                     children : [ Center(
//                       child: Row(
//                       children: [
//                         Center(
//                           child: Container(
//                             height: 45,
//                             width: 170,
//                            // padding: EdgeInsets.only(left: 30),
//                             decoration: BoxDecoration(
//                               color: Color(0xffFCFCFC),
//                               borderRadius: BorderRadius.all(Radius.circular(0)),
//                               border: Border(
//                                 top:  BorderSide(
//                                   color: Colors.purple,
//                                   width: 0.7,
//                                 ),
//                                 bottom:  BorderSide(
//                                   color: Colors.purple,
//                                   width: 0.7,
//                                 ),
//                                 left:  BorderSide(
//                                   color: Colors.purple,
//                                   width: 0.7,
//                                 ),
//                                 right:  BorderSide(
//                                   color: Colors.purple,
//                                   width: 0.7,
//                                 ),
//                               ),
//                             ),

//                             child: Center(
//                               child: Text(
//                                 'Class Name'
//                               ),
//                             ),
//                           ),
//                         ),
//                         Container(
//                           height: 45,
//                           width: 170,

//                           decoration: BoxDecoration(
//                             color: Color(0xffFCFCFC),
//                             borderRadius: BorderRadius.all(Radius.circular(0)),
//                             border: Border(
//                               top:  BorderSide(
//                                 color: Colors.purple,
//                                 width: 0.7,
//                               ),
//                               bottom:  BorderSide(
//                                 color: Colors.purple,
//                                 width: 0.7,
//                               ),
//                               left:  BorderSide(
//                                 color: Colors.purple,
//                                 width: 0.7,
//                               ),
//                               right:  BorderSide(
//                                 color: Colors.purple,
//                                 width: 0.7,
//                               ),
//                             ),
//                           ),

//                           child: Center(
//                             child: Text(
//                                 classname
//                             ),
//                           ),
//                         ),

//                       ],
//                       ),
//                     ),

//                       new Padding(padding: const EdgeInsets.only(top: 20)),

//                       Row(
//                         children: [
//                           Container(
//                             height: 45,
//                             width: 170,

//                             decoration: BoxDecoration(
//                               color: Color(0xffFCFCFC),
//                               borderRadius: BorderRadius.all(Radius.circular(0)),
//                               border: Border(
//                                 top:  BorderSide(
//                                   color: Colors.purple,
//                                   width: 0.7,
//                                 ),
//                                 bottom:  BorderSide(
//                                   color: Colors.purple,
//                                   width: 0.7,
//                                 ),
//                                 left:  BorderSide(
//                                   color: Colors.purple,
//                                   width: 0.7,
//                                 ),
//                                 right:  BorderSide(
//                                   color: Colors.purple,
//                                   width: 0.7,
//                                 ),
//                               ),
//                             ),

//                             child: Center(
//                               child: Text(
//                                   'Class Date'
//                               ),
//                             ),
//                           ),
//                           Container(
//                             height: 45,
//                             width: 170,

//                             decoration: BoxDecoration(
//                               color: Color(0xffFCFCFC),
//                               borderRadius: BorderRadius.all(Radius.circular(0)),
//                               border: Border(
//                                 top:  BorderSide(
//                                   color: Colors.purple,
//                                   width: 0.7,
//                                 ),
//                                 bottom:  BorderSide(
//                                   color: Colors.purple,
//                                   width: 0.7,
//                                 ),
//                                 left:  BorderSide(
//                                   color: Colors.purple,
//                                   width: 0.7,
//                                 ),
//                                 right:  BorderSide(
//                                   color: Colors.purple,
//                                   width: 0.7,
//                                 ),
//                               ),
//                             ),

//                             child: Center(
//                               child: Text(
//                                   formatTimeOfDay(start, date).substring(0,10)
//                               ),
//                             ),
//                           ),

//                         ],
//                       ),

//                       new Padding(padding: const EdgeInsets.only(top: 20)),

//                       Row(
//                         children: [
//                           Container(
//                             height: 45,
//                             width: 170,

//                             decoration: BoxDecoration(
//                               color: Color(0xffFCFCFC),
//                               borderRadius: BorderRadius.all(Radius.circular(0)),
//                               border: Border(
//                                 top:  BorderSide(
//                                   color: Colors.purple,
//                                   width: 0.7,
//                                 ),
//                                 bottom:  BorderSide(
//                                   color: Colors.purple,
//                                   width: 0.7,
//                                 ),
//                                 left:  BorderSide(
//                                   color: Colors.purple,
//                                   width: 0.7,
//                                 ),
//                                 right:  BorderSide(
//                                   color: Colors.purple,
//                                   width: 0.7,
//                                 ),
//                               ),
//                             ),

//                             child: Center(
//                               child: Text(
//                                   'Start time'
//                               ),
//                             ),
//                           ),
//                           Container(
//                             height: 45,
//                             width: 170,

//                             decoration: BoxDecoration(
//                               color: Color(0xffFCFCFC),
//                               borderRadius: BorderRadius.all(Radius.circular(0)),
//                               border: Border(
//                                 top:  BorderSide(
//                                   color: Colors.purple,
//                                   width: 0.7,
//                                 ),
//                                 bottom:  BorderSide(
//                                   color: Colors.purple,
//                                   width: 0.7,
//                                 ),
//                                 left:  BorderSide(
//                                   color: Colors.purple,
//                                   width: 0.7,
//                                 ),
//                                 right:  BorderSide(
//                                   color: Colors.purple,
//                                   width: 0.7,
//                                 ),
//                               ),
//                             ),

//                             child: Center(
//                               child: Text(
//                                   (start.hour.toString()+":"+start.minute.toString())
//                               ),
//                             ),
//                           ),

//                         ],
//                       ),

//                       new Padding(padding: const EdgeInsets.only(top: 20)),

//                       Row(
//                         children: [
//                           Container(
//                             height: 45,
//                             width: 170,

//                             decoration: BoxDecoration(
//                               color: Color(0xffFCFCFC),
//                               borderRadius: BorderRadius.all(Radius.circular(0)),
//                               border: Border(
//                                 top:  BorderSide(
//                                   color: Colors.purple,
//                                   width: 0.7,
//                                 ),
//                                 bottom:  BorderSide(
//                                   color: Colors.purple,
//                                   width: 0.7,
//                                 ),
//                                 left:  BorderSide(
//                                   color: Colors.purple,
//                                   width: 0.7,
//                                 ),
//                                 right:  BorderSide(
//                                   color: Colors.purple,
//                                   width: 0.7,
//                                 ),
//                               ),
//                             ),

//                             child: Center(
//                               child: Text(
//                                   'End time'
//                               ),
//                             ),
//                           ),
//                           Container(
//                             height: 45,
//                             width: 170,

//                             decoration: BoxDecoration(
//                               color: Color(0xffFCFCFC),
//                               borderRadius: BorderRadius.all(Radius.circular(0)),
//                               border: Border(
//                                 top:  BorderSide(
//                                   color: Colors.purple,
//                                   width: 0.7,
//                                 ),
//                                 bottom:  BorderSide(
//                                   color: Colors.purple,
//                                   width: 0.7,
//                                 ),
//                                 left:  BorderSide(
//                                   color: Colors.purple,
//                                   width: 0.7,
//                                 ),
//                                 right:  BorderSide(
//                                   color: Colors.purple,
//                                   width: 0.7,
//                                 ),
//                               ),
//                             ),

//                             child: Center(
//                               child: Text(
//                                   (end.hour.toString()+":"+end.minute.toString())
//                               ),
//                             ),
//                           ),

//                         ],
//                       ),


//                     ],

//                    ),
//                  ),
//                ),


//                 new Padding(padding: const EdgeInsets.only(top: 20)),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   final qrdataFeed = TextEditingController();
// }




// ignore_for_file: duplicate_import

import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:intl/intl.dart';
import 'package:qr_flutter/qr_flutter.dart';

class GeneratePage extends StatefulWidget {
  final DateTime date;
  final String cid;
  final TimeOfDay start;
  final TimeOfDay end;
  final String classname;
  final String id;

  GeneratePage(
      this.date, this.start, this.end, this.classname, this.id, this.cid);

  @override
  State<GeneratePage> createState() =>
      _GeneratePageState(date, start, end, classname, id, cid);
}

class _GeneratePageState extends State<GeneratePage> {
  DateTime date;
  TimeOfDay start;
  TimeOfDay end;
  String cid;
  String id;
  String classname;

  _GeneratePageState(
      this.date, this.start, this.end, this.classname, this.id, this.cid);

  String formatTimeOfDay(TimeOfDay tod, DateTime date) {
    final dt = DateTime(date.year, date.month, date.day, tod.hour, tod.minute);
    final format = DateFormat('yyyy-MM-dd HH:mm:ss'); // minutes = mm
    return format.format(dt);
  }

  @override
  Widget build(BuildContext context) {
    String qrData = [
      formatTimeOfDay(start, date),
      formatTimeOfDay(end, date),
      classname,
      id,
      cid
    ].join(',');

    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  stops: [0.5, 1],
                  colors: [Color(0xff661EFF), Color(0xffFFA3FD)])),
        ),
        title: Text(
          "QR ATTENDANCE SYSTEM",
          style: TextStyle(fontFamily: "Poppins", fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: QrImageView(
                data: qrData,
                version: QrVersions.auto,
                size: 200,
                gapless: false,
              ),
            ),
            SizedBox(height: 30),
            Divider(
              height: 20,
              thickness: 1,
              color: Color(0xff6C63FF),
              indent: 60,
              endIndent: 60,
            ),
            SizedBox(height: 30),
            _buildInfoRow("Class Name", classname),
            SizedBox(height: 20),
            _buildInfoRow("Class Date", formatTimeOfDay(start, date).substring(0, 10)),
            SizedBox(height: 20),
            _buildInfoRow("Start Time", "${start.hour.toString().padLeft(2,'0')}:${start.minute.toString().padLeft(2,'0')}"),
            SizedBox(height: 20),
            _buildInfoRow("End Time", "${end.hour.toString().padLeft(2,'0')}:${end.minute.toString().padLeft(2,'0')}"),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      children: [
        _buildInfoCell(label),
        _buildInfoCell(value),
      ],
    );
  }

  Widget _buildInfoCell(String text) {
    return Expanded(
      child: Container(
        height: 45,
        decoration: BoxDecoration(
          color: Color(0xffFCFCFC),
          border: Border.all(color: Colors.purple, width: 0.7),
        ),
        child: Center(child: Text(text)),
      ),
    );
  }
}
