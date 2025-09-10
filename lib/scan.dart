// // import 'package:barcode_scan/barcode_scan.dart';
// import 'package:barcode_scan2/barcode_scan2.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:qr_attendance_app/attendance.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:fluttertoast/fluttertoast.dart';

// class AttendanceSchema {
//   final String cid;
//   final String sid;
//   final DateTime scantime;

//   AttendanceSchema(this.cid, this.sid, this.scantime);

//   Map toJson() => {
//         'classid': cid,
//         'studentid': sid,
//         'scantime': scantime,
//       };
// }

// class ScanPage extends StatefulWidget {
//   final String sid;

//   ScanPage(this.sid);

//   @override
//   _ScanPageState createState() => _ScanPageState(sid);
// }

// class _ScanPageState extends State<ScanPage> {
//   String sid;

//   _ScanPageState(this.sid);

//   String qrCodeResult = "Scan The QR for Attendance";
//   DateTime start;
//   DateTime end;
//   Map? _response;

//   dynamic myEncode(dynamic item) {
//     if (item is DateTime) {
//       return item.toIso8601String();
//     }
//     return item;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         flexibleSpace: Container(
//           decoration: BoxDecoration(
//               gradient: LinearGradient(
//                   begin: Alignment.centerLeft,
//                   end: Alignment.centerRight,
//                   stops: [0.5, 1],
//                   colors: [Color(0xff661EFF), Color(0xffFFA3FD)])),
//         ),
//         title: Text(
//           "QR Scanner",
//           style: TextStyle(fontFamily: "Poppins", fontWeight: FontWeight.bold),
//         ),
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//           padding: EdgeInsets.all(20.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: <Widget>[
//               new Padding(padding: const EdgeInsets.only(top: 20)),
//               Center(
//                   child: Text(
//                 'Scan the QR',
//                 style: TextStyle(
//                     fontFamily: 'Poppins',
//                     fontSize: 32,
//                     fontWeight: FontWeight.w700),
//               )),
//               new Padding(padding: const EdgeInsets.only(top: 5)),
//               Center(
//                   child: Text(
//                 'for',
//                 style: TextStyle(
//                     fontFamily: 'Poppins',
//                     fontSize: 32,
//                     fontWeight: FontWeight.w700),
//               )),
//               new Padding(padding: const EdgeInsets.only(top: 5)),
//               Center(
//                   child: Text(
//                 'Attendance',
//                 style: TextStyle(
//                     fontFamily: 'Poppins',
//                     fontSize: 32,
//                     fontWeight: FontWeight.w700),
//               )),
//               new Padding(padding: const EdgeInsets.only(top: 20)),
//               new Divider(
//                 height: 3,
//                 thickness: 2,
//                 color: Color(0xff6C63FF),
//               ),
//               new Padding(padding: const EdgeInsets.only(top: 20)),
//               TextButton(
//                 padding: EdgeInsets.all(15.0),
//                 onPressed: () async {
//                   var result = await BarcodeScanner.scan();
//                   String codeScanner = result.rawContent;
//                   setState(() {
//                     qrCodeResult = codeScanner;
//                   });
//                   var details = codeScanner.split(",");
//                   print(details);
//                   start = DateTime.parse(details[0]);
//                   end = DateTime.parse(details[1]);

//                   AttendanceSchema s1 =
//                       new AttendanceSchema(details[4], sid, DateTime.now());
//                   Map data = s1.toJson();
//                   print(data);

//                   String body1 = json.encode(data, toEncodable: myEncode);

//                   print(body1);
//                   var client = http.Client();
//                   print(client.hashCode);
//                   try {
//                     var uriResponse = await client.post(
//                       Uri.parse('SERVER ATTENDANCE ENDPOINT'),
//                       headers: {"Content-Type": "application/json;charset=UTF-8"},
//                       body: body1,
//                     );
//                     // print('sent');
//                     // print(uriResponse.body);
//                     _response = json.decode(uriResponse.body);
//                   } finally {
//                     if (_response["present"]) {
//                       Fluttertoast.showToast(
//                         msg: "Attendace added for class " + details[2],
//                         toastLength: Toast.LENGTH_SHORT,
//                         gravity: ToastGravity.SNACKBAR,
//                         fontSize: 20.0,
//                       );
//                     } else {
//                       Fluttertoast.showToast(
//                         msg: "you have scanned late please contact the faculty",
//                         toastLength: Toast.LENGTH_SHORT,
//                         gravity: ToastGravity.SNACKBAR,
//                         fontSize: 20.0,
//                       );
//                     }
//                   }
//                 },
//                 child: Text(
//                   "Open Scanner",
//                   style: TextStyle(
//                       color: Color(0xffF7F7FC),
//                       fontFamily: "Poppins",
//                       fontWeight: FontWeight.w600),
//                 ),
//                 color: Color(0xff5F2EEA),
//                 shape: RoundedRectangleBorder(
//                    // side: BorderSide(color: Colors.blue, width: 3.0),
//                     borderRadius: BorderRadius.circular(40.0)),
//               ),
//               new Padding(padding: const EdgeInsets.only(top: 20)),
//               TextButton("Check Attendance", AttendancePage(_response)),
//               new Padding(padding: const EdgeInsets.only(top: 35)),
//               SvgPicture.asset(
//                 "assets/phone.svg",
//                 height: 282,
//                 width: 342,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget TextButton(String text, Widget widget) {
//     return TextButton(
//       padding: EdgeInsets.all(15.0),
//       onPressed: () async {
//         //  AttendanceSchema s1 = new AttendanceSchema(
//         //      "show attendance", sid, DateTime.now());
//         //   Map data = s1.toJson();

