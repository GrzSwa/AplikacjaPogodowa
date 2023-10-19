
import 'package:shared_preferences/shared_preferences.dart';


class LocalStorageService{
  final Map<String,dynamic> _defaultSettings = {};
  late bool _securityDisabled;


  Map<String,dynamic> get getSettings => _defaultSettings;
  bool get getSecurityStatus => _securityDisabled;


  Future<void> loadlLocalStorage() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? temperature = _prefs.getString("temperatureUnit");
    String? utniOfWindSpeed = _prefs.getString("utniOfWindSpeed");
    String? unitOfAtmosphericPressure = _prefs.getString("unitOfAtmosphericPressure");
    bool? autoUpdate = _prefs.getBool("autoUpdate");
    bool? soundEffect = _prefs.getBool("soundEffect");
    bool? security = _prefs.getBool("security");


    _defaultSettings["temperatureUnit"] = temperature ?? "ºC";
    _defaultSettings["utniOfWindSpeed"] = utniOfWindSpeed ?? "Kilometrów na godzinę (km/h)";
    _defaultSettings["unitOfAtmosphericPressure"] = unitOfAtmosphericPressure ?? "Milibar (mbar)";
    _defaultSettings["autoUpdate"] = autoUpdate ?? false;
    _defaultSettings["soundEffect"] = soundEffect ?? false;
    _defaultSettings["security"] = security ?? false;
    _securityDisabled = security ?? false;

  }
}