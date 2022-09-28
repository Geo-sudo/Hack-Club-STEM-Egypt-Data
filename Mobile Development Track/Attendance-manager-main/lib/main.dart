import 'package:attendancee/providers/Auth.dart';
import 'package:attendancee/providers/Classes_teachers.dart';
import 'package:attendancee/providers/Sessions.dart';
import 'package:attendancee/screens/auth_screen.dart';
import 'package:attendancee/screens/editAttendance_screen.dart';
import 'package:attendancee/screens/home_screen.dart';
import 'package:attendancee/screens/review_screen.dart';
import 'package:attendancee/screens/create_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './colors.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (ctx) => Auth()),
          ChangeNotifierProxyProvider<Auth, Sessions>(
              update: (ctx, auth, prev) => Sessions(auth.tokenGet,
                  auth.userIdGet, prev == null ? [] : prev.sessions)),
          ChangeNotifierProxyProvider<Auth, ClassTeacher>(
              update: (ctx, auth, prev) => ClassTeacher(auth.userIdGet, auth.tokenGet
                  , prev == null ? [] : prev.classes))
        ],
        child: ScreenUtilInit(
            designSize: const Size(1080, 2340),
            builder: (context, child) => Consumer<Auth>(
                builder: (context, auth, child) => MaterialApp(
                      routes: {
                        'Edit-session':(context) => editScreen(),
                        'Review-sessions':(context) => ReviewScreen(),
                        'Create-sessions': (conetext) => CreateScreen(),
                      },
                      debugShowCheckedModeBanner: false,
                      theme: ThemeData(
                        primaryColor: kBackgroundColor,
                        scaffoldBackgroundColor: kBackgroundColor,
                      ),
                      home: auth.isAuth
                          ? HomePage()
                          : FutureBuilder(
                              future: auth.autoLogin(),
                              builder: (ctx, snapShot) => snapShot
                                          .connectionState ==
                                      ConnectionState.waiting
                                  ? Scaffold(
                                      body: Center(
                                          child: CircularProgressIndicator()))
                                  : AuthScreen()),
                    ))));
  }
}
