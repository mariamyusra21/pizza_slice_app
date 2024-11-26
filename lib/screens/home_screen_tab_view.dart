import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pizza_slice_app/screens/favourite_screen.dart';
import 'package:pizza_slice_app/screens/profile_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../widgets/home_screen_items.dart';

class HomeScreenTabView extends StatefulWidget {
  const HomeScreenTabView({super.key});
  @override
  HomeScreenTabViewState createState() => HomeScreenTabViewState();
}

class HomeScreenTabViewState extends State<HomeScreenTabView>
    with TickerProviderStateMixin {
  TextEditingController searchController = TextEditingController();

  int sliderIndex = 1;

  late TabController tabviewController;
  int currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    tabviewController = TabController(length: 5, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFFBF4F4),
      resizeToAvoidBottomInset: true,
      // appBar: AppBar(
      //   elevation: 0,
      //   toolbarHeight: 56,
      //   backgroundColor: Colors.transparent,
      //   automaticallyImplyLeading: false,
      //   leadingWidth: 56,
      //   leading: Padding(
      //     padding: const EdgeInsets.only(
      //       left: 12,
      //       top: 6,
      //       bottom: 6,
      //     ),
      //     child: ClipRRect(
      //       borderRadius: BorderRadius.circular(
      //         22,
      //       ),
      //       child: Image.asset(
      //         "assets/images/img_slicce_1.png",
      //         height: 44,
      //         width: 44,
      //       ),
      //     ),
      //   ),
      //   title: const Padding(
      //     padding: EdgeInsets.only(left: 10),
      //     child: Text(
      //       "Craving Satisfaction, One Slice at a Time",
      //       style: TextStyle(
      //         color: Color(0XFF6A6A6A),
      //         fontSize: 12,
      //         fontFamily: 'Poppins',
      //         fontWeight: FontWeight.w400,
      //       ),
      //     ),
      //   ),
      // ),
      body: <Widget>[
        SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 12,
                        top: 6,
                        bottom: 6,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(
                          22,
                        ),
                        child: Image.asset(
                          "assets/images/img_slicce_1.png",
                          height: 44,
                          width: 44,
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        "Craving Satisfaction, One Slice at a Time",
                        style: TextStyle(
                          color: Color(0XFF6A6A6A),
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
                _buildSearchSection(context),
                const SizedBox(height: 12),
                _buildSliderSection(context),
                const SizedBox(height: 5),
                _buildTabview(context),
                _buildContentPager(context),
              ],
            ),
          ),
        ),
        // Favourite Screen
        FavouriteScreen(),
        // Profile Screen
        ProfileScreen(),
      ][currentPageIndex],
      bottomNavigationBar: _buildBottomBar(context),
    );
  }

  /// Section Widget
  Widget _buildSearchSection(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: const EdgeInsets.only(
        left: 10,
        right: 14,
      ),
      child: Column(
        children: [
          SizedBox(
            width: double.maxFinite,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: SizedBox(
                    width: 270,
                    child: TextFormField(
                      // focusNode: FocusNode(),
                      // autofocus: true,
                      controller: searchController,
                      style: const TextStyle(
                        color: Color(0XFF8D8C8C),
                        fontSize: 12,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500,
                      ),
                      decoration: InputDecoration(
                        hintText: "Search ",
                        hintStyle: const TextStyle(
                          color: Color(0XFF8D8C8C),
                          fontSize: 12,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                        ),
                        prefixIcon: Container(
                          margin: const EdgeInsets.fromLTRB(12, 10, 8, 10),
                          child: SvgPicture.asset(
                            "assets/images/img_search.svg",
                            height: 24,
                            width: 24,
                          ),
                        ),
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(
                            right: 15,
                          ),
                          child: IconButton(
                            onPressed: () {
                              searchController.clear();
                            },
                            icon: const Icon(
                              Icons.clear,
                              color: Color(0xff757575),
                            ),
                          ),
                        ),
                        filled: true,
                        fillColor: const Color(0XFFFCF4F4),
                      ),
                      onChanged: (value) {},
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                IconButton(
                  onPressed: () {},
                  constraints: const BoxConstraints(
                    minHeight: 50,
                    minWidth: 50,
                  ),
                  padding: const EdgeInsets.all(0),
                  icon: Container(
                    width: 50,
                    height: 44,
                    decoration: BoxDecoration(
                      color: const Color(0XFFDB1818),
                      borderRadius: BorderRadius.circular(
                        20,
                      ),
                    ),
                    padding: const EdgeInsets.all(12),
                    child: SvgPicture.asset(
                      "assets/images/img_settings_sliders.svg",
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildSliderSection(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Container(
            width: double.maxFinite,
            margin: const EdgeInsets.only(right: 2),
            child: CarouselSlider.builder(
              options: CarouselOptions(
                height: 96,
                initialPage: 0,
                autoPlay: true,
                viewportFraction: 1.0,
                enableInfiniteScroll: false,
                scrollDirection: Axis.horizontal,
                onPageChanged: (index, reason) {
                  sliderIndex = index;
                },
              ),
              itemCount: 1,
              itemBuilder: (context, index, realIndex) {
                return const SliderItemWidget();
              },
            ),
          ),
          const SizedBox(height: 4),
          SizedBox(
            height: 12,
            child: AnimatedSmoothIndicator(
              activeIndex: sliderIndex,
              count: 1,
              axisDirection: Axis.horizontal,
              effect: const ScrollingDotsEffect(
                activeDotColor: Color(0X1212121D),
                dotHeight: 12,
              ),
            ),
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildTabview(BuildContext context) {
    return Container(
      height: 50,
      margin: const EdgeInsets.only(left: 20),
      child: TabBar(
        controller: tabviewController,
        isScrollable: true,
        indicatorPadding: const EdgeInsets.all(-5),
        tabAlignment: TabAlignment.start,
        labelColor: const Color(0xFFF5F5F5),
        unselectedLabelColor: const Color(0xFF525151),
        unselectedLabelStyle: const TextStyle(
          color: Color(0xFF525151),
          fontSize: 16,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w500,
          height: 0,
        ),
        labelStyle: const TextStyle(
          color: Color(0xFFF5F5F5),
          fontSize: 16,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w500,
          height: 0,
        ),
        indicator: ShapeDecoration(
          color: const Color(0xFFDB1818),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          shadows: const [
            BoxShadow(
              color: Color(0x3F000000),
              blurRadius: 18,
              offset: Offset(0, 10),
              spreadRadius: -1,
            )
          ],
        ),
        tabs: const [
          Tab(
            text: "Popular",
            iconMargin: EdgeInsets.all(5),
          ),
          Tab(
            text: "Daily Deals",
            iconMargin: EdgeInsets.all(5),
          ),
          Tab(
            text: "Family Deals",
            iconMargin: EdgeInsets.all(5),
          ),
          Tab(
            text: "MELTZ",
            iconMargin: EdgeInsets.all(5),
          ),
          Tab(
            text: "Cricket Deals",
            iconMargin: EdgeInsets.all(5),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildContentPager(BuildContext context) {
    return SizedBox(
      height: 392,
      width: double.maxFinite,
      child: TabBarView(
        controller: tabviewController,
        children: const [
          HomeScreenItems(),
          HomeScreenItems(),
          HomeScreenItems(),
          HomeScreenItems(),
          HomeScreenItems(),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildBottomBar(BuildContext context) {
    return NavigationBar(
      height: 60,
      elevation: 20,
      backgroundColor: const Color(0XffE2D6D6),
      selectedIndex: currentPageIndex,
      indicatorColor: const Color(0xFFDB1818),
      labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
      destinations: [
        NavigationDestination(
            icon: SvgPicture.asset(
              "assets/images/img_nav_home.svg",
            ),
            selectedIcon: Icon(Icons.home_filled),
            label: 'HOME'),
        NavigationDestination(
          icon: SvgPicture.asset(
            "assets/images/img_nav_favourite.svg",
          ),
          selectedIcon: Icon(Icons.favorite_rounded),
          label: 'Favourite',
        ),
        NavigationDestination(
          icon: Icon(Icons.person_2_outlined),
          selectedIcon: Icon(Icons.person_2_rounded),
          label: 'Profile',
        ),
      ],
      onDestinationSelected: (int index) {
        setState(() {
          currentPageIndex = index;
        });
      },
    );
  }
}

class SliderItemWidget extends StatelessWidget {
  const SliderItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/images/img_e521f000_f6ee_1.png",
      height: 96,
    );
  }
}
