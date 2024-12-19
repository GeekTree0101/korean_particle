library korean_particle;

enum KoreanParticle {
  waGwa, // 와/과
  eulReul, // 을/를
  iGa, // 이/가
  eunNeun, // 은/는
}

extension StringExtension on String {
  String parseKoreanParticle(KoreanParticle subject, String value) {
    return replaceFirst(
      subject._icuKey(),
      subject._replaceValueFrom(value),
    );
  }

  String kp(KoreanParticle subject, String value) {
    return parseKoreanParticle(subject, value);
  }
}

extension KoreanParticleExtension on KoreanParticle {
  String _icuKey() {
    switch (this) {
      case KoreanParticle.waGwa:
        return "{와/과}";
      case KoreanParticle.eulReul:
        return "{을/를}";
      case KoreanParticle.iGa:
        return "{이/가}";
      case KoreanParticle.eunNeun:
        return "{은/는}";
    }
  }

  String _replaceValueFrom(String value) {
    final lastChar = value.codeUnitAt(value.length - 1);
    bool hasBatchim = (lastChar - 0xAC00) % 28 != 0;

    // non korean case
    if (lastChar < 0xAC00 || lastChar > 0xD7A3) {
      hasBatchim = false;
    }

    // numberic
    if (lastChar >= 48 && lastChar <= 57) {
      hasBatchim = _hasBatchimForNumeric(value[value.length - 1]);
    }

    switch (this) {
      case KoreanParticle.waGwa:
        return hasBatchim ? "과" : "와";
      case KoreanParticle.eulReul:
        return hasBatchim ? "을" : "를";
      case KoreanParticle.iGa:
        return hasBatchim ? "이" : "가";
      case KoreanParticle.eunNeun:
        return hasBatchim ? "은" : "는";
    }
  }

  bool _hasBatchimForNumeric(String lastDigit) {
    const batchimNumeric = {
      '1': true, // 일
      '2': false, // 이
      '3': true, // 삼
      '4': false, // 사
      '5': false, // 오
      '6': true, // 육
      '7': true, // 칠
      '8': true, // 팔
      '9': false, // 구
      '0': true, // 영/공
    };

    return batchimNumeric[lastDigit] ?? false;
  }
}
