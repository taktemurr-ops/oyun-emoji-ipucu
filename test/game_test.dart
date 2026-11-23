import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_emoji_ipucu/oyun_emoji_ipucu.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(emojiIpucuConfig.title.length, 33);
    expect(emojiIpucuConfig.tagline.length, 33);
    for (final s in emojiIpucuConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(emojiIpucuConfig.gameId, emojiIpucuId);
    expect(emojiIpucuRules.gameId, emojiIpucuId);
  });

  test('desteler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(emojiIpucuRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: emojiIpucuId, optionalMechanics: emojiIpucuRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(emojiIpucuRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
