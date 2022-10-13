import 'package:clonespotify/json/canciones_json.dart';
import 'package:clonespotify/paginas/detallecancion.dart';
import 'package:clonespotify/temas/colores.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:page_transition/page_transition.dart';

class AlbumPage extends StatefulWidget {
  const AlbumPage({Key? key, this.canciones}) : super(key: key);
  final dynamic canciones;
  @override
  State<AlbumPage> createState() => _AlbumPageState();
}

class _AlbumPageState extends State<AlbumPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: negro, //color de fondo
      body: cuerpoAlbum(), //formar cuerpo
    );
  }

//widget es cuando retorna un valor
//metodo o accion no retorna valor
//cuerpo del album
  Widget cuerpoAlbum() {
    var size = MediaQuery.of(context).size;
    List songAlbums = widget.canciones['songs'];
    return SingleChildScrollView(
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                width: size.width,
                height: 220,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(widget.canciones['img']),
                        fit: BoxFit.cover)),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(widget.canciones['title'],
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: blanco)),
                    Container(
                      decoration: BoxDecoration(
                          color: gris, borderRadius: BorderRadius.circular(5)),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 12, right: 12, top: 8, bottom: 8),
                        child: Text(
                          "Reproducir",
                          style: TextStyle(color: blanco),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Column(
                  children: List.generate(songAlbums.length, (index) {
                return Padding(
                  padding:
                      const EdgeInsets.only(left: 30, right: 30, bottom: 10),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              alignment: Alignment.bottomCenter,
                              child: MusicaDeta(
                                //la correccion es porque songs viene del json y el
                                //no lo interpretaba
                                title: songs[index]['title'],
                                color: songs[index]['color'],
                                description: songs[index]['description'],
                                img: songs[index]['img'],
                                songUrl: songs[index]['song_url'], songurl: '',
                              ),
                              type: PageTransitionType.scale));
                    },
                    child: Row(
                      children: [
                        Container(
                          width: (size.width - 60) * 0.77,
                          child: Text(
                            "${index + 1}  " + songAlbums[index]['title'],
                            style: TextStyle(color: blanco),
                          ),
                        ),
                        Container(
                          width: (size.width - 60) * 0.23,
                          height: 50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                songAlbums[index]['duration'],
                                style: TextStyle(color: gris, fontSize: 14),
                              ),
                              Container(
                                width: 25,
                                height: 25,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: gris.withOpacity(0.8),
                                ),
                                child: Center(
                                    child: Icon(
                                  Icons.play_arrow,
                                  color: blanco,
                                  size: 16,
                                )),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }))
            ],
          ),
          SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: blanco,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
                IconButton(
                    icon: Icon(
                      FeatherIcons.moreVertical,
                      color: blanco,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    })
              ],
            ),
          )
        ],
      ),
    );
  }
}
