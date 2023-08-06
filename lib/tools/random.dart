import 'dart:math';

final random = Random();

int randomInt(int min, int max) => min + random.nextInt(max - min);
DateTime randomDate(DateTime min, DateTime max) =>
    min.add(Duration(seconds: randomInt(0, max.difference(min).inSeconds)));
