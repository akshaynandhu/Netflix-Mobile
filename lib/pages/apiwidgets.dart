import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix/ModelClass/trendingmoviemodel.dart';
import 'package:http/http.dart' as http;
import 'package:netflix/ModelClass/popularmovies.dart';
import 'package:netflix/ModelClass/upcomingmovies.dart';
import 'package:netflix/pages/moviedescription.dart';


//-------------------------------TRENDING MOVIES API------------------------------------//


class MoviesWidget extends StatefulWidget {
  const MoviesWidget({Key? key}) : super(key: key);

  @override
  State<MoviesWidget> createState() => _MoviesWidgetState();
}

class _MoviesWidgetState extends State<MoviesWidget> {

  Future<LatestMovieModel> fetchAllMovies() async{

    final response = await http.get(Uri.parse("https://api.themoviedb.org/3/movie/top_rated?api_key=6b7748961d5f16ca846b94614a575128&language=en-US&page=1"));
    if(response.statusCode == 200){
      final result = jsonDecode(response.body);
      // Iterable list = result["results"];
      // print(result);
      // return  list.map((e) => LatestMovieModel.fromJson(e)).toList();
      return LatestMovieModel.fromJson(result);
    } else{
      throw Exception('Failed To Load Movies');
    }

  }
  

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 200,
      child: FutureBuilder(
        future: fetchAllMovies(),
          builder: (BuildContext context, AsyncSnapshot<LatestMovieModel> snapshot){
          if(snapshot.hasData) {
            return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data!.results!.length,
                itemBuilder: (context, index) {
                  final movie = snapshot.data!.results![index];
                  return SizedBox(
                    height: 200,
                    width: 150,
                    child: GestureDetector(
                      onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>Description(index: index,movie: movie,))),
                      child: Image(image: NetworkImage(
                          'https://www.themoviedb.org/t/p/original${movie.posterPath ?? movie.backdropPath}')
                      ),
                    ),
                    // child: Text(movie.,style: TextStyle(color: Colors.white),),
                  );
                }
            );
          }else{
            return const Center(child: SizedBox(
              height: 40,
                width: 40,
                child: CircularProgressIndicator()));
          }
          }
      ),
    );

    // return SizedBox(
    //   width: double.infinity,
    //   height: 150,
    //   child: Padding(
    //     padding: const EdgeInsets.symmetric(vertical: 8.0),
    //     child: GridView.builder(
    //       scrollDirection: Axis.horizontal,
    //       // primary: true,
    //       itemCount: movies.length,
    //       gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
    //           maxCrossAxisExtent: 200,
    //           childAspectRatio: 3 / 2,
    //           crossAxisSpacing: 20,
    //           mainAxisSpacing: 5) ,
    //       itemBuilder: (context, index) {
    //         final movie = movies[index];
    //         return GridTile(
    //             child: Container(
    //                 color: Colors.blue[200],
    //                 alignment: Alignment.center,
    //                 child: Text(movie.title.toString(),style: TextStyle(color: Colors.white),)
    //             )
    //         );
    //       },
    //     ),
    //   ),
    // );

  }
}


//-------------------------------POPULAR MOVIES API------------------------------------//

class Popular extends StatefulWidget {
  const Popular({Key? key}) : super(key: key);

  @override
  State<Popular> createState() => _PopularState();
}

class _PopularState extends State<Popular> {

  Future<PopularMovies> fetchAllPopular() async{

    final response = await http.get(Uri.parse("https://api.themoviedb.org/3/movie/popular?api_key=6b7748961d5f16ca846b94614a575128&language=en-US&page=1"));
    if(response.statusCode == 200){
      final result = jsonDecode(response.body);
      // Iterable list = result["results"];
      // print(result);
      // return  list.map((e) => LatestMovieModel.fromJson(e)).toList();
      return PopularMovies.fromJson(result);
    } else{
      throw Exception('Failed To Load Movies');
    }

  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 200,
      child: FutureBuilder(
          future: fetchAllPopular(),
          builder: (BuildContext context, AsyncSnapshot<PopularMovies> snapshot){
            if(snapshot.hasData) {
              return ListView.builder(
                reverse: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data!.results!.length,
                  itemBuilder: (context, index) {
                    final movie = snapshot.data!.results![index];
                    return SizedBox(
                      height: 200,
                      width: 150,
                      child: GestureDetector(
                        onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>Description(index: index,movie: movie,))),
                        child: Image(image: NetworkImage(
                            'https://www.themoviedb.org/t/p/original${movie.posterPath ?? movie.backdropPath}')),
                      ),
                      // child: Text(movie.,style: TextStyle(color: Colors.white),),
                    );
                  }
              );
            }else{
              return const Center(child: SizedBox(
                  height: 40,
                  width: 40,
                  child: CircularProgressIndicator()));
            }
          }
      ),
    );
  }
}


//-------------------------------UPCOMING MOVIES API------------------------------------//

class Upcoming extends StatefulWidget {
  const Upcoming ({Key? key}) : super(key: key);

  @override
  State<Upcoming> createState() => _UpcomingState();
}

class _UpcomingState extends State<Upcoming> {

  Future<UpcomingMovies> fetchAllShows() async{

    final response = await http.get(Uri.parse("https://api.themoviedb.org/3/movie/upcoming?api_key=6b7748961d5f16ca846b94614a575128&language=en-US&page=1"));
    if(response.statusCode == 200){
      final result = jsonDecode(response.body);
      // Iterable list = result["results"];
      // print(result);
      // return  list.map((e) => LatestMovieModel.fromJson(e)).toList();
      return UpcomingMovies.fromJson(result);
    } else{
      throw Exception('Failed To Load Movies');
    }

  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 200,
      child: FutureBuilder(
          future: fetchAllShows(),
          builder: (BuildContext context, AsyncSnapshot<UpcomingMovies> snapshot){
            if(snapshot.hasData) {
              return ListView.builder(
                reverse: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data!.results!.length,
                  itemBuilder: (context, index) {
                    final movie = snapshot.data!.results![index];
                    return SizedBox(
                      height: 200,
                      width: 150,
                      child: GestureDetector(
                        onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>Description(index: index,movie: movie,))),
                        child: Image(image: NetworkImage(
                            'https://www.themoviedb.org/t/p/original${movie.posterPath ?? movie.backdropPath}')),
                      ),
                      // child: Text(movie.,style: TextStyle(color: Colors.white),),
                    );
                  }
              );
            }else{
              return const Center(child: SizedBox(
                  height: 40,
                  width: 40,
                  child: CircularProgressIndicator()));
            }
          }
      ),
    );
  }
}

// --------------------------------SEARCH API---------------------------------------------------  //


class Search{
  String? onSearched;

  String apiUrl="https://api.themoviedb.org/3/movie/popular?api_key=6b7748961d5f16ca846b94614a575128&language=en-US&page=1";

  Search({this.onSearched});

  String searchApi(){
    String searchApi = "https://api.themoviedb.org/3/search/movie?api_key=6b7748961d5f16ca846b94614a575128&language=en-US&query=$onSearched&page=1&include_adult=false";
    return searchApi;
  }

  Future<PopularMovies> searchMovie({String? query}) async{
    var response = await http.get(Uri.parse( searchApi() ),);

    if(response.statusCode == 200){
      final result = jsonDecode(response.body);
      // Iterable list = result["results"];
      // print(result);
      // return  list.map((e) => LatestMovieModel.fromJson(e)).toList();
      return PopularMovies.fromJson(result);
    } else{
      throw Exception('Failed To Load Movies');
    }

  }

}