import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Animex Guide",
    home: FirstRoute(),
  ));
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Animex Guide",
    home: FirstRoute(),
  ));
}

class FirstRoute extends StatelessWidget {
  const FirstRoute({key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.amber.shade50,
          drawer: new Drawer(
            child: new Column(
              children: <Widget>[
                const DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.amber,
                  ), //BoxDecoration
                  child: UserAccountsDrawerHeader(
                    decoration: BoxDecoration(color: Colors.amber),
                    accountName: Text(
                      "Animex",
                      style: TextStyle(fontSize: 25),
                    ),
                    accountEmail: Text("Your guide to the high Ranking Animes"),
                    currentAccountPictureSize: Size.square(50),
                    //circleAvatar
                  ), //UserAccountDrawerHeader
                ),
              ],
            ),
          ),
          appBar: AppBar(
            backgroundColor: Colors.amber,
            toolbarHeight: 100,
            elevation: 14,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(70),
                    bottomLeft: Radius.circular(70))),
            title: Text('Animex Guide',
                style: TextStyle(
                  fontSize: 25,
                )),
            actions: [
              Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                          blurRadius: 7,
                          spreadRadius: 3,
                          color: Colors.amber.shade600)
                    ], shape: BoxShape.circle, color: Colors.amber.shade400),
                    child: Icon(
                      Icons.logout,
                      size: 20,
                    ),
                  ),
                  SizedBox(
                    width: 26,
                  )
                ],
              )
            ],
          ),
          body: Center(
            child: ElevatedButton(
              child: const Text("START"),
              onPressed: (() {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SecondRoute()),
                );
              }),
              style: ElevatedButton.styleFrom(
                primary: Colors.amber,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(9),
                ),
              ),
            ),
          ),
        ));
  }
}

class SecondRoute extends StatelessWidget {
  const SecondRoute({key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.white,
          drawer: new Drawer(
            child: new Column(
              children: <Widget>[
                const DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.amber,
                  ), //BoxDecoration
                  child: UserAccountsDrawerHeader(
                    decoration: BoxDecoration(color: Colors.amber),
                    accountName: Text(
                      "Animex",
                      style: TextStyle(fontSize: 25),
                    ),
                    accountEmail: Text("Your guide to the high Ranking Animes"),
                    currentAccountPictureSize: Size.square(50),
                    //circleAvatar
                  ), //UserAccountDrawerHeader
                ),
              ],
            ),
          ),
          appBar: AppBar(
            backgroundColor: Colors.amber,
            toolbarHeight: 100,
            elevation: 14,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(70),
                    bottomLeft: Radius.circular(70))),
            title: Text('Animex Guide',
                style: TextStyle(
                  fontSize: 25,
                )),
            actions: [
              Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                          blurRadius: 7,
                          spreadRadius: 3,
                          color: Colors.amber.shade600)
                    ], shape: BoxShape.circle, color: Colors.amber.shade400),
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const BackButtonIcon(),
                    ),
                  ),
                  SizedBox(
                    width: 26,
                  )
                ],
              )
            ],
          ),
          body: BuildBody(),
        ));
  }
}

class BuildBody extends StatefulWidget {
  @override
  _BuildBodyState createState() => _BuildBodyState();
}

