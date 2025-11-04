import 'package:flame/extensions.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flame/flame.dart';

void main() {
  runApp(GameWidget(game: MyGame()));
}

class MyGame extends FlameGame{

  List<Paint> lista = [];
  double x = 0;
  double velocidade = 100;

  @override
  void onLoad(){
    var paint = Paint()..color = Colors.pink;
    lista.add(paint);
    paint = Paint()..color = Colors.yellow;
    lista.add(paint);
    paint = Paint()..color = Colors.white;
    lista.add(paint);
  }

  @override
  void update(double dt){
    super.update(dt);
    x += velocidade * dt;
    if(x > size.x){
      x = 0;
    }
  }

  @override
  void render(Canvas canvas){
    super.render(canvas);
    // final paint = Paint()..color = Colors.pink;
    canvas.drawCircle(Offset(x, size.y / 2), 20, lista.random());
  }

}
