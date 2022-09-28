import 'package:attendancee/models/HttpException.dart';
import 'package:attendancee/providers/Auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../colors.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _id = TextEditingController();
  final _pass = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String _msg = "";
  bool _isloading = false;

  Future<void> _auth(bool mode) async {
    {
      if (!_formKey.currentState.validate()) {
      // Invalid!
      return;
      }
      _formKey.currentState.save();

      try {

        setState(() {
          _isloading = true;
        });

        if(mode == false)
          await Provider.of<Auth>(context, listen: false)
              .signup(_id.text + "@stemoct.com", _pass.text);
        else 
          await Provider.of<Auth>(context, listen: false)
              .login(_id.text + "@stemoct.com", _pass.text);

  
      } on HttpException catch (error) {
        print("aa");
        print(error);
        
        var errorMessage = 'Authentication failed';
        if (error.toString().contains('EMAIL_EXISTS')) {
          errorMessage = 'This email address is already in use.';
        } else if (error.toString().contains('INVALID_EMAIL')) {
          errorMessage = 'This is not a valid email address';
        } else if (error.toString().contains('WEAK_PASSWORD')) {
          errorMessage = 'This password is too weak.';
        } else if (error.toString().contains('EMAIL_NOT_FOUND')) {
          errorMessage = 'Could not find a user with that email.';
        } else if (error.toString().contains('INVALID_PASSWORD')) {
          errorMessage = 'Invalid password.';
        }

        setState(() {
          _msg = errorMessage;
        });

        setState(() {
          _isloading = false;
        });
      } catch (e) {
        const errorMessage =
            'Could not authenticate you. Please try again later.';
        setState(() {
          _msg = errorMessage;
        });
        setState(() {
          _isloading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isloading == true) {
      return Scaffold(
        backgroundColor: kBackgroundColor,
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const CircularProgressIndicator(
              color: Colors.white,
            ),
            const SizedBox(
              height: 30,
            ),
            Center(
                child: Text(
              'Logging you in...',
              style: TextStyle(
                  fontSize: 60.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.w500),
            )),
          ],
        )),
      );
    }
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Form(
        key: _formKey,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: kBackgroundColor,
            centerTitle: true,
            elevation: 0,
            title: const Text(
              'STEM October attendance',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.only(top: 50.h),
                padding: EdgeInsets.symmetric(horizontal: 70.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: 170.w,
                      child: Image.asset('assets/images/lnct_logo.png'),
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
                    Text(_msg,
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 34.sp,
                        )),
                    SizedBox(
                      height: 50.h,
                    ),
                    TextFormField(
                      controller: _id,
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Account id is required!';
                        }
                        if (value.length < 5) {
                          return 'Invalid Account id';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      style: TextStyle(
                          color: Colors.white, height: 1.5, fontSize: 55.sp),
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        prefixIcon: Icon(
                          Icons.perm_identity_rounded,
                          color: Colors.white,
                          size: 60.sp,
                        ),
                        labelText: 'Account ID',
                        labelStyle: const TextStyle(color: Colors.white),
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          controller: _pass,
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Password is required!';
                            }
                            return null;
                          },
                          style: TextStyle(
                              color: Colors.white,
                              height: 1.5,
                              fontSize: 55.sp),
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.white,
                              ),
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            prefixIcon: Icon(
                              Icons.password,
                              color: Colors.white,
                              size: 60.sp,
                            ),
                            labelText: 'Password',
                            labelStyle: const TextStyle(color: Colors.white),
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(20)),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            //Forget password here
                          },
                          child: Text(
                            'Forget Password?',
                            style: TextStyle(
                                color: Colors.grey.shade500,
                                fontFamily: 'Questrial',
                                fontSize: 50.sp),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: kLightGreen,
                        ),
                        onPressed: () => _auth(true),
                        child: Text(
                          '      Login      ',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 50.sp,
                              fontWeight: FontWeight.bold),
                        )),
                    TextButton(
                      onPressed: () {
                        _auth(false);
                      },
                      child: Text(
                        'New Student? Sign Up',
                        style: TextStyle(color: Colors.white, fontSize: 50.sp),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