class _BuildBodyState extends State<BuildBody> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      primary: false,
      padding: const EdgeInsets.all(4),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 2,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(15),
          color: Colors.amber,
          child: Material(
            elevation: 6,
            // Size the button
            child: SizedBox(
              width: 200,
              height: 300,
              // Inkwell
              child: InkWell(
                radius: 100,
                // display a snackbar on tap
                onTap: () {
                  ScaffoldMessenger.of(context).clearSnackBars();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Hello There!'),
                      duration: Duration(milliseconds: 1500),
                    ),
                  );

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ThirdRoute()),
                  );
                },
                // implement the image with Ink.image
                child: Image.asset('assets/aot.jpg'),
              ),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(15),
          color: Colors.amber,
          child: Material(
            elevation: 6,
            // Size the button
            child: SizedBox(
              width: 200,
              height: 300,
              // Inkwell
              child: InkWell(
                radius: 100,
                // display a snackbar on tap
                onTap: () {
                  ScaffoldMessenger.of(context).clearSnackBars();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Hello There!'),
                      duration: Duration(milliseconds: 1500),
                    ),
                  );

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const FourthRoute()),
                  );
                },
                // implement the image with Ink.image
                child: Image.asset('assets/black.jpg'),
              ),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(15),
          color: Colors.amber,
          child: Material(
            elevation: 6,
            // Size the button
            child: SizedBox(
              width: 200,
              height: 300,
              // Inkwell
              child: InkWell(
                radius: 100,
                // display a snackbar on tap
                onTap: () {
                  ScaffoldMessenger.of(context).clearSnackBars();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Hello There!'),
                      duration: Duration(milliseconds: 1500),
                    ),
                  );

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const FifthRoute()),
                  );
                },
                // implement the image with Ink.image
                child: Image.asset('assets/jjk.jpg'),
              ),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(15),
          color: Colors.amber,
          child: Material(
            elevation: 6,
            // Size the button
            child: SizedBox(
              width: 200,
              height: 300,
              // Inkwell
              child: InkWell(
                radius: 100,
                // display a snackbar on tap
                onTap: () {
                  ScaffoldMessenger.of(context).clearSnackBars();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Hello There!'),
                      duration: Duration(milliseconds: 1500),
                    ),
                  );

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SixRoute()),
                  );
                },
                // implement the image with Ink.image
                child: Image.asset('assets/ass.jpg'),
              ),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(15),
          color: Colors.amber,
          child: Material(
            elevation: 6,
            // Size the button
            child: SizedBox(
              width: 200,
              height: 300,
              // Inkwell
              child: InkWell(
                radius: 100,
                // display a snackbar on tap
                onTap: () {
                  ScaffoldMessenger.of(context).clearSnackBars();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Hello There!'),
                      duration: Duration(milliseconds: 1500),
                    ),
                  );

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SevenRoute()),
                  );
                },
                // implement the image with Ink.image
                child: Image.asset('assets/charlotte.jpg'),
              ),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(15),
          color: Colors.amber,
          child: Material(
            elevation: 6,
            // Size the button
            child: SizedBox(
              width: 200,
              height: 300,
              // Inkwell
              child: InkWell(
                radius: 100,
                // display a snackbar on tap
                onTap: () {
                  ScaffoldMessenger.of(context).clearSnackBars();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Hello There!'),
                      duration: Duration(milliseconds: 1500),
                    ),
                  );

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const EightRoute()),
                  );
                },
                // implement the image with Ink.image
                child: Image.asset('assets/death.jpg'),
              ),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(15),
          color: Colors.amber,
          child: Material(
            elevation: 6,
            // Size the button
            child: SizedBox(
              width: 200,
              height: 300,
              // Inkwell
              child: InkWell(
                radius: 100,
                // display a snackbar on tap
                onTap: () {
                  ScaffoldMessenger.of(context).clearSnackBars();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Hello There!'),
                      duration: Duration(milliseconds: 1500),
                    ),
                  );

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const NineRoute()),
                  );
                },
                // implement the image with Ink.image
                child: Image.asset('assets/demon.jpg'),
              ),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(15),
          color: Colors.amber,
          child: Material(
            elevation: 6,
            // Size the button
            child: SizedBox(
              width: 200,
              height: 300,
              // Inkwell
              child: InkWell(
                radius: 100,
                // display a snackbar on tap
                onTap: () {
                  ScaffoldMessenger.of(context).clearSnackBars();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Hello There!'),
                      duration: Duration(milliseconds: 1500),
                    ),
                  );

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const TenRoute()),
                  );
                },
                // implement the image with Ink.image
                child: Image.asset('assets/erased.jpg'),
              ),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(15),
          color: Colors.amber,
          child: Material(
            elevation: 6,
            // Size the button
            child: SizedBox(
              width: 200,
              height: 300,
              // Inkwell
              child: InkWell(
                radius: 100,
                // display a snackbar on tap
                onTap: () {
                  ScaffoldMessenger.of(context).clearSnackBars();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Hello There!'),
                      duration: Duration(milliseconds: 1500),
                    ),
                  );

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Ten1Route()),
                  );
                },
                // implement the image with Ink.image
                child: Image.asset('assets/hi.jpg'),
              ),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(15),
          color: Colors.amber,
          child: Material(
            elevation: 6,
            // Size the button
            child: SizedBox(
              width: 200,
              height: 300,
              // Inkwell
              child: InkWell(
                radius: 100,
                // display a snackbar on tap
                onTap: () {
                  ScaffoldMessenger.of(context).clearSnackBars();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Hello There!'),
                      duration: Duration(milliseconds: 1500),
                    ),
                  );

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Ten2Route()),
                  );
                },
                // implement the image with Ink.image
                child: Image.asset('assets/spy.jpg'),
              ),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(15),
          color: Colors.amber,
          child: Material(
            elevation: 6,
            // Size the button
            child: SizedBox(
              width: 200,
              height: 300,
              // Inkwell
              child: InkWell(
                radius: 100,
                // display a snackbar on tap
                onTap: () {
                  ScaffoldMessenger.of(context).clearSnackBars();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Hello There!'),
                      duration: Duration(milliseconds: 1500),
                    ),
                  );

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Ten3Route()),
                  );
                },
                // implement the image with Ink.image
                child: Image.asset('assets/revenge.jpg'),
              ),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(15),
          color: Colors.amber,
          child: Material(
            elevation: 6,
            // Size the button
            child: SizedBox(
              width: 200,
              height: 300,
              // Inkwell
              child: InkWell(
                radius: 100,
                // display a snackbar on tap
                onTap: () {
                  ScaffoldMessenger.of(context).clearSnackBars();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Hello There!'),
                      duration: Duration(milliseconds: 1500),
                    ),
                  );

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Ten4Route()),
                  );
                },
                // implement the image with Ink.image
                child: Image.asset('assets/naruto.jpg'),
              ),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(15),
          color: Colors.amber,
          child: Material(
            elevation: 6,
            // Size the button
            child: SizedBox(
              width: 200,
              height: 300,
              // Inkwell
              child: InkWell(
                radius: 100,
                // display a snackbar on tap
                onTap: () {
                  ScaffoldMessenger.of(context).clearSnackBars();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Hello There!'),
                      duration: Duration(milliseconds: 1500),
                    ),
                  );

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Ten5Route()),
                  );
                },
                // implement the image with Ink.image
                child: Image.asset('assets/takt.jpg'),
              ),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(15),
          color: Colors.amber,
          child: Material(
            elevation: 6,
            // Size the button
            child: SizedBox(
              width: 200,
              height: 300,
              // Inkwell
              child: InkWell(
                radius: 100,
                // display a snackbar on tap
                onTap: () {
                  ScaffoldMessenger.of(context).clearSnackBars();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Hello There!'),
                      duration: Duration(milliseconds: 1500),
                    ),
                  );

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Ten6Route()),
                  );
                },
                // implement the image with Ink.image
                child: Image.asset('assets/blue.jpg'),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ThirdRoute extends StatelessWidget {
  const ThirdRoute({key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.white,
          drawer: new Drawer(
            child: new Column(
              children: <Widget>[
                const DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.amber,
                  ), //BoxDecoration
                  child: UserAccountsDrawerHeader(
                    decoration: BoxDecoration(color: Colors.amber),
                    accountName: Text(
                      "Animex",
                      style: TextStyle(fontSize: 25),
                    ),
                    accountEmail: Text("Your guide to the high Ranking Animes"),
                    currentAccountPictureSize: Size.square(50),
                    //circleAvatar
                  ), //UserAccountDrawerHeader
                ),
              ],
            ),
          ),
          appBar: AppBar(
            backgroundColor: Colors.amber,
            toolbarHeight: 100,
            elevation: 14,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(70),
                    bottomLeft: Radius.circular(70))),
            title: Text('Animex Guide',
                style: TextStyle(
                  fontSize: 25,
                )),
            actions: [
              Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                          blurRadius: 7,
                          spreadRadius: 3,
                          color: Colors.amber.shade600)
                    ], shape: BoxShape.circle, color: Colors.amber.shade400),
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const BackButtonIcon(),
                    ),
                  ),
                  SizedBox(
                    width: 26,
                  )
                ],
              )
            ],
          ),
          body: MyHome13Page(),
        ));
  }
}

