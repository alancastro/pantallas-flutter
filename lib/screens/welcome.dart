import 'package:fast_food/screens/splash.dart';
import 'package:flutter/material.dart';


class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 255, 249, 239),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(image: AssetImage('assets/images/balloon-shape.png')),
          Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
              child:
                  Image(image: AssetImage('assets/images/FastFood-Logo.png')),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
              child: Image(
                  image: AssetImage('assets/images/online_groceries.png')),
            ),
          ),
          Center(
              child: Text(
            'El directorio de comida',
            style: TextStyle(
              color: Color.fromARGB(71, 34, 18, 1),
              fontSize: 24.0,
              decoration: TextDecoration.none,
            ),
          )),
          Center(
            child: FlatButton(
              minWidth: 300,
              height: 60,
              textColor: Color.fromRGBO(255, 240, 211, 1),
              onPressed: () {},
              child: Text('Busca, Ordena, Disfruta'),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xff24F229).withOpacity(0.7),
                  borderRadius: BorderRadius.circular(15)),
                  width: 320,
                  height: 65,
                  margin: EdgeInsets.only(top: 50),
                  child: FlatButton(
                    onPressed: (){
                      Navigator.push(context,MaterialPageRoute(builder: (context) => Splash()));
                    },
                    child: Text ('Iniciar ahora',
                    style: TextStyle(
                      fontSize: 25,
                      color: Color(0xffffffff),
                    ),
                    ),
                    ),
                    ),
                    ),
          )
        ],
      ),
    );
  }
}