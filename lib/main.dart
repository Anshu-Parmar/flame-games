import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import 'ember_quest/ember_quest_game.dart';
import 'ember_quest/overlays/game_over.dart';
import 'ember_quest/overlays/main_menu.dart';

void main() {
  runApp(
    GameWidget<EmberQuestGame>.controlled(
      gameFactory: EmberQuestGame.new,
      overlayBuilderMap: {
        'MainMenu': (_, game) => MainMenu(game: game),
        'GameOver': (_, game) => GameOver(game: game),
      },
      initialActiveOverlays: const ['MainMenu'],
    ),
  );
}