class MyHome13Page extends StatelessWidget {
  static String myVideoId = 'MGRm4IzK1SQ';

  final YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: myVideoId,
    flags: const YoutubePlayerFlags(
      autoPlay: true,
      mute: false,
    ),
  );

  MyHome13Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: const Text('Attack On Taitan'),
        ),
        body: Container(
          child: YoutubePlayer(
            controller: _controller,
            liveUIColor: Colors.amber,
            showVideoProgressIndicator: true,
          ),
        ));
  }
}

class FourthRoute extends StatelessWidget {
  const FourthRoute({key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.white,
          drawer: new Drawer(
            child: new Column(
              children: <Widget>[
                const DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.amber,
                  ), //BoxDecoration
                  child: UserAccountsDrawerHeader(
                    decoration: BoxDecoration(color: Colors.amber),
                    accountName: Text(
                      "Animex",
                      style: TextStyle(fontSize: 25),
                    ),
                    accountEmail: Text("Your guide to the high Ranking Animes"),
                    currentAccountPictureSize: Size.square(50),
                    //circleAvatar
                  ), //UserAccountDrawerHeader
                ),
              ],
            ),
          ),
          appBar: AppBar(
            backgroundColor: Colors.amber,
            toolbarHeight: 100,
            elevation: 14,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(70),
                    bottomLeft: Radius.circular(70))),
            title: Text('Trailer',
                style: TextStyle(
                  fontSize: 25,
                )),
            actions: [
              Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                          blurRadius: 7,
                          spreadRadius: 3,
                          color: Colors.amber.shade600)
                    ], shape: BoxShape.circle, color: Colors.amber.shade400),
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const BackButtonIcon(),
                    ),
                  ),
                  SizedBox(
                    width: 26,
                  )
                ],
              )
            ],
          ),
          body: MyHome12Page(),
        ));
  }
}

