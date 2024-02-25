import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';

class AnimatedPlayer extends SpriteAnimationComponent
    with CollisionCallbacks, HasGameRef, TapCallbacks {

  AnimatedPlayer(
      Vector2 position,
      Vector2 size,
  )
  : super(
      position: position,
      size: size,
      anchor: Anchor.center,
  );

  void onTapDown(TapDownEvent event) {
    print("진입");

    onJump();
    Future.delayed(Duration(milliseconds: 750)).then((value) => onLanding());
    // Future.delayed(Duration(seconds: 2)).then((value) => onLoad());
  }

  @override
  Future<void>? onLoad() async {
    animation = await gameRef.loadSpriteAnimation(
      'adventurer-Sheet.png'
      ,SpriteAnimationData.sequenced(
        amount: 6
        , stepTime: 0.1
        , textureSize: Vector2(50, 37)
        , texturePosition: Vector2(50, 37)
      ),
    );
    return super.onLoad();
  }

  // 점프
  Future<void>? onJump() async {
    animation = await gameRef.loadSpriteAnimation(
      'adventurer-Sheet.png'
      ,SpriteAnimationData.sequenced(
          amount: 5
          , stepTime: 0.1
          , textureSize: Vector2(50, 37)
          , texturePosition: Vector2(0, 74)
          , loop: false
      )
      ,
    );
  }

  // 아래 부분은 Future.Delayed 줘서 진행해보기
  Future<void>? onLanding() async {
    animation = await gameRef.loadSpriteAnimation(
      'adventurer-Sheet.png'
      ,SpriteAnimationData.sequenced(
        amount: 2
        , stepTime: 0.1
        , textureSize: Vector2(50, 37)
        , texturePosition: Vector2(50, 111)
        , loop: false
    )
      ,
    );
  }

}