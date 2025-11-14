import 'dart:math';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'mine_cell.dart';

class MinesweeperGame extends FlameGame with TapDetector {
  static const int rows = 10;
  static const int cols = 10;
  static const int mineCount = 15;

  late List<List<MineCell>> board;

  @override
  Future<void> onLoad() async {
    double cellSize = size.x / cols;

    // Crear tablero
    board = List.generate(rows, (r) {
      return List.generate(cols, (c) {
        final cell = MineCell(r, c, cellSize);
        add(cell);
        return cell;
      });
    });

    _placeMines();
    _calculateNumbers();
  }

  // Colocar minas aleatorias
  void _placeMines() {
    final rand = Random();
    int placed = 0;

    while (placed < mineCount) {
      int r = rand.nextInt(rows);
      int c = rand.nextInt(cols);

      if (!board[r][c].hasMine) {
        board[r][c].hasMine = true;
        placed++;
      }
    }
  }

  // Calcular números alrededor
  void _calculateNumbers() {
    for (var row in board) {
      for (var cell in row) {
        if (cell.hasMine) continue;

        int count = 0;

        for (var n in _neighbors(cell.row, cell.col)) {
          if (board[n.$1][n.$2].hasMine) count++;
        }

        cell.nearMines = count;
      }
    }
  }

  // Lista de vecinos válidos
  List<(int, int)> _neighbors(int r, int c) {
    final dirs = [
      (-1, -1),
      (-1, 0),
      (-1, 1),
      (0, -1),
      (0, 1),
      (1, -1),
      (1, 0),
      (1, 1),
    ];

    return dirs
        .map((d) => (r + d.$1, c + d.$2))
        .where(
          (pos) => pos.$1 >= 0 && pos.$1 < rows && pos.$2 >= 0 && pos.$2 < cols,
        )
        .toList();
  }

  // Revelar celda
  void revealCell(int r, int c) {
    final cell = board[r][c];

    if (cell.revealed || cell.revealed) return;
    cell.reveal();

    if (cell.hasMine) {
      gameOver();
      return;
    }

    // Si no tiene minas cerca, expandir
    if (cell.nearMines == 0) {
      for (var n in _neighbors(r, c)) {
        revealCell(n.$1, n.$2);
      }
    }

    checkWin();
  }

  void checkWin() {
    for (var row in board) {
      for (var cell in row) {
        if (!cell.hasMine && !cell.revealed) return;
      }
    }

    print("¡GANASTE!");
  }

  void gameOver() {
    print("💥 GAME OVER");
    for (var row in board) {
      for (var cell in row) {
        if (cell.hasMine) cell.reveal();
      }
    }
  }

  @override
  void onTapDown(TapDownInfo info) {
    final pos = info.eventPosition.widget;

    for (var row in board) {
      for (var cell in row) {
        if (cell.containsPoint(pos)) {
          revealCell(cell.row, cell.col);
          return;
        }
      }
    }
  }
}