class MyHome12Page extends StatelessWidget {
  static String myVideoId = 'MH4pWlX4LqI';

  final YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: myVideoId,
    flags: const YoutubePlayerFlags(
      autoPlay: true,
      mute: false,
    ),
  );

  MyHome12Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: const Text('Black Clover'),
        ),
        body: YoutubePlayer(
          controller: _controller,
          liveUIColor: Colors.amber,
        ));
  }
}

class FifthRoute extends StatelessWidget {
  const FifthRoute({key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.white,
          drawer: new Drawer(
            child: new Column(
              children: <Widget>[
                const DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.amber,
                  ), //BoxDecoration
                  child: UserAccountsDrawerHeader(
                    decoration: BoxDecoration(color: Colors.amber),
                    accountName: Text(
                      "Animex",
                      style: TextStyle(fontSize: 25),
                    ),
                    accountEmail: Text("Your guide to the high Ranking Animes"),
                    currentAccountPictureSize: Size.square(50),
                    //circleAvatar
                  ), //UserAccountDrawerHeader
                ),
              ],
            ),
          ),
          appBar: AppBar(
            backgroundColor: Colors.amber,
            toolbarHeight: 100,
            elevation: 14,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(70),
                    bottomLeft: Radius.circular(70))),
            title: Text('Trailer',
                style: TextStyle(
                  fontSize: 25,
                )),
            actions: [
              Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                          blurRadius: 7,
                          spreadRadius: 3,
                          color: Colors.amber.shade600)
                    ], shape: BoxShape.circle, color: Colors.amber.shade400),
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const BackButtonIcon(),
                    ),
                  ),
                  SizedBox(
                    width: 26,
                  )
                ],
              )
            ],
          ),
          body: MyHome11Page(),
        ));
  }
}

class MyHome11Page extends StatelessWidget {
  static String myVideoId = 'f7R6NA4Yo00';

  final YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: myVideoId,
    flags: const YoutubePlayerFlags(
      autoPlay: true,
      mute: false,
    ),
  );

  MyHome11Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: const Text('Jujutsu Kaisen'),
        ),
        body: YoutubePlayer(
          controller: _controller,
          liveUIColor: Colors.amber,
        ));
  }
}

class SixRoute extends StatelessWidget {
  const SixRoute({key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.white,
          drawer: new Drawer(
            child: new Column(
              children: <Widget>[
                const DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.amber,
                  ), //BoxDecoration
                  child: UserAccountsDrawerHeader(
                    decoration: BoxDecoration(color: Colors.amber),
                    accountName: Text(
                      "Animex",
                      style: TextStyle(fontSize: 25),
                    ),
                    accountEmail: Text("Your guide to the high Ranking Animes"),
                    currentAccountPictureSize: Size.square(50),
                    //circleAvatar
                  ), //UserAccountDrawerHeader
                ),
              ],
            ),
          ),
          appBar: AppBar(
            backgroundColor: Colors.amber,
            toolbarHeight: 100,
            elevation: 14,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(70),
                    bottomLeft: Radius.circular(70))),
            title: Text('Trailer',
                style: TextStyle(
                  fontSize: 25,
                )),
            actions: [
              Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                          blurRadius: 7,
                          spreadRadius: 3,
                          color: Colors.amber.shade600)
                    ], shape: BoxShape.circle, color: Colors.amber.shade400),
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const BackButtonIcon(),
                    ),
                  ),
                  SizedBox(
                    width: 26,
                  )
                ],
              )
            ],
          ),
          body: MyHome10Page(),
        ));
  }
}

