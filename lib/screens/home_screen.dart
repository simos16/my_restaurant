import 'package:flutter/material.dart';
import 'package:my_restaurant/data/data.dart';
import 'package:my_restaurant/models/restaurant.dart';
import 'package:my_restaurant/screens/restaurant_screen.dart';
import 'package:my_restaurant/widget/rating_stars.dart';
import 'package:my_restaurant/widget/recent_orders.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
//widget che mostra la lista dei ristoranti già settati nei models
  _buildRestaurants(){
    List<Widget> restaurantsList = [];
    //questo ciclo for legge gli elementi dalla lista
    restaurants.forEach((Restaurant restaurant){
      restaurantsList.add(
        //questo metodo permette di gestire delle azioni sugli elementi
        //in questo caso cliccando su uno dei ristoranti si è direzionati
        //alla pagina dello specifico ristorante
        GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              //in questo modo possiamo linkare alla pagina di layout dei ristoranti
              builder: (_) => RestaurantScreen(restaurant: restaurant),
            ),
          ),

          child: new Container(
            margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0),
              border: Border.all(
                width: 1.0,
                color: Colors.grey,
              ),
            ),
            child: Row(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  //hero è un widget che permette un'animazione molto suggestiva
                //l'effetto è di una sorta di jump allo screen successivo
                //vedi documentazione: https://flutter.dev/docs/development/ui/animations/hero-animations
                  child: new Hero(
                    tag: restaurant.imageUrl,
                    child: new Image(
                      height: 150.0,
                      width: 150.0,
                      image: AssetImage(restaurant.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  )
                ),
               Expanded(
                 child: Container(
                   margin: EdgeInsets.all(12.0),
                   child: new Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: <Widget>[
                       new Text(
                         restaurant.name,
                         style: new TextStyle(
                           fontFamily: 'RedHat',
                           fontSize: 20.0,
                           fontWeight: FontWeight.bold,
                         ),
                         overflow: TextOverflow.ellipsis,
                       ),
                       //widget per mostrare le valutazioni dell'utente
                       //vedi il file rating_stars.dart
                       RatingStars(restaurant.rating),
                       SizedBox(height: 3.0),
                       new Text(
                         restaurant.address,
                         style: new TextStyle(
                           fontFamily: 'RedHat',
                           fontSize: 16.0,
                         ),
                         overflow: TextOverflow.ellipsis,
                       ),

                     ],
                   ),
                 ),
               )
              ],
            )
          )
        ),

      );
    });
    //il metodo ci restituisce la vista della lista dei ristoranti
return Column(children: restaurantsList);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Ordina il tuo piatto'),
        leading: IconButton(
          icon:Icon(Icons.account_circle),
          iconSize: 30.0,
          onPressed: () => print('Sono il bottone icona'),
        ),
        actions: <Widget>[
          FlatButton(
            child: new Text('Carrello (${currentUser.cart.length})',
            style: new TextStyle(
              color: Colors.white,
              fontSize: 20.0,
            ),
            ),
            onPressed: (){},
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding:  EdgeInsets.all(20.0),
            child: new TextField(
              decoration: InputDecoration(
                fillColor: Colors.white70,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(width: 1.0),
                ),
                enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
               borderSide: BorderSide(width: 1.0,
                 color: Theme.of(context).primaryColor,
               ),
                ),
                hintText: 'cerca il piatto',
                prefixIcon: Icon(
                  Icons.search,
                  size: 30.0,
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    Icons.clear
                  ),
                  onPressed: () {},
                )
              ),
            ),
          ),
          //widget collocato in un file separato
          RecentOrder(),

          //costruiamo la lista dei ristoranti
          new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
                child: new Text(
                  'Ordina nei nostri Ristoranti',
                  style: new TextStyle(
                    fontFamily: 'RedHat',
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  )
                ),
              ),

              //richiamiamo il widget di gestione della lista dei ristoranti
              _buildRestaurants(),
            ],
          ),

        ],
      )
    );
  }
}
