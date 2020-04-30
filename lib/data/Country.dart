import 'package:http/http.dart' as http;
import 'dart:convert';

class Country{
  int total_tested=0;
  int total_positive=0;
  int total_death=0;
  int total_recovered=0;

  Future getData() async {
    http.Response response = await http.get(
        Uri.encodeFull("https://covidapi.mohp.gov.np/api/v1/stats/"),
        //Uri.encodeFull("http://192.168.43.152:8000/data/"),
        headers: {"Accept": "application/json"}
    );
    var jsonData=json.decode(response.body);

    this.total_tested=jsonData['tested'];
    this.total_positive=jsonData['confirmed'];
    this.total_recovered=jsonData['total_recovered'];
    this.total_death=jsonData['death'];
  }
}

class Province extends Country{
  int total_tested=0;
  int total_positive=0;
  int total_death=0;
  int total_recovered=0;
  String name;
}

class World extends Country{
  int total_tested=0;
  int total_positive = 0;
  int total_death = 0;
  int total_recovered = 0;

  Future getDataWorld() async {
    http.Response response = await http.get(
        Uri.encodeFull("https://covidapi.mohp.gov.np/api/v1/global-data/"),
        headers: {"Accept": "application/json"}
    );
    var jsonData = json.decode(response.body);
    this.total_positive = jsonData[0]['total_infected_global'];
    this.total_recovered = jsonData[0]['total_recovered_global'];
    this.total_death = jsonData[0]['total_deaths_global'];
  }
}