class MyHome10Page extends StatelessWidget {
  static String myVideoId = 'Qfn-E3dZXL8';

  final YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: myVideoId,
    flags: const YoutubePlayerFlags(
      autoPlay: true,
      mute: false,
    ),
  );

  MyHome10Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: const Text('Assassination Classroom'),
        ),
        body: YoutubePlayer(
          controller: _controller,
          liveUIColor: Colors.amber,
        ));
  }
}

class SevenRoute extends StatelessWidget {
  const SevenRoute({key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.white,
          drawer: new Drawer(
            child: new Column(
              children: <Widget>[
                const DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.amber,
                  ), //BoxDecoration
                  child: UserAccountsDrawerHeader(
                    decoration: BoxDecoration(color: Colors.amber),
                    accountName: Text(
                      "Animex",
                      style: TextStyle(fontSize: 25),
                    ),
                    accountEmail: Text("Your guide to the high Ranking Animes"),
                    currentAccountPictureSize: Size.square(50),
                    //circleAvatar
                  ), //UserAccountDrawerHeader
                ),
              ],
            ),
          ),
          appBar: AppBar(
            backgroundColor: Colors.amber,
            toolbarHeight: 100,
            elevation: 14,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(70),
                    bottomLeft: Radius.circular(70))),
            title: Text('Trailer',
                style: TextStyle(
                  fontSize: 25,
                )),
            actions: [
              Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                          blurRadius: 7,
                          spreadRadius: 3,
                          color: Colors.amber.shade600)
                    ], shape: BoxShape.circle, color: Colors.amber.shade400),
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const BackButtonIcon(),
                    ),
                  ),
                  SizedBox(
                    width: 26,
                  )
                ],
              )
            ],
          ),
          body: MyHome9Page(),
        ));
  }
}

class MyHome9Page extends StatelessWidget {
  static String myVideoId = '6AgEzww-a0w';

  final YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: myVideoId,
    flags: const YoutubePlayerFlags(
      autoPlay: true,
      mute: false,
    ),
  );

  MyHome9Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: const Text('Charlotte'),
        ),
        body: YoutubePlayer(
          controller: _controller,
          liveUIColor: Colors.amber,
        ));
  }
}

class EightRoute extends StatelessWidget {
  const EightRoute({key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.white,
          drawer: new Drawer(
            child: new Column(
              children: <Widget>[
                const DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.amber,
                  ), //BoxDecoration
                  child: UserAccountsDrawerHeader(
                    decoration: BoxDecoration(color: Colors.amber),
                    accountName: Text(
                      "Animex",
                      style: TextStyle(fontSize: 25),
                    ),
                    accountEmail: Text("Your guide to the high Ranking Animes"),
                    currentAccountPictureSize: Size.square(50),
                    //circleAvatar
                  ), //UserAccountDrawerHeader
                ),
              ],
            ),
          ),
          appBar: AppBar(
            backgroundColor: Colors.amber,
            toolbarHeight: 100,
            elevation: 14,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(70),
                    bottomLeft: Radius.circular(70))),
            title: Text('Trailer',
                style: TextStyle(
                  fontSize: 25,
                )),
            actions: [
              Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                          blurRadius: 7,
                          spreadRadius: 3,
                          color: Colors.amber.shade600)
                    ], shape: BoxShape.circle, color: Colors.amber.shade400),
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const BackButtonIcon(),
                    ),
                  ),
                  SizedBox(
                    width: 26,
                  )
                ],
              )
            ],
          ),
          body: MyHome8Page(),
        ));
  }
}

class MyHome8Page extends StatelessWidget {
  static String myVideoId = 'NlJZ-YgAt-c';

  final YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: myVideoId,
    flags: const YoutubePlayerFlags(
      autoPlay: true,
      mute: false,
    ),
  );

  MyHome8Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: const Text('Death Note'),
        ),
        body: YoutubePlayer(
          controller: _controller,
          liveUIColor: Colors.amber,
        ));
  }
}

