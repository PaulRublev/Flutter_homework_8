import 'dart:math';

Stream<int> dataStream(int count) async* {
  var random = Random();
  while (count > 0) {
    int rand = random.nextInt(100);
    if (rand < 20) {
      throw 'Ошибка, число меньше 20';
    } else {
      count = count - 1;
      await Future.delayed(const Duration(seconds: 1));
      yield rand;
    }
  }
}

Future<String> dataFuture() async {
  var random = Random();
  final response = await Future.delayed(const Duration(seconds: 1), () {
    final isSuccess = random.nextBool();
    return isSuccess;
  });
  if (response) {
    return 'Данные успешно получены';
  } else {
    throw 'Ошибка загрузки данных';
  }
}
