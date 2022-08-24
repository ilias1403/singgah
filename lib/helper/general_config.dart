library globals;

int globalInt = 0;
bool globalBoolean = true;
String globalString = "";
double globalDouble = 10.0;
// ignore: non_constant_identifier_names
// String Api_base_url = "https://6c04-202-168-78-212.ngrok.io/super";
String Api_base_url =
    "http://app-barton.zinx2yqtmb-ez94dnv9n3mr.p.temp-site.link";

AD(Object object) async {
  int defaultPrintLength = 1020;
  if (object == null || object.toString().length <= defaultPrintLength) {
    print(object);
  } else {
    String log = object.toString();
    int start = 0;
    int endIndex = defaultPrintLength;
    int logLength = log.length;
    int tmpLogLength = log.length;
    while (endIndex < logLength) {
      print(log.substring(start, endIndex));
      endIndex += defaultPrintLength;
      start += defaultPrintLength;
      tmpLogLength -= defaultPrintLength;
    }
    if (tmpLogLength > 0) {
      print(log.substring(start, logLength));
    }
  }
}