class NineRoute extends StatelessWidget {
  const NineRoute({key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.white,
          drawer: new Drawer(
            child: new Column(
              children: <Widget>[
                const DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.amber,
                  ), //BoxDecoration
                  child: UserAccountsDrawerHeader(
                    decoration: BoxDecoration(color: Colors.amber),
                    accountName: Text(
                      "Animex",
                      style: TextStyle(fontSize: 25),
                    ),
                    accountEmail: Text("Your guide to the high Ranking Animes"),
                    currentAccountPictureSize: Size.square(50),
                    //circleAvatar
                  ), //UserAccountDrawerHeader
                ),
              ],
            ),
          ),
          appBar: AppBar(
            backgroundColor: Colors.amber,
            toolbarHeight: 100,
            elevation: 14,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(70),
                    bottomLeft: Radius.circular(70))),
            title: Text('Trailer',
                style: TextStyle(
                  fontSize: 25,
                )),
            actions: [
              Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                          blurRadius: 7,
                          spreadRadius: 3,
                          color: Colors.amber.shade600)
                    ], shape: BoxShape.circle, color: Colors.amber.shade400),
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const BackButtonIcon(),
                    ),
                  ),
                  SizedBox(
                    width: 26,
                  )
                ],
              )
            ],
          ),
          body: MyHome7Page(),
        ));
  }
}

class MyHome7Page extends StatelessWidget {
  static String myVideoId = 'VQGCKyvzIM4';

  final YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: myVideoId,
    flags: const YoutubePlayerFlags(
      autoPlay: true,
      mute: false,
    ),
  );

  MyHome7Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: const Text('Demon Slayer'),
        ),
        body: YoutubePlayer(
          controller: _controller,
          liveUIColor: Colors.amber,
        ));
  }
}

class TenRoute extends StatelessWidget {
  const TenRoute({key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.white,
          drawer: new Drawer(
            child: new Column(
              children: <Widget>[
                const DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.amber,
                  ), //BoxDecoration
                  child: UserAccountsDrawerHeader(
                    decoration: BoxDecoration(color: Colors.amber),
                    accountName: Text(
                      "Animex",
                      style: TextStyle(fontSize: 25),
                    ),
                    accountEmail: Text("Your guide to the high Ranking Animes"),
                    currentAccountPictureSize: Size.square(50),
                    //circleAvatar
                  ), //UserAccountDrawerHeader
                ),
              ],
            ),
          ),
          appBar: AppBar(
            backgroundColor: Colors.amber,
            toolbarHeight: 100,
            elevation: 14,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(70),
                    bottomLeft: Radius.circular(70))),
            title: Text('Trailer',
                style: TextStyle(
                  fontSize: 25,
                )),
            actions: [
              Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                          blurRadius: 7,
                          spreadRadius: 3,
                          color: Colors.amber.shade600)
                    ], shape: BoxShape.circle, color: Colors.amber.shade400),
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const BackButtonIcon(),
                    ),
                  ),
                  SizedBox(
                    width: 26,
                  )
                ],
              )
            ],
          ),
          body: MyHome6Page(),
        ));
  }
}

class MyHome6Page extends StatelessWidget {
  static String myVideoId = 'DwmxEAWjTQQ';

  final YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: myVideoId,
    flags: const YoutubePlayerFlags(
      autoPlay: true,
      mute: false,
    ),
  );

  MyHome6Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: const Text('Erased'),
        ),
        body: YoutubePlayer(
          controller: _controller,
          liveUIColor: Colors.amber,
        ));
  }
}

class Ten1Route extends StatelessWidget {
  const Ten1Route({key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.white,
          drawer: new Drawer(
            child: new Column(
              children: <Widget>[
                const DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.amber,
                  ), //BoxDecoration
                  child: UserAccountsDrawerHeader(
                    decoration: BoxDecoration(color: Colors.amber),
                    accountName: Text(
                      "Animex",
                      style: TextStyle(fontSize: 25),
                    ),
                    accountEmail: Text("Your guide to the high Ranking Animes"),
                    currentAccountPictureSize: Size.square(50),
                    //circleAvatar
                  ), //UserAccountDrawerHeader
                ),
              ],
            ),
          ),
          appBar: AppBar(
            backgroundColor: Colors.amber,
            toolbarHeight: 100,
            elevation: 14,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(70),
                    bottomLeft: Radius.circular(70))),
            title: Text('Trailer',
                style: TextStyle(
                  fontSize: 25,
                )),
            actions: [
              Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                          blurRadius: 7,
                          spreadRadius: 3,
                          color: Colors.amber.shade600)
                    ], shape: BoxShape.circle, color: Colors.amber.shade400),
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const BackButtonIcon(),
                    ),
                  ),
                  SizedBox(
                    width: 26,
                  )
                ],
              )
            ],
          ),
          body: MyHome5Page(),
        ));
  }
}

class MyHome5Page extends StatelessWidget {
  static String myVideoId = 'JOGp2c7-cKc';

