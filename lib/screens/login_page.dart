import 'package:examen_practic/preferences/preferences.dart';
import 'package:examen_practic/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginDemoState createState() => _LoginDemoState();
}

class _LoginDemoState extends State<LoginPage> {
  var _correoLogin = '';
  var _contrasenaLogin = '';
  var _passl = false;
  var _corrl = false;
  var one = 0;
  var two = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 15,
              ),
              child: Image.asset(
                'assets/icon.png',
                fit: BoxFit.fill,
                width: 150,
                height: 150,
                alignment: Alignment.center,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                decoration: InputDecoration(
                    icon: Icon(Icons.mail),
                    border: OutlineInputBorder(),
                    helperText:
                        (!_corrl && two != 0) ? 'Tamaño insuficiente' : '',
                    labelText: (Preferences.isRecordado &&
                            Preferences.correo.length > 5)
                        ? '${Preferences.correo}'
                        : 'Correo',
                    hintText: 'Introduce un correo valido'),
                onChanged: (value) {
                  _correoLogin = value;
                  if (_correoLogin.length < 5) {
                    two = 1;
                    _corrl = false;
                    Preferences.isLarger = false;
                  } else {
                    two = 0;
                    _corrl = true;
                  }
                  setState(() {});
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                    icon: Icon(Icons.password),
                    border: OutlineInputBorder(),
                    helperText:
                        (!_passl && one != 0) ? 'Tamaño insuficiente' : '',
                    labelText: (Preferences.isRecordado &&
                            Preferences.contrasena.length > 5)
                        ? '${Preferences.contrasena}'
                        : 'Contraseña',
                    hintText: 'Introduce una contraseña segura'),
                onChanged: (value) {
                  _contrasenaLogin = value;
                  if (_contrasenaLogin.length < 5) {
                    one = 1;
                    _passl = false;
                    Preferences.isLarger = false;
                  } else {
                    one = 0;
                    _passl = true;
                  }
                  setState(() {});
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                Text('Recuerdame',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 21,
                        color: Color.fromARGB(255, 88, 88, 88))),
                Checkbox(
                  value: Preferences.isRecordado,
                  activeColor: Color.fromARGB(120, 120, 15, 1),
                  onChanged: (value) {
                    if (Preferences.isRecordado) {
                      Preferences.isRecordado = false;
                      Preferences.contrasena = '';
                      Preferences.correo = '';
                      Preferences.isLarger = false;
                    } else
                      Preferences.isRecordado = true;

                    print(Preferences.isRecordado.toString());
                    setState(() {});
                  },
                ),
              ],
            ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: TextButton(
                onPressed: () {
                  if (Preferences.isLarger) {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => HomePage()));
                  }

                  if (_corrl && _passl) {
                    _corrl = false;
                    _passl = false;
                    Preferences.contrasena = _contrasenaLogin;
                    Preferences.correo = _correoLogin;
                    Preferences.isLarger = true;
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => HomePage()));
                  }
                },
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
            SizedBox(
              height: 130,
            ),
          ],
        ),
      ),
    );
  }
}
