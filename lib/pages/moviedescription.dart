import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Description extends StatefulWidget {
  final index;
  final movie;
  const Description({Key? key, this.index, this.movie}) : super(key: key);

  @override
  State<Description> createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 300,
                color: Colors.black,
                child:  Image(image: NetworkImage(
                    'https://www.themoviedb.org/t/p/original${widget.movie.posterPath ?? widget.movie.backdropPath}')
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children:  [
                    Text(widget.movie.title,style: const TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.bold),),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                     Text('99% match 2016  ',style: TextStyle(color: Colors.green),),
                    Container(
                      width: 15,
                      height: 15,
                      color: Colors.grey[700],
                      child: const Center(child: Text('18+',style: TextStyle(color: Colors.white,fontSize: 8),)),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    const Text('6 Seasons  ',style: TextStyle(color: Colors.white,),),

                    Container(
                      width: 15,
                      height: 15,
                      color: Colors.grey[900],
                      child: const Center(child: Text('HD',style: TextStyle(color: Colors.white,fontSize: 8),)),
                    ),
                  ],
                ),
              ),


              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                padding: const EdgeInsets.all(8),
                height: 40,
                width: 600,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.play_arrow,),
                    Text('  Play',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),)
                  ],
                ),
              ),

              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                padding: const EdgeInsets.all(8),
                height: 40,
                width: 600,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[800]
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.download,color: Colors.white,),
                    Text('  Download',style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.bold),)
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Text(widget.movie.overview,style: TextStyle(color: Colors.white),),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: const [
                    Text('Cast:',style: TextStyle(color: Colors.grey),),
                  ],
                ),
              ),


              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: const [
                    Text('Creator:',style: TextStyle(color: Colors.grey),),
                  ],
                ),
              ),

              Row(
                children: const [
                  SizedBox(width: 50,),
                  Icon(Icons.add,color: Colors.white,),
                  SizedBox(width: 80,),
                  Icon(Icons.thumb_up_outlined,color: Colors.white,),
                  SizedBox(width: 80,),
                  Icon(Icons.send_outlined,color: Colors.white,),
                ],
              ),

             const SizedBox(
                height: 5,
              ),

              Row(
                children: const [
                  SizedBox(width: 40,),
                  Text('My List',style: TextStyle(color: Colors.grey),),
                  SizedBox(width: 65,),
                  Text('Rate',style: TextStyle(color: Colors.grey),),
                  SizedBox(width: 70,),
                  Text('Share',style: TextStyle(color: Colors.grey),),
                ],
              ),

              const Divider(
                endIndent: 250,
                indent: 10,
                color: Colors.red,
                height: 30,
                thickness: 5,
              ),

            ],
          ),
        ),
      ),
    );
  }
}
