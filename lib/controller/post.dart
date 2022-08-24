import 'dart:convert';

import 'package:daniel/model/post_m.dart';
import 'package:http/http.dart' as http;
import 'package:daniel/helper/general_config.dart' as globals;

class PostController {
  // GET DATA
  var client = http.Client();

  Future getQuoteList() async {
    var response = await client
        .get(Uri.parse(globals.Api_base_url + '/post/fetch_data_posts'));
    if (response.statusCode == 200) {
      var jsons = response.body;
      return postFromJson(jsons);
    }
  }

  Future addQuotes(data) async {
    var response = await client
        .post(Uri.parse(globals.Api_base_url + '/super/add_quote'), body: data);
    var jsons = json.decode(response.body);
    if (response.statusCode == 200 && jsons['status'] == 'success') {
      return true;
    } else {
      return false;
    }
  }

  Future editQuotes(data) async {
    var response = await client.post(
        Uri.parse(globals.Api_base_url + '/super/edit_quote'),
        body: data);
    var jsons = json.decode(response.body);
    if (response.statusCode == 200 && jsons['status'] == 'success') {
      return true;
    } else {
      return false;
    }
  }

  Future getQuoteById(id) async {
    var data = {
      "quote_id": id,
    };
    var response = await client.post(
        Uri.parse(globals.Api_base_url + '/super/get_quote_by_id'),
        body: data);
    var jsons = json.decode(response.body);
    if (response.statusCode == 200) {
      return jsons;
    } else {
      return false;
    }
  }

  Future deleteQuote(id) async {
    var data = {
      "quote_id": id,
    };
    var response = await client.post(
        Uri.parse(globals.Api_base_url + '/super/delete_quote'),
        body: data);
    var jsons = json.decode(response.body);
    if (response.statusCode == 200 && jsons['status'] == 'success') {
      return true;
    } else {
      return false;
    }
  }
}
