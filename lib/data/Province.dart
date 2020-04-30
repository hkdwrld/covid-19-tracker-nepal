import 'Country.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProvinceData{
  Province prov_1=new Province();
  Province prov_2=new Province();
  Province prov_3=new Province();
  Province prov_4=new Province();
  Province prov_5=new Province();
  Province prov_6=new Province();
  Province prov_7=new Province();
  List<Province> states=[];

  Future getDataProvince() async {
    http.Response response = await http.get(
        Uri.encodeFull(
            "https://covidapi.mohp.gov.np/api/v1/stats/?province=all"),
        headers: {"Accept": "application/json"}
    );
    var jsonData=json.decode(response.body);
    for (int i=0;i<7;i++){
      Province _state1=new Province();
      _state1.total_tested=jsonData[i]['total_tested'];
      _state1.total_positive=jsonData[i]['total_positive'];
      _state1.total_death=jsonData[i]['total_death'];
      _state1.total_recovered=jsonData[i]['total_recovered'];
      _state1.name=jsonData[i]['province_name'];
      states.add(_state1);
    }
    this.prov_1=states[0];
    this.prov_2=states[1];
    this.prov_3=states[2];
    this.prov_4=states[3];
    this.prov_5=states[4];
    this.prov_6=states[5];
    this.prov_7=states[6];
  }

}