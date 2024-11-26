import 'package:flutter/material.dart';
import 'package:pizza_slice_app/models/pizza_model.dart';
import 'package:pizza_slice_app/widgets/home_screen_items.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    // Filter favorite pizzas
    final favoritePizzas = pizzaList.where((pizza) => pizza.fav).toList();

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0XFFFBF4F4),
        appBar: AppBar(
          backgroundColor: const Color(0XFFFBF4F4),
          elevation: 0,
          title: const Text(
            "Favorite Pizzas",
            style: TextStyle(
              color: Color(0XFF3C2F2F),
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          centerTitle: true,
          iconTheme: const IconThemeData(color: Color(0XFF3C2F2F)),
        ),
        body: favoritePizzas.isEmpty
            ? const Center(
                child: Text(
                  "No favorites yet!",
                  style: TextStyle(
                    color: Color(0XFF3C2F2F),
                    fontSize: 16,
                  ),
                ),
              )
            : GridView.builder(
                padding: const EdgeInsets.all(16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 24,
                  crossAxisSpacing: 16,
                  mainAxisExtent: 161,
                ),
                itemCount: favoritePizzas.length,
                itemBuilder: (context, index) {
                  return PizzamenugridItemWidget(
                    pizza: favoritePizzas[index],
                  );
                },
              ),
      ),
    );
  }
}
