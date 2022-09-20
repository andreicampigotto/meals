import 'package:flutter/material.dart';
import './screens/categories_screen.dart';
import './screens/categories_meals_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        fontFamily: 'Raleway',
        canvasColor: const Color.fromRGBO(
          255,
          254,
          229,
          1,
        ),
        textTheme: ThemeData.light().textTheme.copyWith(
                titleMedium: TextStyle(
              fontSize: 20,
              fontFamily: 'RobotoCondensed',
            )),
      ),
      home: const CategoriesScreen(),
      routes: {
        '/cotegories-meals': (ctx) => CategoriesMealsScreen(),
      },
    );
  }
}
