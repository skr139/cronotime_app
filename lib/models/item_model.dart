class Item {
  final double time;
  final int bpm;
  final String rythm;

  Item({required this.time, this.bpm = 120, required this.rythm});

  Item copyWith({
    double? time,
    int? bpm,
    String? rythm,
  }) {
    return Item(
      time: time ?? this.time,
      bpm: bpm ?? this.bpm,
      rythm: rythm ?? this.rythm,
    );
  }
}
