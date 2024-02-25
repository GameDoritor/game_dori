library henry_some_one;

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flutter/material.dart';

import 'animated_player.dart';
import 'game_background.dart';

class HenrySomeOneGame extends StatefulWidget {
  const HenrySomeOneGame({Key? key}) : super(key: key);

  @override
  State createState() => _HenrySomeOneGameState();
}

class _HenrySomeOneGameState extends State {
  @override
  Widget build(BuildContext context) {
    return const GameWidget.controlled(
      gameFactory: MyStaticGame.new,
    );
  }
}

class MyStaticGame extends FlameGame with HasCollisionDetection, PanDetector {
  @override
  Color backgroundColor() => const Color(0x00000000);
  final GameBackGround _backGround = GameBackGround();

  @override
  Future onLoad() async {
    // 화면 고정
    add(ScreenHitbox());
    await add(_backGround);

    // 플레이어의 사이즈
    final playerSize = Vector2(130, 100);
    // 플레이어의 위치
    final playerPosition = Vector2(200, 600);
    // 플레이어의 위치 및 사이즈 input
    add(AnimatedPlayer(playerPosition, playerSize));
  }
}