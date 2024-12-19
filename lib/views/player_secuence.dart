import 'package:audioplayers/audioplayers.dart';
import 'package:cronotime_app/providers/player_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PlayerSecuence extends StatefulWidget {
  const PlayerSecuence({super.key});

  @override
  State<PlayerSecuence> createState() => _PlayerSecuenceState();
}

class _PlayerSecuenceState extends State<PlayerSecuence> {
  final player = AudioPlayer();
  Source source = AssetSource('audios/heavy-industrial.wav');
  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final PlayerProvider playerState = Provider.of<PlayerProvider>(context);
    return Center(
      child: SizedBox(
        width: 250,
        height: 300,
        child: Card(
          margin: const EdgeInsets.all(5),
          elevation: 10,
          shadowColor: const Color.fromARGB(95, 255, 82, 82),
          child: Column(
            children: [
              IconButton(
                  onPressed: () async {
                    if (playerState.isPlaying) {
                      playerState.stop();
                      player.stop();
                    } else {
                      playerState.play();
                      await player
                          .play(AssetSource('audios/heavy-industrial.wav'));
                    }
                  },
                  icon: Icon(
                      playerState.isPlaying ? Icons.play_arrow : Icons.stop)),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        playerState.setRate(playerState.rate + 0.25);
                        player.setPlaybackRate(playerState.rate);
                      },
                      icon: const Icon(Icons.add)),
                  const SizedBox(
                    width: 10,
                  ),
                  IconButton(
                      onPressed: () {
                        playerState.setRate(playerState.rate - 0.25);
                        player.setPlaybackRate(playerState.rate);
                      },
                      icon: const Icon(Icons.remove)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
