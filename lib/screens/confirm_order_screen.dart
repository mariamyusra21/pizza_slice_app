import 'package:flutter/material.dart';
import 'package:pizza_slice_app/models/pizza_model.dart';
import 'package:pizza_slice_app/screens/delivery_screen.dart';
import 'package:pizza_slice_app/widgets/action_button.dart';

class ConfirmOrderScreen extends StatefulWidget {
  final Pizza pizza;
  const ConfirmOrderScreen({super.key, required this.pizza});

  @override
  State<ConfirmOrderScreen> createState() => _ConfirmOrderScreenState();
}

class _ConfirmOrderScreenState extends State<ConfirmOrderScreen> {
  late int? _sizeValue = 0;
  late int? _crustValue = 0;
  late int? _flavourValue = 0;
  // late int _currentPortion = 1;
  ValueNotifier<int> _currentPortion = ValueNotifier<int>(1);
  late int? _basePrice = widget.pizza.price;
  //  ValueNotifier<int> _basePrice = ValueNotifier<int>();
  List<String> size = ["Small", "Medium", "Large"];
  List<String> crust = ["Hand Tossed", "Pan", "Crunchy Thin", "Italian"];
  List<String> flavour = [
    "BBQ Chicken",
    "Peri Peri",
    "Pakistani Hot",
    "Creamy Mughlai",
    "Dynamite",
    "Fajita"
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.pizza.flavour = '';
    widget.pizza.crust = '';
    widget.pizza.portion = 1;
    widget.pizza.size = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search_rounded))
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                      width: 147,
                      height: 131,
                      child: Image.asset(
                        "assets/images/pngegg (27) 1.png",
                      )),
                  const Expanded(
                    child: Text(
                      "Customize your pizza according to your taste.\nUltimate Experience!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xff3C2F2F),
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              pizzaOption(
                "Choose an Option",
                Wrap(
                  spacing: 5.0,
                  runAlignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: List.generate(
                    size.length,
                    (int index) {
                      return ChoiceChip(
                        padding: const EdgeInsets.all(5),
                        label: Text(size[index]),
                        selected: _sizeValue == index,
                        onSelected: (bool selected) {
                          setState(() {
                            _sizeValue = selected ? index : null;
                          });
                        },
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              pizzaOption(
                "Select Crust for Pizza",
                Wrap(
                  spacing: 5.0,
                  runAlignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: List.generate(
                    flavour.length,
                    (int index) {
                      return ChoiceChip(
                        padding: const EdgeInsets.all(5),
                        label: Text(flavour[index]),
                        selected: _flavourValue == index,
                        onSelected: (bool selected) {
                          setState(() {
                            _flavourValue = selected ? index : null;
                          });
                        },
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              pizzaOption(
                "Select Flavour for Pizza",
                Wrap(
                  spacing: 5.0,
                  runAlignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: List.generate(
                    crust.length,
                    (int index) {
                      return ChoiceChip(
                        padding: const EdgeInsets.all(5),
                        label: Text(crust[index]),
                        selected: _crustValue == index,
                        onSelected: (bool selected) {
                          setState(() {
                            _crustValue = selected ? index : null;
                          });
                        },
                      );
                    },
                  ),
                ),
              ),
              // const SizedBox(
              //   height: 10,
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    "Number:",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          if (_currentPortion.value > 1) {
                            _currentPortion.value--;
                            widget.pizza.portion = _currentPortion.value;
                            widget.pizza.price =
                                (_basePrice! * _currentPortion.value);
                          }
                        });
                        // _currentPortion.value--;
                      },
                      icon: const Icon(
                        Icons.remove_circle,
                        size: 36,
                      )),
                  ValueListenableBuilder(
                    valueListenable: _currentPortion,
                    builder: (context, value, child) {
                      return Text(
                        _currentPortion.value.toString(),
                        style: const TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w600),
                      );
                    },
                  ),
                  // Text(
                  //   widget.pizza.portion.toString(),
                  // style: const TextStyle(
                  //     fontSize: 22, fontWeight: FontWeight.w600),
                  // ),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          _currentPortion.value++;
                          widget.pizza.portion = _currentPortion.value;
                          widget.pizza.price =
                              (_basePrice! * _currentPortion.value);
                        });
                        // _currentPortion.value++;
                      },
                      icon: const Icon(
                        Icons.add_circle,
                        size: 36,
                      )),
                ],
              ),
              // const SizedBox(
              //   height: 10,
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    "Total Price:",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                  //       ValueListenableBuilder(
                  //   valueListenable: _basePrice*_currentPortion,
                  //   builder: (context, value, child) {
                  //     return Text(
                  //       ${_basePrice * _currentPortion.value}.toString(),
                  //       style: TextStyle(fontSize: 30),
                  //     );
                  //   },
                  // ),
                  Text(
                    "${_basePrice! * _currentPortion.value}",
                    style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      widget.pizza.size = size.elementAt(_sizeValue!);
                      widget.pizza.flavour = flavour.elementAt(_flavourValue!);
                      widget.pizza.crust = crust.elementAt(_crustValue!);
                      widget.pizza.portion = _currentPortion.value;
                      widget.pizza.price = _basePrice! * _currentPortion.value;
                    });
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DeliveryScreen(
                                  pizza: widget.pizza,
                                )));
                    // TODO: Add screen navigation and add pizza object to it...
                  },
                  child: ActionButton(
                    text: 'CONFIRM ORDER',
                    isPlain: false,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget pizzaOption(String option, Widget chipWidget
      // List<String> optionList,
      // int? selectedIndex,
      ) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              option.toString(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color(0xff3C2F2F),
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Text(
              "(Select any 1)",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xff7B7979),
                fontSize: 11,
                fontWeight: FontWeight.w400,
              ),
            ),
            const Text(
              "Required",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xff7B7979),
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
          child: Divider(
            height: 1,
            color: Color(0xffBFBDBD),
          ),
        ),
        chipWidget,
      ],
    );
  }
}
