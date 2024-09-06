import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pizza_slice_app/screens/pizza_detail_screen.dart';

import '../models/pizza_model.dart';

class HomeScreenItems extends StatefulWidget {
  const HomeScreenItems({super.key});

  @override
  State<HomeScreenItems> createState() => _HomeScreenItemsState();
}

class _HomeScreenItemsState extends State<HomeScreenItems>
    with AutomaticKeepAliveClientMixin<HomeScreenItems> {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0XFFFBF4F4),
        body: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 22,
          ),
          decoration: BoxDecoration(
            color: const Color(0XFFFBF4F4),
            border: Border.all(
              color: const Color(0XFF000000),
              width: 1,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [pizzaMenuGrid(context)],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget pizzaMenuGrid(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(right: 14),
      child: GridView.builder(
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisExtent: 161,
          crossAxisCount: 2,
          mainAxisSpacing: 24,
          crossAxisSpacing: 44,
        ),
        physics: const BouncingScrollPhysics(),
        itemCount: pizzaList.length,
        itemBuilder: (context, index) {
          return PizzamenugridItemWidget(pizza: pizzaList[index]);
        },
      ),
    );
  }
}

// ignore: must_be_immutable
class PizzamenugridItemWidget extends StatelessWidget {
  const PizzamenugridItemWidget({super.key, required this.pizza});
  final Pizza pizza;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PizzaDetailScreen(pizza: pizza)));
      },
      child: Container(
        height: 150,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                width: 110,
                margin: const EdgeInsets.only(
                  left: 8,
                  bottom: 6,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      // "Sicilian Margherita Tomato pizza",
                      pizza.name.toString(),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Color(0XFF3C2F2F),
                        fontSize: 13,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 6),
                    SizedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: SizedBox(
                                  height: 22,
                                  width: 18,
                                  child: pizza.fav
                                      ? Icon(Icons.favorite)
                                      : Icon(Icons.favorite_border)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 24,
                              top: 2,
                            ),
                            child: SizedBox(
                              height: 8,
                              width: 8,
                              child: SvgPicture.asset(
                                "assets/images/img_group_24.svg",
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                      20,
                    ),
                    child: Image.asset(
                      pizza.image,
                      height: 84,
                      width: double.maxFinite,
                    ),
                  ),
                ),
                const SizedBox(height: 46),
                SizedBox(
                  width: double.maxFinite,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 12,
                        width: 14,
                        child: SvgPicture.asset(
                          "assets/images/img_star.svg",
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 6),
                        child: Text(
                          pizza.rating.toString(),
                          style: const TextStyle(
                            color: Color(0XFF3C2F2F),
                            fontSize: 13,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const Spacer(),
                      SizedBox(
                        height: 30,
                        width: 30,
                        child: SvgPicture.asset(
                          "assets/images/img_add_box.svg",
                        ),
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
