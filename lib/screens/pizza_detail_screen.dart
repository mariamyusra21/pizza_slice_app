import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pizza_slice_app/models/pizza_model.dart';

class PizzaDetailScreen extends StatefulWidget {
  const PizzaDetailScreen({super.key, required this.pizza});
  final Pizza pizza;

  @override
  State<PizzaDetailScreen> createState() => _PizzaDetailScreenState();
}

class _PizzaDetailScreenState extends State<PizzaDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0XFFFBF4F4),
        body: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 328,
              height: 288,
              child: Image.asset(widget.pizza.image),
            ),
            Text(
              widget.pizza.name.toString(),
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Color(0xFF3C2F2F),
                fontSize: 20,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w600,
                height: 0.07,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
              child: Row(
                children: [
                  SizedBox(
                    height: 15,
                    width: 25,
                    child: SvgPicture.asset(
                      "assets/images/img_star.svg",
                    ),
                  ),
                  Text(
                    widget.pizza.rating.toString(),
                    style: TextStyle(
                      color: Color(0xFF7F7F7F),
                      fontSize: 12,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500,
                      // height: 0.11,
                    ),
                  ),
                ],
              ),
            ),
            // SizedBox(
            //   width: 328,
            //   height: 90,
            // child:
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Text(
                widget.pizza.desc.toString(),
                // textAlign: TextAlign.justify,
                style: TextStyle(
                  color: Color(0xFF6A6A6A),
                  fontSize: 16,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                  // height: 0.11,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
