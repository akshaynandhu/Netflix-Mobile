import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/ModelClass/trendingmoviemodel.dart';
import 'package:netflix/pages/apiwidgets.dart';
import 'package:netflix/pages/search.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List dummyData = List.generate(50, (index) => '$index');

  // Future<LatestMovieModel> fetchAllMovies() async{
  //
  //   final response = await http.get(Uri.parse("https://api.themoviedb.org/3/movie/top_rated?api_key=6b7748961d5f16ca846b94614a575128&language=en-US&page=1"));
  //   if(response.statusCode == 200){
  //    final result = jsonDecode(response.body);
  //    // Iterable list = result["results"];
  //    // print(result);
  //   // return  list.map((e) => LatestMovieModel.fromJson(e)).toList();
  //     return LatestMovieModel.fromJson(result);
  //   } else{
  //     throw Exception('Failed To Load Movies');
  //   }
  //
  // }

  // List<LatestMovieModel> _movies = [];
  //
  // void  populateAllMovies() async{
  //   final movies = await fetchAllMovies();
  //   setState(() {
  //     _movies = movies;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Tv Shows',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        'Movies',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: const [
                          Text(
                            'Categories',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                          Icon(Icons.arrow_drop_down),
                        ],
                      )
                    ],
                  ),
                ],
              ),
              leading: Image.network(
                  'https://hollywoodlife.com/wp-content/uploads/2020/11/Netflix_Symbol_RGB-1.png'),
              backgroundColor: Colors.transparent,
              expandedHeight: 392,
              actions: [
                Row(
                  children: [
                    Image.network(
                      'https://upload.wikimedia.org/wikipedia/commons/thumb/2/26/Chromecast_cast_button_icon.svg/1024px-Chromecast_cast_button_icon.svg.png',
                      color: Colors.white,
                      scale: 45,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Image.network(
                      'https://occ-0-2041-3662.1.nflxso.net/art/0d282/eb648e0fd0b2676dbb7317310a48f9bdc2b0d282.png',
                      scale: 15,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ],
              flexibleSpace: FlexibleSpaceBar(
                background: Image.network(
                  'https://www.keralatv.in/media/2021/09/Malayalam-OTT-Releases.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              floating: true,
              toolbarHeight: 70,
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 60,
                      color: Colors.black,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                'Action',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(
                                Icons.fiber_manual_record,
                                size: 5,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Adventure',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: const [
                                  Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                  Text('My List',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white))
                                ],
                              ),
                              Container(
                                color: Colors.white,
                                width: 80,
                                height: 30,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Icon(Icons.play_arrow),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      'Play',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                children: const [
                                  Icon(Icons.info_outlined,
                                      color: Colors.white),
                                  Text('Info',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white))
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Text(
                          'Popular Movies',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),

                   const  Padding(
                      padding:  EdgeInsets.all(8.0),
                      child:  Popular(),
                    ),

                    // SizedBox(
                    //   width: double.infinity,
                    //   height: 150,
                    //   child: Padding(
                    //     padding: const EdgeInsets.symmetric(vertical: 8.0),
                    //     child: GridView.builder(
                    //       scrollDirection: Axis.horizontal,
                    //       // primary: true,
                    //       itemCount: dummyData.length,
                    //       gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    //           maxCrossAxisExtent: 200,
                    //           childAspectRatio: 3 / 2,
                    //           crossAxisSpacing: 20,
                    //           mainAxisSpacing: 5) ,
                    //       itemBuilder: (context, index) {
                    //         return GridTile(
                    //             child: Container(
                    //                 color: Colors.blue[200],
                    //                 alignment: Alignment.center,
                    //                 child: Text(dummyData[index])
                    //             )
                    //         );
                    //       },
                    //     ),
                    //   ),
                    // ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Text(
                          'Trending',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),

                    const Padding(
                      padding:  EdgeInsets.all(8.0),
                      child:  MoviesWidget(),
                    ),

                    // SizedBox(
                    //   width: double.infinity,
                    //   height: 150,
                    //   child: Padding(
                    //     padding: const EdgeInsets.symmetric(vertical: 8.0),
                    //     child: GridView.builder(
                    //       scrollDirection: Axis.horizontal,
                    //       // primary: true,
                    //       itemCount: dummyData.length,
                    //       gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    //           maxCrossAxisExtent: 200,
                    //           childAspectRatio: 3 / 2,
                    //           crossAxisSpacing: 20,
                    //           mainAxisSpacing: 5) ,
                    //       itemBuilder: (context, index) {
                    //         return GridTile(
                    //             child: Container(
                    //                 color: Colors.blue[200],
                    //                 alignment: Alignment.center,
                    //                 child: Text(dummyData[index])
                    //             )
                    //         );
                    //       },
                    //     ),
                    //   ),
                    // ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Text(
                          'Upcoming Movies',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),

                    const Padding(
                      padding:  EdgeInsets.all(8.0),
                      child: Upcoming(),
                    ),

                    // SizedBox(
                    //   width: double.infinity,
                    //   height: 150,
                    //   child: Padding(
                    //     padding: const EdgeInsets.symmetric(vertical: 8.0),
                    //     child: GridView.builder(
                    //       scrollDirection: Axis.horizontal,
                    //       // primary: true,
                    //       itemCount: dummyData.length,
                    //       gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    //           maxCrossAxisExtent: 200,
                    //           childAspectRatio: 3 / 2,
                    //           crossAxisSpacing: 20,
                    //           mainAxisSpacing: 5) ,
                    //       itemBuilder: (context, index) {
                    //         return GridTile(
                    //             child: Container(
                    //                 color: Colors.blue[200],
                    //                 alignment: Alignment.center,
                    //                 child: Text(dummyData[index])
                    //             )
                    //         );
                    //       },
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            )
          ],
        ),

        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.black,
          items:   <BottomNavigationBarItem>[
           const BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.video_library_outlined,color: Colors.grey,),
              label: 'News & Hot',
            ),
           const BottomNavigationBarItem(
              icon: Icon(Icons.sentiment_very_satisfied_outlined,color: Colors.grey,),
              label: 'Fast Laughs',
            ),
             BottomNavigationBarItem(
               icon: GestureDetector(
                   onTap: (){
                     Navigator.push(context, MaterialPageRoute(builder: (context)=>search()));
                   },
                   child: const Icon(Icons.search,color: Colors.grey,)),
              label: 'Search',
            ),
            const BottomNavigationBarItem(
              icon:  Icon(Icons.download_for_offline_outlined,color: Colors.grey,),
              label: 'Downloads',
            ),
          ],
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
        ),
      ),
    );
  }
}
