import 'Player.dart';

class PlayGame {
  Player player_1;
  Player player_2;

  PlayGame({required this.player_1, required this.player_2});

  void playGame() {
    print("Jogador 1: ${player_1.resultado_jogada}");
    print("Jogador 2: ${player_2.resultado_jogada}");

    if (player_1.resultado_jogada > player_2.resultado_jogada) {
      print("Jogador 1 venceu!");
    } else if (player_1.resultado_jogada < player_2.resultado_jogada) {
      print("Jogador 2 venceu!");
    } else {
      print("Empate!");
    }
  }
}
