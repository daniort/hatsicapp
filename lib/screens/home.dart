import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hatsicapp/screens/platillos.dart';
import 'package:hatsicapp/screens/restaurantes.dart';
import 'package:hatsicapp/screens/settings.dart';
import 'package:hatsicapp/services/appstate.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  HomePage({this.title});

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

final _scaffoldKe = GlobalKey<ScaffoldState>();

class _HomePageState extends State<HomePage> {
  TextEditingController _emailController;
  TextEditingController _passwordController;
  TextEditingController _nameController;
  String nombre;
  String correo;

  void initState() {
    _passwordController = TextEditingController();
    _emailController = TextEditingController();
    _nameController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final _state = Provider.of<AppState>(context, listen: true);
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return Scaffold(
      key: _scaffoldKe,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              elevation: 0.0,
              leading: Padding(
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
              actions: <Widget>[
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
              backgroundColor: Colors.white,
              expandedHeight: 200.0,
              floating: true,
              pinned: true,
              snap: false,
              flexibleSpace: FlexibleSpaceBar(
                stretchModes: <StretchMode>[
                  StretchMode.zoomBackground,
                  StretchMode.blurBackground,
                  StretchMode.fadeTitle,
                ],
                background: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text('Que Deseas',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Colors.grey[800],
                                  fontSize: 30,
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
                              prefixIcon: Icon(Icons.search),
                              labelText: "Buscar"),
                        ),
                      ),
                    ),
                  ],
                ),
                //title: Text('Covid Report'),
                centerTitle: false,
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
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
                SizedBox(
                  height: 10,
                ),
              ]),
            )
          ];
        },
        body: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0),
                bottomLeft: Radius.circular(10.0)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        topRight: Radius.circular(10.0),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 15,
                child: Container(
                  child: Column(
                    children: <Widget>[
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
                        flex: 7,
                        child: Container(
                          width: ((MediaQuery.of(context).size.width)),
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
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
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
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
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
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      drawer: Drawer(
        child: Container(
          decoration: BoxDecoration(color: Colors.grey[100]),
          child: new ListView(
            children: <Widget>[
              Container(
                child: UserAccountsDrawerHeader(
                  accountName: Text("Hatsi!\nComida a Domicilio"),
                  currentAccountPicture: FittedBox(
                    fit: BoxFit.contain,
                    child: Placeholder(),
                  ),
                ),
              ),
              Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.verified_user,
                          color: Colors.grey[600],
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            _state.dataUser['nombre'],
                            textAlign: TextAlign.left,
                            style: TextStyle(color: Colors.grey[600]),
                          )),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.phone,
                          color: Colors.grey[600],
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            _state.dataUser['numero'].toString(),
                            textAlign: TextAlign.left,
                            style: TextStyle(color: Colors.grey[600]),
                          )),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.email,
                          color: Colors.grey[600],
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            _state.dataUser['correo'].toString(),
                            textAlign: TextAlign.left,
                            style: TextStyle(color: Colors.grey[600]),
                          )),
                    ],
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: GestureDetector(
                  onTap: () {
                    _state.logout();
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.exit_to_app,
                            color: Colors.grey[600],
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Cerrar Sesión",
                              textAlign: TextAlign.left,
                              style: TextStyle(color: Colors.grey[600]),
                            )),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
