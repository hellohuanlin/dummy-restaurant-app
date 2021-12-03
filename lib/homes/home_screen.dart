import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:learn_flutter/admob/ad_helper.dart';
import 'package:learn_flutter/details/detail_screen.dart';
import 'package:learn_flutter/homes/inherited_home_widget.dart';
import 'package:learn_flutter/homes/restaurant_list_view.dart';
import 'package:learn_flutter/models/food_category.dart';
import 'package:learn_flutter/models/restaurant.dart';
import 'package:learn_flutter/homes/search_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

Future<List<Restaurant>> heavyComputation(List<Restaurant> restaurants) async {
  sleep(const Duration(seconds: 3));
  return restaurants;
}

class _HomeScreenState extends State<HomeScreen> {

  List<Restaurant> _restaurants = [];
  String? _dishQuery;
  bool _isVegOn = false;
  bool _doneLoading = false;

  BannerAd? _bannerAd;

  @override initState() {
    super.initState();

    AdHelper.createAndLoadBannerAdIfSupported((bannerAd) {
      setState(() {
        _bannerAd = bannerAd;
      });
    });
  }

  @override
  void dispose() {
    AdHelper.disposeBannerIfSupported(_bannerAd);
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    context.dependOnInheritedWidgetOfExactType<InheritedHomeWidget>()
      ?.restaurantDataSource
      .fetchRestaurantData()
      .then((restaurants) => compute(heavyComputation, restaurants))
      .then((restaurants) {
        setState(() {
          _doneLoading = true;
          _restaurants = restaurants;
        });
      });
  }

  void _handleToggleVeg(bool on) {
    setState(() {
      _isVegOn = on;
    });
  }

  void _handleSearchText(String text) {
    setState(() {
      _dishQuery = text.trim();
    });
  }

  void _handleTapRestaurant(BuildContext context, Restaurant restaurant) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => DetailScreen(restaurant: restaurant))
    );
  }

  List<Restaurant> get _filteredList {
    final vegFiltered = _isVegOn ? _restaurants.where((it) => it.dishes.any((it) => it.category == FoodCategory.vegetarian)).toList() : _restaurants;
    final query = _dishQuery;
    if (query == null || query.isEmpty) return vegFiltered;
    return vegFiltered
        .where((restaurant) {
          return restaurant.dishes.any((dish) => dish.match(query));
      }).toList();
  }

  Widget _buildMainBody() {
    return _doneLoading
        ? RestaurantListView(restaurants: _filteredList, onTapRestaurant: _handleTapRestaurant,)
        : const Center(child: CircularProgressIndicator());
  }

  @override
  Widget build(BuildContext context) {
    final bannerAd = _bannerAd;
    return Scaffold(
      appBar: SearchBar(onSearchText: _handleSearchText, onToggleVeg: _handleToggleVeg, isVegOn: _isVegOn,),
      body: Column(
        children: [
          Expanded(
            child: _buildMainBody(),
          ),
          if (bannerAd != null)
            AdHelper.bottomBannerWidget(bannerAd),
        ],
      )
    );
  }
}


