import 'package:audioplayers/audioplayers.dart';
import 'package:cronotime_app/providers/reproductor_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SecuenceReproductor extends StatelessWidget {
  const SecuenceReproductor({super.key});

  @override
  Widget build(BuildContext context) {
    final ReproductorProvider playerState =
        Provider.of<ReproductorProvider>(context);
    final player = AudioPlayer();
    Source source = AssetSource('audios/heavy-industrial.wav');
    return Center(
      child: SizedBox(
        width: 250,
        height: 300,
        child: Card(
          margin: const EdgeInsets.all(5),
          elevation: 10,
          shadowColor: const Color.fromARGB(95, 255, 82, 82),
          child: IconButton(
              onPressed: () async {
                if (playerState.isPlaying) {
                  playerState.stop();
                  player.stop();
                } else {
                  playerState.play();
                  await player.play(source);
                }
              },
              icon:
                  Icon(playerState.isPlaying ? Icons.play_arrow : Icons.stop)),
        ),
      ),
    );
  }
}
