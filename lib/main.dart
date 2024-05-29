import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hostelmanagementproject/Constants/theme_const.dart';
import 'package:hostelmanagementproject/Controller/controller_login_stud.dart';
import 'package:hostelmanagementproject/Controller/controller_reg_stud.dart';
import 'package:hostelmanagementproject/Controller/controller_stud_profile.dart';
import 'package:hostelmanagementproject/firebase_options.dart';
import 'package:provider/provider.dart';

import 'View/Admin_View/Edit_Profile_Student.dart';
import 'View/Forgetpassword_page.dart';
import 'View/Student_View/Homepage_Students.dart';
import 'View/Admin_View/Homepage_admin.dart';
import 'View/LoginPage.dart';
import 'View/Student_View/Profile_Student.dart';
import 'View/Student_View/Registrationpage_students.dart';
import 'View/Splashpage.dart';
import 'package:google_fonts/google_fonts.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseAppCheck.instance.activate(
    webProvider: ReCaptchaV3Provider('recaptcha-v3-site-key'),
    androidProvider: AndroidProvider.debug,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(

      providers: [
        ChangeNotifierProvider(create: (context) => ControllerRegStud(),),
        ChangeNotifierProvider(create: (context) =>ControllerLoginStud() ,),
        ChangeNotifierProvider(create: (context) =>ControllerStudProfile() ,),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Hostel Happy',

        theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: bgColorscaffold,
          primaryColor: bgColorscaffold,
          textTheme: GoogleFonts.sourceCodeProTextTheme(Theme.of(context).textTheme).apply().copyWith(
            bodyLarge: TextStyle(
                color:kTextwhiteColor,
              fontSize: 35.0,
              fontWeight: FontWeight.bold
            ),
            titleMedium: TextStyle(
              color: kTextwhiteColor,
              fontSize: 22.0,
              fontWeight: FontWeight.w500
            ),
            titleSmall: TextStyle(
              color: kTextwhiteColor,
              fontSize: 18.0,
              fontWeight: FontWeight.w300
            )
          )
        ),
        home:ProfileStudent(Id: 'QsUtP6dxupPW1THXYe4dC0KNTqu1',),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
