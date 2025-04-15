import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:travel_app/core/models/model.dart';

class HomeController {
  var url = dotenv.env['baseUrl'];

  Future getCategories() async {
    Uri urlCategories = Uri.parse("$url/categories");
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    Login dataUser = loginFromJson(prefs.getString('login')!);
    String token = 'Bearer ' + dataUser.token;
    print(token);
    var response = await http.get(urlCategories, headers: {
      'Content-Type': 'application/json',
      'Authorization': token,
    });

    if (response.statusCode == 200) {
      List<Categories> data = categoriesFromJson(response.body);
      return data;
    } else {
      return null;
    }
  }

  Future getWisata() async {
    Uri urlWisata = Uri.parse("$url/wisata");
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    Login dataUser = loginFromJson(prefs.getString('login')!);
    String token = 'Bearer ' + dataUser.token;
    print(token);
    var response = await http.get(urlWisata, headers: {
      'Content-Type': 'application/json',
      'Authorization': token,
    });

    if (response.statusCode == 200) {
     DataWisata data = dataWisataFromJson(response.body);
     List<DetailWisata> favorit = data.data;
     favorit = favorit.where((x) => x.isFav == 1).toList();
     return [{
      "favorit": favorit,
      "populer": data.data
     }];
   } else {
     return null;
   }
  }
}
