
import 'package:flutter/material.dart';
import 'package:netflix/ModelClass/popularmovies.dart';
import 'package:netflix/pages/apiwidgets.dart';
import 'package:netflix/pages/moviedescription.dart';

class search extends StatefulWidget {

  final String? text;
  final ValueChanged<String>? onSearched;
  final String? hintText;

   search({Key? key, this.text, this.onSearched, this.hintText}) : super(key: key);


  @override
  State<search> createState() => _searchState();
}

class _searchState extends State<search> {

  String? onSearched;

  var searchController = TextEditingController();

  Search _search(){
    Search _search = Search(onSearched: onSearched);
    return _search;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          actions: [
            Image.network(
              'https://occ-0-2041-3662.1.nflxso.net/art/0d282/eb648e0fd0b2676dbb7317310a48f9bdc2b0d282.png',
              scale: 15,
            ),
            const SizedBox(
              width: 10,
            ),
          ],
        ),
        body: ListView(
          shrinkWrap: true,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 40,vertical: 10),
              padding: const EdgeInsets.all(8),
              height: 40,
              width: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[800]
              ),
              child: Row(
                children: [
                  const Icon(Icons.search,
                    size: 20,
                    color: Colors.white,),
                 const SizedBox(
                    width: 5,
                  ),
                  Expanded(child: TextFormField(
                    onChanged: (String text){
                      setState(() {
                        onSearched = text.replaceAll(" ", "%20");
                      });
                    },
                    controller: searchController,
                    decoration: const InputDecoration.collapsed(hintText: "Search for a show, movie, genre, etc.",hintStyle:TextStyle(color: Colors.white,fontSize: 13),),style: TextStyle(color: Colors.white),
                  ),
                  ),
                  const Icon(Icons.mic,
                    size: 20,
                    color: Colors.white,),
                ],
              ),
            ),

            SizedBox(
              height: double.maxFinite,
              child: FutureBuilder<PopularMovies>(
                  future: _search().searchMovie(),
                  builder: (context,snapshot){
                    if(!snapshot.hasData){
                      return const Center(child: CircularProgressIndicator(),);
                    }
                    return ListView.builder(
                      itemCount: snapshot.data!.results!.length,
                      itemBuilder: (context,index){
                        var data = snapshot.data!.results![index];
                        return Padding(
                            padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            leading: SizedBox(
                              height: 50,
                              width: 50,
                              child: Image.network('https://www.themoviedb.org/t/p/original${data.posterPath ?? data.backdropPath}',fit: BoxFit.contain,),
                            ),
                            title: Text('${data.title}',style: const TextStyle(color: Colors.white),),
                            trailing: const Icon(Icons.play_arrow,color: Colors.white,),
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Description(movie: data,)));
                            },
                          ),
                        );
                      },
                    );
                  }),
            )

          ],
        ),
      ),
    );
  }
}