  final YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: myVideoId,
    flags: const YoutubePlayerFlags(
      autoPlay: true,
      mute: false,
    ),
  );

  MyHome5Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: const Text('Haikyu'),
        ),
        body: YoutubePlayer(
          controller: _controller,
          liveUIColor: Colors.amber,
        ));
  }
}

class Ten2Route extends StatelessWidget {
  const Ten2Route({key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.white,
          drawer: new Drawer(
            child: new Column(
              children: <Widget>[
                const DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.amber,
                  ), //BoxDecoration
                  child: UserAccountsDrawerHeader(
                    decoration: BoxDecoration(color: Colors.amber),
                    accountName: Text(
                      "Animex",
                      style: TextStyle(fontSize: 25),
                    ),
                    accountEmail: Text("Your guide to the high Ranking Animes"),
                    currentAccountPictureSize: Size.square(50),
                    //circleAvatar
                  ), //UserAccountDrawerHeader
                ),
              ],
            ),
          ),
          appBar: AppBar(
            backgroundColor: Colors.amber,
            toolbarHeight: 100,
            elevation: 14,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(70),
                    bottomLeft: Radius.circular(70))),
            title: Text('Trailer',
                style: TextStyle(
                  fontSize: 25,
                )),
            actions: [
              Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                          blurRadius: 7,
                          spreadRadius: 3,
                          color: Colors.amber.shade600)
                    ], shape: BoxShape.circle, color: Colors.amber.shade400),
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const BackButtonIcon(),
                    ),
                  ),
                  SizedBox(
                    width: 26,
                  )
                ],
              )
            ],
          ),
          body: MyHome4Page(),
        ));
  }
}

class MyHome4Page extends StatelessWidget {
  static String myVideoId = 'ofXigq9aIpo';

  final YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: myVideoId,
    flags: const YoutubePlayerFlags(
      autoPlay: true,
      mute: false,
    ),
  );

  MyHome4Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: const Text('Spy X family'),
        ),
        body: YoutubePlayer(
          controller: _controller,
          liveUIColor: Colors.amber,
        ));
  }
}

class Ten3Route extends StatelessWidget {
  const Ten3Route({key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.white,
          drawer: new Drawer(
            child: new Column(
              children: <Widget>[
                const DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.amber,
                  ), //BoxDecoration
                  child: UserAccountsDrawerHeader(
                    decoration: BoxDecoration(color: Colors.amber),
                    accountName: Text(
                      "Animex",
                      style: TextStyle(fontSize: 25),
                    ),
                    accountEmail: Text("Your guide to the high Ranking Animes"),
                    currentAccountPictureSize: Size.square(50),
                    //circleAvatar
                  ), //UserAccountDrawerHeader
                ),
              ],
            ),
          ),
          appBar: AppBar(
            backgroundColor: Colors.amber,
            toolbarHeight: 100,
            elevation: 14,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(70),
                    bottomLeft: Radius.circular(70))),
            title: Text('Trailer',
                style: TextStyle(
                  fontSize: 25,
                )),
            actions: [
              Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                          blurRadius: 7,
                          spreadRadius: 3,
                          color: Colors.amber.shade600)
                    ], shape: BoxShape.circle, color: Colors.amber.shade400),
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const BackButtonIcon(),
                    ),
                  ),
                  SizedBox(
                    width: 26,
                  )
                ],
              )
            ],
          ),
          body: MyHome3Page(),
        ));
  }
}

class MyHome3Page extends StatelessWidget {
  static String myVideoId = 'idlLFNNpZiI';

  final YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: myVideoId,
    flags: const YoutubePlayerFlags(
      autoPlay: true,
      mute: false,
    ),
  );

  MyHome3Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: const Text('Tokyo Revengers'),
        ),
        body: YoutubePlayer(
          controller: _controller,
          liveUIColor: Colors.amber,
        ));
  }
}

class Ten4Route extends StatelessWidget {
  const Ten4Route({key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.white,
          drawer: new Drawer(
            child: new Column(
              children: <Widget>[
                const DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.amber,
                  ), //BoxDecoration
                  child: UserAccountsDrawerHeader(
                    decoration: BoxDecoration(color: Colors.amber),
                    accountName: Text(
                      "Animex",
                      style: TextStyle(fontSize: 25),
                    ),
                    accountEmail: Text("Your guide to the high Ranking Animes"),
                    currentAccountPictureSize: Size.square(50),
                    //circleAvatar
                  ), //UserAccountDrawerHeader
                ),
              ],
            ),
          ),
          appBar: AppBar(
            backgroundColor: Colors.amber,
            toolbarHeight: 100,
            elevation: 14,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(70),
                    bottomLeft: Radius.circular(70))),
            title: Text('Trailer',
                style: TextStyle(
                  fontSize: 25,
                )),
            actions: [
              Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                          blurRadius: 7,
                          spreadRadius: 3,
                          color: Colors.amber.shade600)
                    ], shape: BoxShape.circle, color: Colors.amber.shade400),
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const BackButtonIcon(),
                    ),
                  ),
                  SizedBox(
                    width: 26,
                  )
                ],
              )
            ],
          ),
          body: MyHome2Page(),
        ));
  }
}