//         //   String body1 = json.encode(data, toEncodable: myEncode);
//         //   print(body1);

//         var client = http.Client();
//         print(client.hashCode);
//         try {
//           var uriResponse = await client.get(
//             Uri.parse('SERVER ENDPOINT TO GET ATTENDANCE OF SID'),
//             headers: {"Content-Type": "application/json;charset=UTF-8"},
//           );
//           print('sent');
//           // print(uriResponse.body);
//           Map _response = json.decode(uriResponse.body);
//           Navigator.of(context).push(MaterialPageRoute(
//               builder: (context) => AttendancePage(_response)));
//         } finally {
//           client.close();
//         }
//       },
//       child: Text(
//         text,
//         style: TextStyle(
//             color: Color(0xffF7F7FC),
//             fontFamily: "Poppins",
//             fontWeight: FontWeight.w600),
//       ),
//       color: Color(0xff5F2EEA),
//       shape: RoundedRectangleBorder(
//           //side: BorderSide(color: Colors.blue, width: 3.0),
//           borderRadius: BorderRadius.circular(40.0)),
//     );
//   }
// }

import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qr_attendance_app/attendance.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';

class AttendanceSchema {
  final String cid;
  final String sid;
  final DateTime scantime;

  AttendanceSchema(this.cid, this.sid, this.scantime);

  Map<String, dynamic> toJson() => {
        'classid': cid,
        'studentid': sid,
        'scantime': scantime.toIso8601String(),
      };
}

class ScanPage extends StatefulWidget {
  final String sid;

  ScanPage(this.sid);

  @override
  _ScanPageState createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  late String sid;
  String qrCodeResult = "Scan The QR for Attendance";
  DateTime? start;
  DateTime? end;
  Map<String, dynamic>? _response;

  _ScanPageState() : sid = "";

  @override
  void initState() {
    super.initState();
    sid = widget.sid;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  stops: [0.5, 1],
                  colors: [Color(0xff661EFF), Color(0xffFFA3FD)])),
        ),
        title: const Text(
          "QR Scanner",
          style: TextStyle(fontFamily: "Poppins", fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const SizedBox(height: 20),
              const Center(
                  child: Text(
                'Scan the QR',
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 32,
                    fontWeight: FontWeight.w700),
              )),
              const Center(
                  child: Text(
                'for',
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 32,
                    fontWeight: FontWeight.w700),
              )),
              const Center(
                  child: Text(
                'Attendance',
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 32,
                    fontWeight: FontWeight.w700),
              )),
              const SizedBox(height: 20),
              const Divider(
                height: 3,
                thickness: 2,
                color: Color(0xff6C63FF),
              ),
              const SizedBox(height: 20),
              buildScanButton(),
              const SizedBox(height: 20),
              buildCheckAttendanceButton(),
              const SizedBox(height: 35),
              SvgPicture.asset(
                "assets/phone.svg",
                height: 282,
                width: 342,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildScanButton() {
    return TextButton(
      onPressed: () async {
        try {
          var result = await BarcodeScanner.scan();
          String codeScanner = result.rawContent;
          if (codeScanner.isEmpty) return;

          setState(() {
            qrCodeResult = codeScanner;
          });

          var details = codeScanner.split(",");
          if (details.length < 5) {
            Fluttertoast.showToast(
                msg: "Invalid QR code",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.SNACKBAR,
                fontSize: 14.0);
            return;
          }

          start = DateTime.parse(details[0]);
          end = DateTime.parse(details[1]);

          AttendanceSchema s1 =
              AttendanceSchema(details[4], sid, DateTime.now());
          Map<String, dynamic> data = s1.toJson();

          var client = http.Client();
          try {
            var uriResponse = await client.post(
              Uri.parse('SERVER ATTENDANCE ENDPOINT'),
              headers: {"Content-Type": "application/json;charset=UTF-8"},
              body: json.encode(data),
            );
            _response = json.decode(uriResponse.body);

            if (_response?["present"] == true) {
              Fluttertoast.showToast(
                msg: "Attendance added for class ${details[2]}",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.SNACKBAR,
                fontSize: 16.0,
              );
            } else {
              Fluttertoast.showToast(
                msg: "You have scanned late, please contact the faculty",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.SNACKBAR,
                fontSize: 16.0,
              );
            }
          } finally {
            client.close();
          }
        } catch (e) {
          Fluttertoast.showToast(
              msg: "Error scanning QR code",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.SNACKBAR,
              fontSize: 14.0);
        }
      },
      style: TextButton.styleFrom(
        backgroundColor: const Color(0xff5F2EEA),
        padding: const EdgeInsets.all(15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      ),
      child: const Text(
        "Open Scanner",
        style: TextStyle(
            color: Color(0xffF7F7FC),
            fontFamily: "Poppins",
            fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget buildCheckAttendanceButton() {
    return TextButton(
      onPressed: () async {
        var client = http.Client();
        try {
          var uriResponse = await client.get(
            Uri.parse('SERVER ENDPOINT TO GET ATTENDANCE OF SID'),
            headers: {"Content-Type": "application/json;charset=UTF-8"},
          );
          Map<String, dynamic> response = json.decode(uriResponse.body);
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => AttendancePage(response)));
        } finally {
          client.close();
        }
      },
      style: TextButton.styleFrom(
        backgroundColor: const Color(0xff5F2EEA),
        padding: const EdgeInsets.all(15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      ),
      child: const Text(
        "Check Attendance",
        style: TextStyle(
            color: Color(0xffF7F7FC),
            fontFamily: "Poppins",
            fontWeight: FontWeight.w600),
      ),
    );
  }
}
