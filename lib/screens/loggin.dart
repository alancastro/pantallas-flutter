import 'package:flutter/material.dart';

class Loggin extends StatefulWidget {
  const Loggin({Key key}) : super(key: key);
  @override
  _LogginState createState() => _LogginState();
}

class _LogginState extends State<Loggin> {
  String nombre = "";
  final nombreController = TextEditingController();
  @override
  void dispose() {
    nombreController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crear Cuenta'),
        backgroundColor: Colors.orange,
      ),
      body: SingleChildScrollView(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
                  child: Image(image: AssetImage('assets/images/mujer.png')),
                ),
              ),
              Form(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Container(
                      width: 300,
                      height: 50,
                      decoration: BoxDecoration(
                          border: Border.all(width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: TextField(
                        decoration: InputDecoration(
                            labelText: 'Nombre',
                            icon: Icon(
                              Icons.person,
                              color: Colors.black,
                              size: 30,
                            )),
                      ),
                    ),
                  ),
                ),
              ),
              Form(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Container(
                      width: 300,
                      height: 50,
                      decoration: BoxDecoration(
                          border: Border.all(width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: TextField(
                        decoration: InputDecoration(
                            labelText: 'Email',
                            icon: Icon(
                              Icons.email,
                              color: Colors.black,
                              size: 30,
                            )),
                      ),
                    ),
                  ),
                ),
              ),
              Form(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Container(
                      width: 300,
                      height: 50,
                      decoration: BoxDecoration(
                          border: Border.all(width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: TextField(
                        decoration: InputDecoration(
                            labelText: 'Telefono',
                            icon: Icon(
                              Icons.phone_android,
                              color: Colors.black,
                              size: 30,
                            )),
                      ),
                    ),
                  ),
                ),
              ),
              Form(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Container(
                      width: 300,
                      height: 50,
                      decoration: BoxDecoration(
                          border: Border.all(width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: TextField(
                        obscureText: true,
                        obscuringCharacter: "*",
                        decoration: InputDecoration(
                            labelText: 'Contraseña',
                            icon: Icon(
                              Icons.security_outlined,
                              color: Colors.black,
                              size: 30,
                            )),
                      ),
                    ),
                  ),
                ),
              ),
              Form(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Container(
                      width: 300,
                      height: 50,
                      decoration: BoxDecoration(
                          border: Border.all(width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: TextField(
                        obscureText: true,
                        obscuringCharacter: "*",
                        decoration: InputDecoration(
                            labelText: 'Confirmar contraseña',
                            icon: Icon(
                              Icons.security_outlined,
                              color: Colors.black,
                              size: 30,
                            )),
                      ),
                    ),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.orange.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(15)),
                    width: 320,
                    height: 65,
                    margin: EdgeInsets.only(top: 50),
                    child: FlatButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Loggin()));
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          'REGISTRAR',
                          style: TextStyle(
                            fontSize: 25,
                            color: Color(0xffffffff),
                          ),
                        ),
                      ),
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
