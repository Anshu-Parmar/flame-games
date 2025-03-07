import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame/parallax.dart';
import 'package:flutter/material.dart';

import 'actors/player.dart';

class SpaceShooterGame extends FlameGame with PanDetector {
  late Player player;

  @override
  Future<void>? onLoad() async {
    // await super.onLoad();
    final parallax = await loadParallaxComponent(
      [
        ParallaxImageData('stars-0.png'),
        ParallaxImageData('stars-1.png'),
      ],
      baseVelocity: Vector2(0, -5),
      repeat: ImageRepeat.repeat,
      velocityMultiplierDelta: Vector2(0, 5),
    );
    add(parallax);

    player = Player();
    add(player);
  }

  @override
  void onPanUpdate(DragUpdateInfo info) {
    player.move(info.delta.global);
  }

  @override
  void onPanStart(DragStartInfo info) {
    player.startShooting();
  }

  @override
  void onPanEnd(DragEndInfo info) {
    player.stopShooting();
  }
}
