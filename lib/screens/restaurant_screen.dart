import 'package:flutter/material.dart';
import 'package:my_restaurant/models/restaurant.dart';

class RestaurantScreen extends StatefulWidget {
  final Restaurant restaurant;
  RestaurantScreen({this.restaurant});
  @override
  _RestaurantScreenState createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Column(
        children: <Widget>[
          //il widget stack gestisce le posizioni relative degli elementi inseriti
          //documentazione: https://api.flutter.dev/flutter/widgets/Stack-class.html
          Stack(
            children: <Widget>[
              new Hero(
                tag: widget.restaurant.imageUrl,
                child: Image(
                  height: 220.0,
                  //anche in flutter possiamo utilizzare le media query di CSS3 per
                  //per ottenere una maggiore fluidità delle strutture
                  width: MediaQuery.of(context).size.width,
                  image: AssetImage(widget.restaurant.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
                child: new Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      //qui prova anche l'icona arrow_back_ios
                      icon: Icon(Icons.arrow_back),
                      color: Theme.of(context).primaryColor,
                      iconSize: 30.0,
                      //l'azione permette il ritorno indietro, in questo caso alla Home
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(
                  widget.restaurant.name,
                  style: new TextStyle(
                    fontFamily: 'RedHat',
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  )
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}


