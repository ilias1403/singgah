import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:daniel/helper/general_config.dart' as globals;

class UserController {
  // Validate User Data
  var client = http.Client();

  Future postDataUser(data) async {
    var response = await client.post(
        Uri.parse(globals.Api_base_url + '/user/validate_user'),
        body: data);
    if (response.statusCode == 200) {
      var jsons = json.decode(response.body);

      return jsons;
    }
  }

  Future checking_main_device_info(data) async {
    var response = await client.post(
        Uri.parse(globals.Api_base_url + '/user/checking_main_device_info'),
        body: data);
    if (response.statusCode == 200) {
      var jsons = json.decode(response.body);
      return jsons;
    }
  }

  Future user_logout(data) async {
    var response = await client.post(
        Uri.parse(globals.Api_base_url + '/user/user_logout'),
        body: data);
    if (response.statusCode == 200) {
      var jsons = json.decode(response.body);
      return jsons;
    }
  }
}
