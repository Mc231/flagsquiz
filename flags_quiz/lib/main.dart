

import 'dart:convert';

import 'package:flagsquiz/countries_data_source.dart';
import 'package:flagsquiz/countries_provider.dart';
import 'package:flagsquiz/localizations.dart';
import 'package:flagsquiz/models/Continent.dart';
import 'package:flagsquiz/ui/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'models/Country.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.dark(),
      localizationsDelegates: [
        AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en'), // English, no country code
        const Locale('uk'), // Hebrew, no country code
        // ... other locales the app supports
      ],
      localeResolutionCallback: (Locale locale, Iterable<Locale> supportedLocales) {
        return locale;
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MainScreen(),
    );
  }
}

class MainScreen1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MainScreen1State();
  }
}

class MainScreen1State extends State<MainScreen1> {

  var _image = 'assets/images/AD.png';
  var _first = '';
  var _second = '';
  var _third = '';
  var _fourth = '';
  Map<String, Country> _flags;

  @override
  void initState()  {
    super.initState();
    loadAsset().then((source) {
      var countries = jsonDecode(source) as Map<String, dynamic>;
      setState(() {
        _flags = countries.map((key, value)  {
          var country = Country.fromJson(value as Map);
          return MapEntry(key, country);
        });
      });

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
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('TItle'),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
          child: Column(
            children: [
              Text(_first),
              Text(_second),
              Text(_third),
              Text(_fourth),
              Text('${_flags?.keys?.length ?? 0}'),
              Image.asset(_image),
            ],
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () async  {
          var provider = CountriesProvider();
          var result = await provider.provide();
          var dataSource = CountriesDataSource(result);
          var eu = dataSource.getByContinent(Continent.OC);

          _flags.remove(_flags.keys.first);
          var randoms = _flags.keys.toList();
          randoms.shuffle();
          randoms = randoms.sublist(0, 4);
          print(randoms);
          setState(() {
            _image = 'assets/images/${randoms[2]}.png';
            _first = _flags[randoms[0]].name;
            _second = _flags[randoms[1]].name;
            _third = _flags[randoms[2]].name;
            _fourth = _flags[randoms[3]].name;
          });
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Future<String> loadAsset() async {
    return await rootBundle.loadString('assets/Countries.json');
  }
}


