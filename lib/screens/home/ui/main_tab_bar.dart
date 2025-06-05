import 'package:flutter/material.dart';
import 'package:kitaabe/components/color_extension.dart';
import 'package:kitaabe/screens/home/ui/drawer/favourite/ui/favourite_view.dart';
import 'package:kitaabe/screens/home/ui/drawer/profile/profile_view.dart';
import 'package:kitaabe/screens/search/search_view.dart';

import 'home_view.dart';

class MainTabBar extends StatefulWidget {
  const MainTabBar({super.key});

  @override
  State<MainTabBar> createState() => _MainTabBarState();
}

class _MainTabBarState extends State<MainTabBar> with TickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    tabController = TabController(
      length: 4,
      vsync: this,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: tabController,
        children: [
          const HomeView(),
          const SearchView(),
          const ProfileView(),
          const FavouriteView(),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: TColor.primary,
        child: TabBar(
          controller: tabController,
          indicatorColor: Colors.transparent,
          dividerColor: Colors.transparent,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white54,
          tabs: const [
            Tab(
              icon: Icon(Icons.home),
              text: 'Home',
            ),
            Tab(
              icon: Icon(Icons.search),
              text: 'Search',
            ),
            Tab(
              icon: Icon(Icons.person_pin),
              text: 'Profile',
            ),
            Tab(
              icon: Icon(Icons.star),
              text: 'Starred',
            ),
          ],
        ),
      ),
    );
  }
}
