import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pizza_slice_app/models/pizza_model.dart';
import 'package:pizza_slice_app/screens/confirm_order_screen.dart';

class PizzaDetailScreen extends StatefulWidget {
  const PizzaDetailScreen({super.key, required this.pizza});
  final Pizza pizza;

  @override
  State<PizzaDetailScreen> createState() => _PizzaDetailScreenState();
}

class _PizzaDetailScreenState extends State<PizzaDetailScreen> {
  double _currentSliderValue = 1;

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0XFFFBF4F4),
        appBar: AppBar(
          backgroundColor: const Color(0XFFFBF4F4),
        ),
        body: SingleChildScrollView(
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: media.width,
                height: 288,
                child: Image.asset(widget.pizza.image),
              ),
              Text(
                widget.pizza.name.toString(),
                textAlign: TextAlign.start,
                style: const TextStyle(
                  color: Color(0xFF3C2F2F),
                  fontSize: 20,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w600,
                  // height: 0.07,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
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
                      style: const TextStyle(
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  widget.pizza.desc.toString(),
                  // textAlign: TextAlign.justify,
                  style: const TextStyle(
                    color: Color(0xFF6A6A6A),
                    fontSize: 16,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                    // height: 0.11,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 50, horizontal: 30),
                child: SizedBox(
                  width: 328,
                  height: 66,
                  child: Stack(
                    children: [
                      spicySliderWidget(),
                      // portionWidget(),
                    ],
                  ),
                ),
              ),
              // SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.all(5),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      widget.pizza.spiciness = _currentSliderValue;
                      // widget.pizza.portion = _currentPortion;
                    });
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ConfirmOrderScreen(
                                  pizza: widget.pizza,
                                )));
                    // TODO: Add screen navigation and add pizza object to it...
                  },
                  child: Container(
                    width: 193,
                    height: 56.53,
                    decoration: ShapeDecoration(
                      color: const Color(0xFFDB1818),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      shadows: const [
                        BoxShadow(
                          color: Color(0x3F000000),
                          blurRadius: 30,
                          offset: Offset(0, 9),
                          spreadRadius: 0,
                        )
                      ],
                    ),
                    child: const Center(
                      child: Text(
                        'ORDER NOW',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                          // height: 0.08,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  // Positioned portionWidget() {
  //   return Positioned(
  //     left: 216.76,
  //     top: 0,
  //     child: Container(
  //       width: 101.24,
  //       height: 53.55,
  //       child: Stack(
  //         children: [
  //           const Positioned(
  //             left: 0.24,
  //             top: 0,
  //             child: SizedBox(
  //               width: 76,
  //               height: 16,
  //               child: Text(
  //                 'Portion',
  //                 style: TextStyle(
  //                   color: Color(0xFF3C2F2F),
  //                   fontSize: 14,
  //                   fontFamily: 'Roboto',
  //                   fontWeight: FontWeight.w500,
  //                   height: 0.10,
  //                 ),
  //               ),
  //             ),
  //           ),
  //           Positioned(
  //             left: -0,
  //             top: 20.08,
  //             child: Container(
  //               width: 101.24,
  //               height: 33.47,
  //               child: Stack(
  //                 children: [
  //                   Positioned(
  //                     left: 46.02,
  //                     top: 15,
  //                     child: SizedBox(
  //                       width: 10.04,
  //                       height: 20.08,
  //                       child: Text(
  //                         widget.pizza.portion.toString(),
  //                         style: const TextStyle(
  //                           color: Color(0xFF3C2F2F),
  //                           fontSize: 18,
  //                           fontFamily: 'Inter',
  //                           fontWeight: FontWeight.w500,
  //                           height: 0.08,
  //                         ),
  //                       ),
  //                     ),
  //                   ),
  //                   Positioned(
  //                     left: 0,
  //                     top: 0,
  //                     child: Container(
  //                       width: 33.47,
  //                       height: 33.47,
  //                       child: Stack(
  //                         children: [
  //                           InkWell(
  //                             onTap: () {
  //                               setState(() {
  //                                 if (_currentPortion != 0 &&
  //                                     _currentPortion > 1) {
  //                                   _currentPortion--;
  //                                 }
  //                               });
  //                             },
  //                             child: Container(
  //                               width: 33.47,
  //                               height: 33.47,
  //                               decoration: ShapeDecoration(
  //                                 color: const Color(0xFFDB1818),
  //                                 shape: RoundedRectangleBorder(
  //                                   borderRadius: BorderRadius.circular(10),
  //                                 ),
  //                               ),
  //                               child: const Icon(
  //                                 Icons.remove,
  //                                 color: Colors.white,
  //                               ),
  //                             ),
  //                           ),
  //                         ],
  //                       ),
  //                     ),
  //                   ),
  //                   Positioned(
  //                     left: 67.78,
  //                     top: -0,
  //                     child: Container(
  //                       width: 33.47,
  //                       height: 33.47,
  //                       child: Stack(
  //                         children: [
  //                           InkWell(
  //                             onTap: () {
  //                               setState(() {
  //                                 _currentPortion++;
  //                               });
  //                             },
  //                             child: Container(
  //                               width: 33.47,
  //                               height: 33.47,
  //                               decoration: ShapeDecoration(
  //                                 color: const Color(0xFFDB1818),
  //                                 shape: RoundedRectangleBorder(
  //                                   borderRadius: BorderRadius.circular(10),
  //                                 ),
  //                               ),
  //                               child: const Icon(
  //                                 Icons.add,
  //                                 color: Colors.white,
  //                               ),
  //                             ),
  //                           ),
  //                         ],
  //                       ),
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  Positioned spicySliderWidget() {
    return Positioned(
      left: 0,
      top: 0,
      child: SizedBox(
        width: 171,
        height: 56,
        child: Stack(
          children: [
            const Positioned(
              left: 0,
              top: 0,
              child: SizedBox(
                width: 71,
                height: 16,
                child: Text(
                  'Spicy',
                  style: TextStyle(
                    color: Color(0xFF3C2F2F),
                    fontSize: 14,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                    height: 0.10,
                  ),
                ),
              ),
            ),
            Positioned(
              // left: 2.51,
              top: 20.10,

              child: SizedBox(
                width: 138.06,
                height: 11.71,
                child: Slider(
                  value: _currentSliderValue,
                  max: 5,
                  label: _currentSliderValue.round().toString(),
                  onChanged: (double value) {
                    setState(() {
                      _currentSliderValue = value;
                    });
                  },
                  divisions: 5,
                  inactiveColor: Colors.white60,
                  activeColor: const Color(0xFFDB1818),
                  allowedInteraction: SliderInteraction.tapAndSlide,
                ),
              ),
            ),
            const Positioned(
              left: 0,
              top: 43,
              child: SizedBox(
                width: 46,
                height: 13,
                child: Text(
                  'Mild',
                  style: TextStyle(
                    color: Color(0xFF1CC019),
                    fontSize: 12,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                    height: 0.11,
                  ),
                ),
              ),
            ),
            const Positioned(
              left: 124,
              top: 43,
              child: SizedBox(
                width: 47,
                height: 13,
                child: Text(
                  'Hot',
                  style: TextStyle(
                    color: Color(0xFFEF2A39),
                    fontSize: 12,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                    height: 0.11,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