class MyHome2Page extends StatelessWidget {
  static String myVideoId = '-G9BqkgZXRA';

  final YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: myVideoId,
    flags: const YoutubePlayerFlags(
      autoPlay: true,
      mute: false,
    ),
  );

  MyHome2Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: const Text('Naruto'),
        ),
        body: YoutubePlayer(
          controller: _controller,
          liveUIColor: Colors.amber,
        ));
  }
}

class Ten5Route extends StatelessWidget {
  const Ten5Route({key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.white,
          drawer: new Drawer(
            child: new Column(
              children: <Widget>[
                const DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.amber,
                  ), //BoxDecoration
                  child: UserAccountsDrawerHeader(
                    decoration: BoxDecoration(color: Colors.amber),
                    accountName: Text(
                      "Animex",
                      style: TextStyle(fontSize: 25),
                    ),
                    accountEmail: Text("Your guide to the high Ranking Animes"),
                    currentAccountPictureSize: Size.square(50),
                    //circleAvatar
                  ), //UserAccountDrawerHeader
                ),
              ],
            ),
          ),
          appBar: AppBar(
            backgroundColor: Colors.amber,
            toolbarHeight: 100,
            elevation: 14,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(70),
                    bottomLeft: Radius.circular(70))),
            title: Text('Trailer',
                style: TextStyle(
                  fontSize: 25,
                )),
            actions: [
              Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                          blurRadius: 7,
                          spreadRadius: 3,
                          color: Colors.amber.shade600)
                    ], shape: BoxShape.circle, color: Colors.amber.shade400),
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const BackButtonIcon(),
                    ),
                  ),
                  SizedBox(
                    width: 26,
                  )
                ],
              )
            ],
          ),
          body: MyHome1Page(),
        ));
  }
}

class MyHome1Page extends StatelessWidget {
  static String myVideoId = '0lNjes4la9U';

  final YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: myVideoId,
    flags: const YoutubePlayerFlags(
      autoPlay: true,
      mute: false,
    ),
  );

  MyHome1Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: const Text('Takt Op Destiny'),
        ),
        body: YoutubePlayer(
          controller: _controller,
          liveUIColor: Colors.amber,
        ));
  }
}

class Ten6Route extends StatelessWidget {
  const Ten6Route({key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.white,
          drawer: new Drawer(
            child: new Column(
              children: <Widget>[
                const DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.amber,
                  ), //BoxDecoration
                  child: UserAccountsDrawerHeader(
                    decoration: BoxDecoration(color: Colors.amber),
                    accountName: Text(
                      "Animex",
                      style: TextStyle(fontSize: 25),
                    ),
                    accountEmail: Text("Your guide to the high Ranking Animes"),
                    currentAccountPictureSize: Size.square(50),
                    //circleAvatar
                  ), //UserAccountDrawerHeader
                ),
              ],
            ),
          ),
          appBar: AppBar(
            backgroundColor: Colors.amber,
            toolbarHeight: 100,
            elevation: 14,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(70),
                    bottomLeft: Radius.circular(70))),
            title: Text('Trailer',
                style: TextStyle(
                  fontSize: 25,
                )),
            actions: [
              Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                          blurRadius: 7,
                          spreadRadius: 3,
                          color: Colors.amber.shade600)
                    ], shape: BoxShape.circle, color: Colors.amber.shade400),
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const BackButtonIcon(),
                    ),
                  ),
                  SizedBox(
                    width: 26,
                  )
                ],
              )
            ],
          ),
          body: MyHomePage(),
        ));
  }
}

class MyHomePage extends StatelessWidget {
  static String myVideoId = 'IV0-SYn3YuM';

  final YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: myVideoId,
    flags: const YoutubePlayerFlags(
      autoPlay: true,
      mute: false,
    ),
  );

  MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: const Text('Blue Period'),
        ),
        body: YoutubePlayer(
          controller: _controller,
          liveUIColor: Colors.amber,
        ));
  }
}
