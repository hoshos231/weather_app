import 'package:http/http.dart' as html ;
import 'dart:convert'as converter;

class NetworkHelper{
  final String url ;
  NetworkHelper(this.url);

  Future getData() async{

    html.Response response = await html.get(url);
    print(response.body);
    return converter.jsonDecode(response.body);



  }


}