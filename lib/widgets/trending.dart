import 'package:flutter/material.dart';
import 'package:test_app_flutter/utils/text.dart';

import '../description.dart';

class TrendingMovies extends StatelessWidget {
  final List trending;

  const TrendingMovies({Key? key, required this.trending}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          modified_text(
            text: 'Trending Movies',
            size: 26,
          ),
          SizedBox(height: 10),
          Container(
              height: 270,
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Description(
                                        name: trending[index]['title'],
                                        bannerurl:
                                            'https://image.tmdb.org/t/p/w500' +
                                                trending[index]
                                                    ['backdrop_path'],
                                        posterurl:
                                            'https://image.tmdb.org/t/p/w500' +
                                                trending[index]['poster_path'],
                                        description: trending[index]
                                            ['overview'],
                                        vote: trending[index]['vote_average']
                                            .toString(),
                                        launch_on: trending[index]
                                            ['release_date'],
                                      )));
                        },
                        title: Row(
                          children: [
                            SizedBox(
                                width: 100,
                                child: ClipRRect(
                                  child: Image.network(
                                    'https://image.tmdb.org/t/p/w500' +
                                        trending[index]['poster_path'],
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                )),
                            Flexible(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    modified_text(
                                      text: trending[index]['title'] != null
                                          ? trending[index]['title']
                                          : 'Loading',
                                      color: Colors.black,
                                      size: 15,
                                    ),
                                    modified_text(
                                      text: trending[index]['release_date'],
                                      color: Color.fromARGB(255, 117, 34, 34),
                                      size: 10,
                                    ),
                                    modified_text(
                                      text: trending[index]['overwiew'] != null
                                          ? trending[index]['overview']
                                          : 'Loading',
                                      color: Colors.black,
                                      size: 12,
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ));
                  }))
        ],
      ),
    );
  }
}
