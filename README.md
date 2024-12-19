# korean_particle

<img src="https://github.com/GeekTree0101/korean_particle/blob/main/res/banner.png" />

Prepositional particles in Korean for Dart

## pubspec.yaml
```yml
dependencies:
  flutter:
    sdk: flutter
  korean_particle: ^1.0.0
```

## Usage
1. Insert Korean particles such as {와/과} and {이/가} into a String using ICU message format.
2. Apply Korean particles using the parseKoreanParticle method.

```Dart
import 'package:korean_particle/korean_particle.dart';

class KingSejong {

    // expected output: "나랏말씀이 중국과 달라 문자끼리 서로 맞지 아니하다"
    String test() {
        return "나랏말씀이 중국{와/과} 달라 문자끼리 서로 맞지 아니하다".parseKoreanParticle(KoreanParticle.wagua, "중국");
    }

    // expected output: "기철과 영희가 강아지와 놀고 있어요"
    String test2() {
        return "기철{와/과} 영희가 강아지{와/과} 놀고 있어요"
        .parseKoreanParticle(KoreanParticle.wagua, "기철")
        .parseKoreanParticle(KoreanParticle.wagua, "강아지");
    }

    // expected output: "기철과 영희가 강아지와 놀고 있어요"
    String test3() {
        return "기철{와/과} 영희가 강아지{와/과} 놀고 있어요"
        .kp(KoreanParticle.wagua, "기철")
        .kp(KoreanParticle.wagua, "강아지");
    }
}
```
