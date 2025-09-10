// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:qr_attendance_app/login_student.dart';
// import 'package:qr_attendance_app/login_admin.dart';
// import 'package:http/http.dart' as http;


// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         flexibleSpace: Container(
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               begin: Alignment.centerLeft,
//               end: Alignment.centerRight,
//               stops: [0.5,1],
              
//               colors: [Color(0xff661EFF), Color(0xffFFA3FD)])),
          
//           ),
//         title: Text("QR ATTENDANCE SYSTEM",style: TextStyle(fontFamily: "Poppins",fontWeight: FontWeight.bold),),
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//               child: Container(

//           //padding: EdgeInsets.all(20.0),
//           child: Column(

//             children: <Widget>[

//               new Padding(padding: const EdgeInsets.only(top: 15)),
//                Image.asset("assets/home.png",height : 340,
//                  width: 181,),
//               new Padding(padding: const EdgeInsets.only(top: 30)),
//               Container(
//                 padding: const EdgeInsets.all(50),
//                 child: new Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.stretch,
//                   children:<Widget> [
//                     TextButton("Login for Student", LoginStudentPage()),
// // // SizedBox(
// // //   height: 20.0,
//                     new Padding(padding: const EdgeInsets.only(top: 50)),

//                     new Divider(height: 10,thickness: 1.0,color: Color(0xff6C63FF),indent:80 ,endIndent: 80,),

//                     new Padding(padding: const EdgeInsets.only(top: 50)),
// // // ),
//                   TextButton("Login for Teacher", LoginAdminPage()),

//                   ],
//                 ),
//               )
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
//         var client = http.Client();

//         try {
//           await client.get(
//             Uri.parse('SERVER ENDPOINT'),
//           );
//         } finally {
//           client.close();
//           Navigator.of(context)
//               .push(MaterialPageRoute(builder: (context) => widget));
//         }
//       },
//       child: Text(
//         text,
//         style: TextStyle(color: Color(0xffF7F7FC),fontFamily: "Poppins", fontWeight:FontWeight.w600),
//       ),
//       color: Color(0xff5F2EEA),
//       shape: RoundedRectangleBorder(
//           //side: BorderSide(color: Colors.blue, width: 3.0),
//           borderRadius: BorderRadius.circular(40.0)),

//     );
//   }
// }


// // TextButton("Login for Student", LoginStudentPage()),
// // // SizedBox(
// // //   height: 20.0,
// // new Padding(padding: const EdgeInsets.only(top: 30)),
// // // ),
// // TextButton("Login for Admin", LoginAdminPage()),


import 'package:flutter/material.dart';
import 'package:qr_attendance_app/login_student.dart';
import 'package:qr_attendance_app/login_admin.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
              colors: [Color(0xff661EFF), Color(0xffFFA3FD)],
            ),
          ),
        ),
        title: const Text(
          "QR ATTENDANCE SYSTEM",
          style: TextStyle(fontFamily: "Poppins", fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              const SizedBox(height: 15),
              Image.asset(
                "assets/home.png",
                height: 340,
                width: 181,
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.all(50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    buildTextButton("Login for Student", const LoginStudentPage()),
                    const SizedBox(height: 50),
                    const Divider(
                      height: 10,
                      thickness: 1.0,
                      color: Color(0xff6C63FF),
                      indent: 80,
                      endIndent: 80,
                    ),
                    const SizedBox(height: 50),
                    buildTextButton("Login for Teacher", const LoginAdminPage()),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextButton(String text, Widget page) {
    return TextButton(
      onPressed: () async {
        var client = http.Client();
        try {
          await client.get(Uri.parse('SERVER ENDPOINT'));
        } catch (e) {
          print("Error during request: $e");
        } finally {
          client.close();
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => page));
        }
      },
      style: TextButton.styleFrom(
        backgroundColor: const Color(0xff5F2EEA),
        padding: const EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Color(0xffF7F7FC),
          fontFamily: "Poppins",
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
