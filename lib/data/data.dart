import 'package:my_restaurant/models/food.dart';
import 'package:my_restaurant/models/order.dart';
import 'package:my_restaurant/models/restaurant.dart';
import 'package:my_restaurant/models/user.dart';

// Ricette
final _polenta =
    Food(imageUrl: 'assets/images/polenta.jpg', name: 'Polenta', price: 8.99);
final _fiorentina =
    Food(imageUrl: 'assets/images/bistecca.jpg', name: 'Fiorentina', price: 19.99);
final _lasagne =
    Food(imageUrl: 'assets/images/lasagne.jpg', name: 'Lasagne', price: 14.99);
final _zuppaPesce =
    Food(imageUrl: 'assets/images/zuppa.jpg', name: 'Zuppa di pesce', price: 18.99);
final _pizza =
    Food(imageUrl: 'assets/images/pizza.jpg', name: 'Pizza', price: 9.99);
final _filetto =
    Food(imageUrl: 'assets/images/filetto.jpg', name: 'Filetto', price: 14.99);


// Ristoranti
final _restaurant0 = Restaurant(
  imageUrl: 'assets/images/restaurant0.jpg',
  name: 'Il Calamaro',
  address: 'Via dei Mille, 2, FI',
  rating: 5,
  menu: [_zuppaPesce, _pizza, _lasagne, _filetto, _fiorentina],
);
final _restaurant1 = Restaurant(
  imageUrl: 'assets/images/restaurant1.jpg',
  name: 'Cento Sapori',
  address: 'Via della Camelie, 34, AR',
  rating: 4,
  menu: [_zuppaPesce, _pizza, _lasagne, _filetto, _fiorentina, _polenta],
);
final _restaurant2 = Restaurant(
  imageUrl: 'assets/images/restaurant2.jpg',
  name: 'Il Gusto',
  address: 'Via dei Ristoranti,13, FI',
  rating: 4,
  menu: [_zuppaPesce, _polenta, _lasagne, _filetto, _fiorentina],
);
final _restaurant3 = Restaurant(
  imageUrl: 'assets/images/restaurant3.jpg',
  name: 'La Pizza',
  address: 'Via delle Lasagne, 6, AR',
  rating: 2,
  menu: [_pizza, _lasagne, _fiorentina],
);

final List<Restaurant> restaurants = [
  _restaurant0,
  _restaurant1,
  _restaurant2,
  _restaurant3,
];

// Clienti
final currentUser = User(
  name: 'Giuseppe',
  orders: [
    Order(
      date: '22 maggio 2020',
      food: _filetto,
      restaurant: _restaurant2,
      quantity: 1,
    ),
    Order(
      date: '26 maggio 2020',
      food: _zuppaPesce,
      restaurant: _restaurant0,
      quantity: 3,
    ),
    Order(
      date: '02 giugno 2020',
      food: _lasagne,
      restaurant: _restaurant1,
      quantity: 2,
    ),
    Order(
      date: '03 giugno 2020',
      food: _pizza,
      restaurant: _restaurant3,
      quantity: 1,
    ),
    Order(
      date: '03 giugno 2020',
      food: _lasagne,
      restaurant: _restaurant3,
      quantity: 1,
    ),
  ],
  cart: [
    Order(
      date: '04 giugno 2020',
      food: _polenta,
      restaurant: _restaurant2,
      quantity: 2,
    ),
    Order(
      date: '04 giugno 2020',
      food: _fiorentina,
      restaurant: _restaurant2,
      quantity: 1,
    ),
    Order(
      date: '05 giugno 2020',
      food: _fiorentina,
      restaurant: _restaurant2,
      quantity: 1,
    ),
    Order(
      date: '05 giugno 2020',
      food: _fiorentina,
      restaurant: _restaurant2,
      quantity: 1,
    )
  ],
);
