// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'landing_page.dart';
// import 'after_login.dart';

// class User {
//   final String username;
//   final String email;
//   final int id;

//   User({
//     required this.username,
//     required this.email,
//     required this.id,
//   });
// }

// class LoginPage extends StatefulWidget {
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   TextEditingController usernameController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   int? petaniId;
//   bool _isObscure = true;

//   void _togglePasswordVisibility() {
//     setState(() {
//       _isObscure = !_isObscure;
//     });
//   }

//   Future<void> login() async {
//     if (_formKey.currentState!.validate()) {
//       final String url = 'http://127.0.0.1:8000/api/login';

//       showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             content: Row(
//               children: [
//                 CircularProgressIndicator(),
//                 SizedBox(width: 20),
//                 Text("Sedang login..."),
//               ],
//             ),
//           );
//         },
//         barrierDismissible: false,
//       );

//       final Map<String, String> data = {
//         'username': usernameController.text,
//         'password': passwordController.text,
//       };

//       try {
//         final response = await http.post(
//           Uri.parse(url),
//           body: data,
//         );

//         Navigator.of(context).pop();

//         if (response.statusCode == 200) {
//           final Map<String, dynamic> result = json.decode(response.body);

//           if (result['success'] == true) {
//             User user = User(
//               username: result['data']['username'],
//               email: result['data']['email'],
//               id: result['data']['id'],
//             );

//             setState(() {
//               petaniId = user.id; // Menyimpan id ke dalam petaniId
//             });

//             Navigator.pushReplacement(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => SuccessPage(user: user),
//               ),
//             );
//           } else {
//             showDialog(
//               context: context,
//               builder: (BuildContext context) {
//                 return AlertDialog(
//                   title: Text('Error'),
//                   content: Text(result['message'] ??
//                       'Terjadi kesalahan saat melakukan login.'),
//                   actions: <Widget>[
//                     TextButton(
//                       onPressed: () {
//                         Navigator.of(context).pop();
//                       },
//                       child: Text('OK'),
//                     ),
//                   ],
//                 );
//               },
//             );
//           }
//         } else {
//           final Map<String, dynamic> result = json.decode(response.body);
//           showDialog(
//             context: context,
//             builder: (BuildContext context) {
//               return AlertDialog(
//                 title: Text('Error'),
//                 content: Text(result['message'] ??
//                     'Terjadi kesalahan saat melakukan login.'),
//                 actions: <Widget>[
//                   TextButton(
//                     onPressed: () {
//                       Navigator.of(context).pop();
//                     },
//                     child: Text('OK'),
//                   ),
//                 ],
//               );
//             },
//           );
//         }
//       } catch (e) {
//         print('Error: $e');
//         showDialog(
//           context: context,
//           builder: (BuildContext context) {
//             return AlertDialog(
//               title: Text('Error'),
//               content: Text('Terjadi kesalahan saat melakukan login.'),
//               actions: <Widget>[
//                 TextButton(
//                   onPressed: () {
//                     Navigator.of(context).pop();
//                   },
//                   child: Text('OK'),
//                 ),
//               ],
//             );
//           },
//         );
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Markopi',
//           style: TextStyle(
//             color: Colors.white, // Warna teks di AppBar
//           ),
//         ),
//         backgroundColor: Color(0xFF65451F),
//         leading: IconButton(
//           onPressed: () {
//             // Navigasi ke ProsesBudidayaPage dan menggantikan halaman saat ini
//             Navigator.pushReplacementNamed(context, '/');
//           },
//           icon: Icon(Icons.arrow_back),
//           color: Colors.white,
//         ),
//       ),
//       body: Container(
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage('assets/images/background.png'),
//             fit: BoxFit.cover,
//           ),
//         ),
//         child: Padding(
//           padding: EdgeInsets.all(16.0),
//           child: Stack(
//             children: <Widget>[
//               Positioned(
//                 top: -70,
//                 left: (MediaQuery.of(context).size.width / 3) - 75,
//                 child: Image.asset(
//                   'assets/images/markopi.png',
//                   width: 300,
//                   height: 300,
//                 ),
//               ),
//               Form(
//                 key: _formKey,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: <Widget>[
//                     SizedBox(height: 20),
//                     TextFormField(
//                       controller: usernameController,
//                       decoration: InputDecoration(
//                         labelText: 'Username',
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(30.0),
//                         ),
//                         filled: true,
//                         fillColor: Colors.white,
//                       ),
//                       validator: (value) {
//                         if (value!.isEmpty) {
//                           return 'Masukkan nama pengguna (username)';
//                         }
//                         return null;
//                       },
//                     ),
//                     SizedBox(height: 40),
//                     TextFormField(
//                       controller: passwordController,
//                       obscureText: _isObscure,
//                       decoration: InputDecoration(
//                         labelText: 'Kata Sandi',
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(30.0),
//                         ),
//                         filled: true,
//                         fillColor: Colors.white,
//                         suffixIcon: IconButton(
//                           icon: Icon(
//                             _isObscure
//                                 ? Icons.visibility
//                                 : Icons.visibility_off,
//                           ),
//                           onPressed: _togglePasswordVisibility,
//                         ),
//                       ),
//                       validator: (value) {
//                         if (value!.isEmpty || value.length < 6) {
//                           return 'Kata sandi harus memiliki setidaknya 6 karakter';
//                         }
//                         return null;
//                       },
//                     ),
//                     SizedBox(height: 80),
//                     ElevatedButton(
//                       onPressed: login,
//                       style: ElevatedButton.styleFrom(
//                         primary: Color.fromRGBO(
//                             142, 116, 92, 1), // Ubah warna tombol
//                         padding: EdgeInsets.symmetric(
//                           vertical: 20.0,
//                           horizontal: 90.0,
//                         ),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(30.0),
//                         ),
//                       ),
//                       child: Text(
//                         'Masuk',
//                         style: TextStyle(
//                           fontSize: 18.0,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
