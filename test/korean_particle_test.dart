import 'package:korean_particle/korean_particle.dart';
import 'package:test/test.dart';

void main() {
  group('KoreanParticle tests', () {
    test('{와/과} particle test', () {
      expect("사과{와/과}".kp(KoreanParticle.waGwa, "사과"), equals("사과와"));
      expect("책{와/과}".kp(KoreanParticle.waGwa, "책"), equals("책과"));
    });

    test('{을/를} particle test', () {
      expect("사과{을/를}".kp(KoreanParticle.eulReul, "사과"), equals("사과를"));
      expect("책{을/를}".kp(KoreanParticle.eulReul, "책"), equals("책을"));
    });

    test('{이/가} particle test', () {
      expect("나무{이/가}".kp(KoreanParticle.iGa, "나무"), equals("나무가"));
      expect("책{이/가}".kp(KoreanParticle.iGa, "책"), equals("책이"));
    });

    test('{은/는} particle test', () {
      expect("집{은/는}".kp(KoreanParticle.eunNeun, "집"), equals("집은"));
      expect("사과{은/는}".kp(KoreanParticle.eunNeun, "사과"), equals("사과는"));
    });

    test('Edge cases: empty string', () {
      expect(() => "".kp(KoreanParticle.waGwa, ""), throwsA(isA<RangeError>()));
    });
    test('Non-Korean input test', () {
      // english
      expect("apple{와/과}".kp(KoreanParticle.waGwa, "apple"), equals("apple와"));

      // chinese
      expect("苹果{와/과}".kp(KoreanParticle.waGwa, "苹果"), equals("苹果와"));
      expect("苹果{이/가}".kp(KoreanParticle.iGa, "苹果"), equals("苹果가"));

      // japanese
      expect("りんご{와/과}".kp(KoreanParticle.waGwa, "りんご"), equals("りんご와"));
      expect("りんご{이/가}".kp(KoreanParticle.iGa, "りんご"), equals("りんご가"));

      // number
      expect("1{이/가}".kp(KoreanParticle.iGa, "1"), equals("1이"));
      expect("2{이/가}".kp(KoreanParticle.iGa, "2"), equals("2가"));
      expect("3{이/가}".kp(KoreanParticle.iGa, "3"), equals("3이"));
      expect("4{이/가}".kp(KoreanParticle.iGa, "4"), equals("4가"));
      expect("5{이/가}".kp(KoreanParticle.iGa, "5"), equals("5가"));
      expect("6{이/가}".kp(KoreanParticle.iGa, "6"), equals("6이"));
      expect("7{이/가}".kp(KoreanParticle.iGa, "7"), equals("7이"));
      expect("8{이/가}".kp(KoreanParticle.iGa, "8"), equals("8이"));
      expect("9{이/가}".kp(KoreanParticle.iGa, "9"), equals("9가"));
      expect("10{을/를}".kp(KoreanParticle.eulReul, "10"), equals("10을"));
      expect("10{은/는}".kp(KoreanParticle.eunNeun, "10"), equals("10은"));
      expect("10{이/가}".kp(KoreanParticle.iGa, "10"), equals("10이"));
    });
  });
}
