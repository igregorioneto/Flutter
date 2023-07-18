import '../jogo_de_dados/Dice.dart';
import '../jogo_de_dados/PlayGame.dart';
import '../jogo_de_dados/Player.dart';

void main() {
  var play_game = PlayGame(
    player_1: Player(
      nome: "João",
      resultado_jogada: Dice().roll(),
    ),
    player_2: Player(
      nome: "Maria",
      resultado_jogada: Dice().roll(),
    ),
  );

  play_game.playGame();
}
