import 'package:fast_food/screens/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fast_food/screens/login2.dart';
import 'package:fast_food/models/user.dart';
import 'package:fast_food/utils/string_adm.dart';
import 'package:fast_food/Providers/UsrPrv.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  User user = User();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    super.dispose();
  }

  Widget build(BuildContext context) {
    final UsrPrv userProvider = Provider.of<UsrPrv>(context);

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 230, 239),
      appBar: AppBar(
        backgroundColor: Color(0xfff44336),
        title: Row(
          children: [Text('Crear Cuenta')],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
                child: Image.asset(
                  'assets/images/login.png',
                  colorBlendMode: BlendMode.color,
                  width: 270.0,
                  height: 187.0,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
              child: Center(
                child: Text(
                  'Ingresa tus credenciales Registradas para acceder',
                  textAlign: TextAlign.center,
                  softWrap: true,
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                    height: 1.0,
                    color: Color(0xfff472212),
                    fontSize: 24.0,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 40),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          print('No se ingreso email');
                          return 'Debes ingresar tu email';
                        }
                        if (!StringAdm.validateEmail(value)) {
                          return 'Ingresa un Email valido';
                        }
                        user.email = value;
                        return null;
                      },
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 15.0,
                          horizontal: 10.0,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 50, 158, 255)),
                          borderRadius: BorderRadius.all(
                            Radius.circular(15.0),
                          ),
                        ),
                        prefixIcon: Icon(Icons.mail_sharp),
                        hintText: 'Email',
                        hintStyle: TextStyle(
                          fontSize: 14.0,
                          color: Colors.black38,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                      child: TextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Debes ingresar tu contraseña';
                          }
                          if (value.length < 4) {
                            return 'Contraseña demasiado corta';
                          }
                          user.password = value;
                          return null;
                        },
                        obscureText: true,
                        obscuringCharacter: "*",
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 15.0,
                            horizontal: 10.0,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromARGB(250, 50, 150, 253),
                              width: 1.5,
                              style: BorderStyle.solid,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(15.0),
                            ),
                          ),
                          prefixIcon: Icon(Icons.security_outlined),
                          hintText: 'Contraseña',
                          hintStyle: TextStyle(
                            fontSize: 14.0,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          '¿Aún no tienes cuenta?',
                          style: TextStyle(
                            color: Color(0xff7C7A7A),
                          ),
                        ),
                        FlatButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Login2()));
                          },
                          child: Text(
                            'Crear Ahora',
                            style: TextStyle(
                              color: Color(0xfff54647),
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 20.0),
                      child: SizedBox(
                        width: double.infinity,
                        height: 60.0,
                        child: LogginButton(
                            formKey: _formKey,
                            user: user,
                            userProvider: userProvider),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LogginButton extends StatelessWidget {
  const LogginButton({
    Key key,
    @required GlobalKey<FormState> formKey,
    @required this.user,
    @required this.userProvider,
  })  : _formKey = formKey,
        super(key: key);
  final GlobalKey<FormState> _formKey;
  final User user;
  final UsrPrv userProvider;

  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () async {
        final sb = SnackBar(
          content: Text('¡Usuario o contraseñas incorrectos'),
        );
        final snackBartoDashBorad = SnackBar(
          content: Row(
            children: [
              CircularProgressIndicator(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text('Ingresando a tu DashBoard'),
              ),
            ],
          ),
        );

        if (!_formKey.currentState.validate()) {
          return;
        }
        var retUsr = userProvider.getUser(user.email);
        print(retUsr.password);
        if (retUsr != null) {
          if (!StringAdm.validatePasswords(retUsr.password, user.password)) {
            Scaffold.of(context).showSnackBar(sb);
            print('Las contraseñas no coinciden');
          } else {
            Scaffold.of(context).showSnackBar(snackBartoDashBorad);
            await Future.delayed(Duration(seconds: 4));
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Dashboard(retUsr.name),
                ));
            print('Credenciales validas');
          }
        } else {
          Scaffold.of(context).showSnackBar(sb);
          print('Credenciales no validas en la BD');
        }
        _formKey.currentState.save();
      },
      child: Text(
        'Iniciar sesión',
        style: TextStyle(color: Colors.white),
      ),
      style: ButtonStyle(
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(
          Color.fromRGBO(252, 79, 50, 1),
        ),
      ),
    );
  }
}
