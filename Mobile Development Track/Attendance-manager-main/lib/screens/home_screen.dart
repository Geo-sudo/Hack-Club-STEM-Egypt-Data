import 'package:attendancee/providers/Auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height * 0.7,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
              ),
              Container(
                alignment: Alignment.topLeft,
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.05,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: MediaQuery.of(context).size.height * 0.05,
                  child: ElevatedButton(
                    child: Row(children: [
                      Expanded(
                          child: Text(
                        'Log out',
                        textAlign: TextAlign.justify,
                        textScaleFactor: 1,
                      )),
                      Icon(Icons.logout)
                    ]),
                    onPressed: () {
                      Provider.of<Auth>(context, listen: false).logout();
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF3F5B91),
                      // ignore: prefer_const_constructors
                      side: BorderSide(
                        color: Colors.white,
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
              ),
              CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: MediaQuery.of(context).size.width * 0.3,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Image.asset(
                      "assets/images/lnct_app_logo.png",
                      scale: 3 / 2,
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width * 0.5,
                      fit: BoxFit.cover,
                    ),
                  )),
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 40, 0, 5),
              ),
              Column(
                children: [
                  Center(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.06,
                      child: ElevatedButton(
                        child: const Text(
                          'Create sessions',
                          textAlign: TextAlign.center,
                          textScaleFactor: 1.1,
                        ),
                        onPressed: () {
                          Navigator.of(context).pushNamed('Create-sessions');
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xFF00E6AD),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40)),
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 5),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.06,
                    child: ElevatedButton(
                      child: const Text(
                        'Review & Edit previous sessions',
                        textAlign: TextAlign.center,
                        textScaleFactor: 1.1,
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamed('Review-sessions');
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFF00E6AD),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40)),
                      ),
                    ),
                  ),
                ],
              ),
            ]),
      ),
    );
  }
}
