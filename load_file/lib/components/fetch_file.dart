import 'package:flutter/services.dart';

Future<String> fetchFileFromAssets(String assetsPath) async {
  return (assetsPath != '' && assetsPath != '.txt')
      ? rootBundle
          .loadString(assetsPath)
          .then((file) => file.toString())
          .catchError((error) {
          return 'файл не найден';
        })
      : Future.value('....');
}
