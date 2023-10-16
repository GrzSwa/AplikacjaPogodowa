class WeatherIcon{
  Map<int,String> iconMap = {
    0: "☀️",
    1: "☀️",
    2: "🌤️",
    3: "⛅️",
    45: "☁️",
    48: "☁️",
    51: "🌦️",
    53: "🌦️",
    55: "🌦️",
    61: "🌦️",
    63: "🌧️",
    65: "🌧️",
    71: "🌨️",
    80: "🌧️",
    81: "🌧️",
    95: "🌧️",
    96: "🌩️",
  };
  Map<int,String> weatherMap = {
    0: "Słonecznie",
    1: "Pogodnie",
    2: "Częściowe zachmurzenie",
    3: "Pochmurno",
    45: "Zachmurzenie",
    48: "Zachmurzenie",
    51: "Przelotne opady",
    53: "Przelotne opady",
    55: "Przelotne opady",
    61: "Przelotne opady",
    63: "Deszcz",
    65: "Deszcz",
    71: "Śnieg",
    80: "Deszcz",
    81: "Deszcz",
    95: "Deszcz",
    96: "Burza",
  };

  String getIcon(int weathercode){
    if(iconMap.containsKey(weathercode)){
      return iconMap[weathercode].toString();
    }else{
      return "Null";
    }
  }

  String getWeather(int weathercode){
    if(weatherMap.containsKey(weathercode)){
      return weatherMap[weathercode].toString();
    }else{
      return "Null";
    }
  }
}