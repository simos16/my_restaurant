import 'package:flutter/material.dart';

class RatingStars extends StatelessWidget {
  final int rating;

  RatingStars(this.rating);
  @override
  Widget build(BuildContext context) {
    String stars = '';
    for(int i = 0; i < rating; i++){
      //questa che vedi non è un'icona nè un'immagine ma un
      //emoji perfettamente manipolabile come qualsiasi carattere
      //puoi copiarla da qui: https://emojipedia.org/star/
      stars += '⭐';
    }
    //questo metodo regola, in questo caso cancella, gli spazi nella sequenza di caratteri
    stars.trim();
    return new Text(
      stars,
      style: new TextStyle(
        fontSize: 18.0,
        backgroundColor: Theme.of(context).primaryColor,
    )
    );
  }
}
