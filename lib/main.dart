import 'package:flutter/material.dart';
import 'package:test_app_flutter/utils/text.dart';
import 'package:test_app_flutter/widgets/trending.dart';
import 'package:tmdb_api/tmdb_api.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
      theme: ThemeData(brightness: Brightness.dark, primaryColor: Colors.green),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final String apikey = '67af5e631dcbb4d0981b06996fcd47bc';
  final String readaccesstoken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2N2FmNWU2MzFkY2JiNGQwOTgxYjA2OTk2ZmNkNDdiYyIsInN1YiI6IjYwNzQ1OTA0ZjkyNTMyMDAyOTFmZDczYSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.C_Bkz_T8OybTGo3HfYsESNjN46LBYdw3LHdF-1TzYYs';
  List trendingmovies = [];

  @override
  void initState() {
    super.initState();
    loadmovies();
  }

  loadmovies() async {
    TMDB tmdbWithCustomLogs = TMDB(
      ApiKeys(apikey, readaccesstoken),
      logConfig: ConfigLogger(
        showLogs: true,
        showErrorLogs: true,
      ),
    );

    Map trendingresult = await tmdbWithCustomLogs.v3.trending.getTrending();
    print((trendingresult));
    setState(() {
      trendingmovies = trendingresult['results'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: modified_text(text: 'Flutter Movie App ❤️'),
          backgroundColor: Color.fromARGB(0, 143, 87, 87),
        ),
        body: ListView(
          children: [
            TrendingMovies(
              trending: trendingmovies,
            ),
          ],
        ));
  }
}
