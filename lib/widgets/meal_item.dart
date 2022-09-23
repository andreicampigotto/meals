import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../utils/app_routes.dart';

class MealItem extends StatelessWidget {
  final Meal meal;

  const MealItem(this.meal, {super.key});

  void _selectMeal(BuildContext context) {
    Navigator.of(context)
        .pushNamed(
      AppRoutes.MEAL_DETAIL,
      arguments: meal,
    )
        .then((result) {
      if (result == null) print('teste');
      print('refeicao $result.');
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 4,
        margin: const EdgeInsets.all(8.0),
        child: Column(children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                child: Image.network(
                  meal.imageUrl,
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                right: 8,
                bottom: 4,
                child: Container(
                  width: 300,
                  color: Colors.black54,
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 20,
                  ),
                  child: Text(
                    meal.title,
                    style: const TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                    ),
                    softWrap: true,
                    overflow: TextOverflow.fade,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Icon(Icons.schedule_rounded),
                    SizedBox(width: 8),
                    Text('${meal.duration} min')
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.work_history_outlined),
                    SizedBox(width: 8),
                    Text(meal.complexityText),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.price_check_outlined),
                    SizedBox(width: 8),
                    Text(meal.costText),
                  ],
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
