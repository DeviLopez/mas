import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static late SharedPreferences _prefs;

  static String _contrasena = '';
  static String _correo = '';
  static bool _isRecordado = false;
  static bool _datosLength = false;

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static String get contrasena {
    return _prefs.getString('pass') ?? _contrasena;
  }

  static set contrasena(String value) {
    _contrasena = value;
    _prefs.setString('pass', value);
  }

  static String get correo {
    return _prefs.getString('correo') ?? _contrasena;
  }

  static set correo(String value) {
    _correo = value;
    _prefs.setString('correo', value);
  }

  static bool get isRecordado {
    return _prefs.getBool('isRecordado') ?? _isRecordado;
  }

  static set isRecordado(bool value) {
    _isRecordado = value;
    _prefs.setBool('isRecordado', value);
  }

  static bool get isLarger {
    return _prefs.getBool('isLarger') ?? _datosLength;
  }

  static set isLarger(bool value) {
    _datosLength = value;
    _prefs.setBool('isLarger', value);
  }
}
