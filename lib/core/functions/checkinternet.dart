import 'dart:io';

Future<bool> checkInternet() async {
  try {
    var result = await InternetAddress.lookup("facebook.com");
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  } on SocketException catch (_) {
    return false;
  }
}
