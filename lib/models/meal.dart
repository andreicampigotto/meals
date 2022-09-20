import 'dart:ffi';
import 'dart:math';

enum Complexity {
  simple,
  medium,
  hard,
}

enum Cost {
  cheap,
  fair,
  expensive,
}

class Meal {
  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final bool isGlutenFree;
  final bool isLacFree;
  final bool isVegan;
  final bool isVegetarian;
  final Complexity complexity;
  final Cost cost;

  const Meal({
    required this.id,
    required this.categories,
    required this.title,
    required this.imageUrl,
    required this.ingredients,
    required this.steps,
    required this.duration,
    required this.isGlutenFree,
    required this.isLacFree,
    required this.isVegan,
    required this.isVegetarian,
    required this.complexity,
    required this.cost,
  });

  String get complexityText {
    switch (complexity) {
      case Complexity.simple:
        return 'Simples';
      case Complexity.medium:
        return 'Normal';
      case Complexity.hard:
        return 'Dificil';
      default:
        return 'Complexidade desconhecida';
    }
  }

  String get costText {
    switch (cost) {
      case Cost.cheap:
        return '\$';
      case Cost.fair:
        return '\$\$';
      case Cost.expensive:
        return '\$\$\$';
      default:
        return 'Valor desconhecido';
    }
  }
}
