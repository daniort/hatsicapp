import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hatsicapp/screens/home.dart';
import 'package:hatsicapp/screens/login.dart';
import 'package:hatsicapp/screens/platillos.dart';
import 'package:hatsicapp/screens/restaurantes.dart';
import 'package:hatsicapp/screens/settings.dart';
import 'package:hatsicapp/services/appstate.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppState>(
        create: (BuildContext context) => AppState(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            splashColor: Colors.grey[800],
            primaryColor: Colors.grey[800],
            primarySwatch: Colors.grey,
          ),
          title: 'Hatsi!',
          routes: {
            "/": (BuildContext context) {
              if (Provider.of<AppState>(context, listen: true).islogin()) {
                
                return HomePage();
              } else {
                
                return SalaEspera();
              }
            }
          },
        ));
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Settings(),
                        ),
                      );
                    },
                    icon: Icon(
                      FontAwesomeIcons.bars,
                      size: 23,
                      color: Colors.grey[400],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Hatsi!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 23,
                          fontFamily: 'Chasy')),
                )
              ],
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text('Que Deseas',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Colors.grey[800],
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'CaviarDreams')),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text("pedir el día de hoy?",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Colors.grey[800],
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                          fontFamily: 'CaviarDreams')),
                ),
              ],
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search), labelText: "Buscar"),
                ),
              ),
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Categorias",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'CaviarDreams')),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Restaurantes(),
                        ),
                      );
                    },
                    child: Container(
                      height: _size.height * 0.22,
                      width: _size.width * 0.3,
                      color: Color(0xff540036),
                      child: Stack(
                        children: <Widget>[
                          Opacity(
                            opacity: 0.6,
                            child: Image.asset(
                              "assets/images/rest_bg.jpg",
                              height: _size.height * 0.22,
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 30.0),
                              child: Text("Restaurantes",
                                  style: TextStyle(
                                      color: Colors.grey[100],
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'CaviarDreams')),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Platillos(),
                        ),
                      );
                    },
                    child: Container(
                      height: _size.height * 0.22,
                      width: _size.width * 0.3,
                      color: Color(0xff760048),
                      child: Stack(
                        children: <Widget>[
                          Opacity(
                            opacity: 0.6,
                            child: Image.asset(
                              "assets/images/plat_bg.jpg",
                              height: _size.height * 0.22,
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 30.0),
                              child: Text("Platillos",
                                  style: TextStyle(
                                      color: Colors.grey[100],
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'CaviarDreams')),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    height: _size.height * 0.22,
                    width: _size.width * 0.3,
                    color: Color(0xffb60041),
                    child: Stack(
                      children: <Widget>[
                        Opacity(
                          opacity: 0.8,
                          child: Image.asset(
                            "assets/images/racien_bg.jpg",
                            height: _size.height * 0.22,
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 30.0),
                            child: Text("Recientes",
                                style: TextStyle(
                                    color: Colors.grey[100],
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'CaviarDreams')),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Pedidos Recientes",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'CaviarDreams')),
                ),
              ],
            ),
            Expanded(
              child: Container(
                //  height: _size.height * 0.2,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: ListView(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                height: _size.height * 0.15,
                                //width: _size.width * 0.3,
                                color: Colors.white,
                                child: Opacity(
                                  opacity: 0.9,
                                  child: Image.asset(
                                    "assets/images/plat_bg.jpg",
                                    //  height: _size.height * 0.22,
                                    fit: BoxFit.fitHeight,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text('Spagetti',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 23,
                                        color: Colors.grey[800],
                                      )),
                                  Text('Pedido 123 Veces',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey[800],
                                      )),
                                  Text('Precio \$123.00',
                                      style: TextStyle(
                                        color: Colors.grey[800],
                                      )),
                                  Text('Restaurant Los Sauces',
                                      style: TextStyle(
                                        color: Colors.grey[800],
                                      )),
                                  Container(
                                    color: Colors.red[200],
                                    child: Text('Hace 4min.',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey[100],
                                        )),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                height: _size.height * 0.15,
                                //width: _size.width * 0.3,
                                color: Colors.white,
                                child: Opacity(
                                  opacity: 0.9,
                                  child: Image.asset(
                                    "assets/images/plat_bg.jpg",
                                    //  height: _size.height * 0.22,
                                    fit: BoxFit.fitHeight,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text('Alitas Sky',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 23,
                                        color: Colors.grey[800],
                                      )),
                                  Text('Pedido 123 Veces',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey[800],
                                      )),
                                  Text('Precio \$123.00',
                                      style: TextStyle(
                                        color: Colors.grey[800],
                                      )),
                                  Text('Restaurant Los Sauces',
                                      style: TextStyle(
                                        color: Colors.grey[800],
                                      )),
                                  Container(
                                    color: Colors.red[200],
                                    child: Text('Hace 4min.',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey[100],
                                        )),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                height: _size.height * 0.15,
                                //width: _size.width * 0.3,
                                color: Colors.white,
                                child: Opacity(
                                  opacity: 0.9,
                                  child: Image.asset(
                                    "assets/images/plat_bg.jpg",
                                    //  height: _size.height * 0.22,
                                    fit: BoxFit.fitHeight,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                              child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text('Hamburguesa Charly',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 23,
                                      color: Colors.grey[800],
                                    )),
                                Text('Pedido 123 Veces',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey[800],
                                    )),
                                Text('Precio \$123.00',
                                    style: TextStyle(
                                      color: Colors.grey[800],
                                    )),
                                Text('Restaurant Los Sauces',
                                    style: TextStyle(
                                      color: Colors.grey[800],
                                    )),
                                Container(
                                  color: Colors.red[200],
                                  child: Text('Hace 6min.',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey[100],
                                      )),
                                ),
                              ],
                            ),
                          ))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
