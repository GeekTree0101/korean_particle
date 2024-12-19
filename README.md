# korean_particle

Prepositional particles in Korean for Dart

## pubspec.yaml
```yml
dependencies:
  flutter:
    sdk: flutter
  korean_particle: ^0.0.1
```

## Usage
```Dart
import 'package:korean_particle/korean_particle.dart

class KingSejong {

    // expected output: "나랏말씀이 중국과 달라 문자끼리 서로 맞지 아니하다"
    String test() {
        return "나랏말씀이 중국{와/과} 달라 문자끼리 서로 맞지 아니하다".parse(KoreanParticle.wagua, "중국");
    }
}
```
