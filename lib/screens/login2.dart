import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import 'package:fast_food/models/user.dart';
import 'package:fast_food/utils/string_adm.dart';
import 'package:fast_food/Providers/UsrPrv.dart';
import 'package:provider/provider.dart';

class Login2 extends StatefulWidget {
  const Login2({Key key}) : super(key: key);
  @override
  _Login2State createState() => _Login2State();
}

class _Login2State extends State<Login2> {
  String nombre = "";
  String email = "";
  String password = "";
  User user = User();
  final nombreController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nombreController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    final UsrPrv userProvider = Provider.of<UsrPrv>(context);

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 249, 239),
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
                  "assets/images/mujer.png",
                  colorBlendMode: BlendMode.color,
                  width: 270.0,
                  height: 187.0,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormField(
                      maxLength: 40,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp(r'[a-zA-Z]+|\s'))
                      ],
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Ingrese su nombre';
                        }
                        if (value.contains(new RegExp(r'[0-9]'))) {
                          return 'No puede ingresar numeros';
                        }
                        if (value.length < 4) {
                          return 'Nombre demasiado corto';
                        }
                        user.name = value;
                        return null;
                      },
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
                        prefixIcon: Icon(Icons.person),
                        hintText: 'Nombre',
                        hintStyle: TextStyle(
                          fontSize: 14.0,
                          color: Colors.black38,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: TextFormField(
                        inputFormatters: [
                          FilteringTextInputFormatter.deny(RegExp(r'\s'))
                        ],
                        validator: (value) {
                          if (value.isEmpty) {
                            print('No se ingreso Email');
                            return 'Debes de ingresar un Email';
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
                              color: Color.fromARGB(250, 50, 150, 253),
                              width: 1.5,
                              style: BorderStyle.solid,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(15.0),
                            ),
                          ),
                          prefixIcon: Icon(Icons.email),
                          hintText: 'Email',
                          hintStyle: TextStyle(
                            fontSize: 14.0,
                            color: Colors.black38,
                          ),
                        ),
                      ),
                    ),
                    TextFormField(
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(10),
                      ],
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Ingrese su número de telefono';
                        }

                        user.phone = value;
                        return null;
                      },
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
                        prefixIcon: Icon(Icons.phone),
                        hintText: 'Telefono',
                        hintStyle: TextStyle(
                          fontSize: 14.0,
                          color: Colors.black38,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: TextFormField(
                        validator: (value) {
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
                    TextFormField(
                      validator: (value) {
                        if (!StringAdm.validatePasswords(
                            value, user.password)) {
                          return 'Las contraseñas no coinciden';
                        }
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
            )
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
        if (!_formKey.currentState.validate()) {
          return;
        }

        print('Todo bien');
        print(user.email);
        print(user.password);
        final sb = SnackBar(
          content: Text('¡Los datos se han guardado!'),
        );

        Scaffold.of(context).showSnackBar(sb);
        userProvider.user = user;
        userProvider.users = user;
        _formKey.currentState.save();
        await Future.delayed(Duration(seconds: 3));
        Navigator.pop(context);
      },
      child: Text(
        'CREAR CUENTA',
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
