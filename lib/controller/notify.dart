import 'dart:convert';

import 'package:daniel/model/notify_m.dart';
import 'package:http/http.dart' as http;
import 'package:daniel/helper/general_config.dart' as globals;

class NotifyController {
  // GET DATA
  var client = http.Client();

  Future get_NotifyEvent() async {
    var response = await client
        .get(Uri.parse(globals.Api_base_url + '/notify/send_notification_v2'));
    if (response.statusCode == 200) {
      var jsons = response.body;
      return notifyFromJson(jsons);
    }
  }
}
