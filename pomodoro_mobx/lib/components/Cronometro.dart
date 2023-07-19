import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pomodoro_mobx/components/CronometroBotao.dart';

class Cronometro extends StatelessWidget {
  const Cronometro({super.key});

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Container(
          color: Colors.red,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Trabalhando",
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "02:00",
                style: TextStyle(
                  fontSize: 120,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: CronometroBotao(
                      texto: "Iniciar",
                      icone: Icons.play_arrow,
                    ),
                  ),
                  /*Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: CronometroBotao(
                      texto: "Parar",
                      icone: Icons.stop,
                    ),
                  ),*/
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: CronometroBotao(
                      texto: "Reiniciar",
                      icone: Icons.refresh,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
