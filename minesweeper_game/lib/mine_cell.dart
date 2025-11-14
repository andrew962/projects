import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class MineCell extends PositionComponent {
  final int row;
  final int col;
  bool hasMine = false;
  bool revealed = false;
  int nearMines = 0;

  MineCell(this.row, this.col, double size)
      : super(size: Vector2(size, size)
        ) {
    x = col * size;
    y = row * size;
  }

  @override
  void render(Canvas canvas) {
    final paint = Paint()
      ..color = revealed
          ? Colors.grey.shade300
          : Colors.grey.shade800;

    canvas.drawRect(size.toRect(), paint);

    if (revealed) {
      if (hasMine) {
        final minePaint = Paint()..color = Colors.red;
        canvas.drawCircle(Offset(width / 2, height / 2), width * 0.3, minePaint);
      } else if (nearMines > 0) {
        final text = TextPainter(
          text: TextSpan(
              text: nearMines.toString(),
              style: TextStyle(
                color: Colors.black,
                fontSize: width * 0.5,
                fontWeight: FontWeight.bold,
              )),
          textDirection: TextDirection.ltr,
        );
        text.layout();
        text.paint(canvas, Offset(width / 2 - text.width / 2, height / 2 - text.height / 2));
      }
    }
  }

  void reveal() {
    revealed = true;
  }
}
