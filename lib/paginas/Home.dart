import 'package:clonespotify/json/canciones_json.dart';
import 'package:clonespotify/paginas/album.dart';
import 'package:clonespotify/temas/colores.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter/painting.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  int menuactivo = 0;
  int menuactivo2 = 0;
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: negro,
      appBar: barraSpotApp(),
      body: cuerpoSpot(),
    );
  }

  barraSpotApp() {
    return AppBar(
      backgroundColor: negro,
      elevation: 10,
      title: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            "Music",
            style: TextStyle(
                fontSize: 20, color: blanco, fontWeight: FontWeight.bold),
          ),
          Icon(Icons.list_outlined)
        ]),
      ),
    );
  }

  cuerpoSpot() {
    return SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.only(left: 30, top: 20),
            child: Row(
              children: List.generate(song_type_1.length, (index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        menuactivo = index;
                      });
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          song_type_1[index],
                          style: TextStyle(
                              fontSize: 15,
                              color: menuactivo == index ? primario : gris,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: 3),
                        menuactivo == index
                            ? Container(
                                width: 10,
                                height: 3,
                                decoration: BoxDecoration(
                                    color: primario,
                                    borderRadius: BorderRadius.circular(50)))
                            : Container(),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Row(
              children: List.generate(songs.length, (index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 30),
                  child: GestureDetector(
                    onTap: () {
                      //cambio de wiget top
                      Navigator.push(
                          context,
                          PageTransition(
                              alignment: Alignment.bottomCenter,
                              child: AlbumPage(
                                canciones: songs[index],
                              ),
                              type: PageTransitionType.scale));
                      //fin cambio de widget top
                    },
                    child: Column(
                      children: [
                        Container(
                          width: 180,
                          height: 180,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(songs[index]['img']),
                                  fit: BoxFit.cover),
                              color: primario,
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          songs[index]['title'],
                          style: TextStyle(
                              color: blanco,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          width: 180,
                          child: Text(
                            songs[index]['description'],
                            maxLines: 1,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: gris,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
        // menu 2

        SizedBox(
          height: 50,
        ),

        SingleChildScrollView(),
        //segundo bloque menu centro
        SizedBox(
          height: 50,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Row(
              children: List.generate(songs.length, (index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 30),
                  child: GestureDetector(
                    onTap: () {
                      //cambio de wiget cetral
                      Navigator.push(
                          context,
                          PageTransition(
                              alignment: Alignment.bottomCenter,
                              child: AlbumPage(
                                canciones: songs[index],
                              ),
                              type: PageTransitionType.scale));
                      //fin cambio de widget
                    },
                    child: Column(
                      children: [
                        Container(
                          width: 180,
                          height: 180,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(songs[index]['img']),
                                  fit: BoxFit.cover),
                              color: primario,
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          songs[index]['title'],
                          style: TextStyle(
                              color: blanco,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          width: 180,
                          child: Text(
                            songs[index]['description'],
                            maxLines: 1,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: gris,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
//fin menu centro
        //tercer bloque

        SizedBox(
          height: 50,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Row(
              children: List.generate(songs.length, (index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 30),
                  child: GestureDetector(
                    onTap: () {
                      //cambio de wiget tercero
                      Navigator.push(
                          context,
                          PageTransition(
                              alignment: Alignment.bottomCenter,
                              child: AlbumPage(
                                canciones: songs[index],
                              ),
                              type: PageTransitionType.scale));
                      //fin cambio de widget tercero
                    },
                    child: Column(
                      children: [
                        Container(
                          width: 180,
                          height: 180,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(songs[index]['img']),
                                  fit: BoxFit.cover),
                              color: primario,
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          songs[index]['title'],
                          style: TextStyle(
                              color: blanco,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          width: 180,
                          child: Text(
                            songs[index]['description'],
                            maxLines: 1,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: gris,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
        )
      ]),
    );
  }
}
