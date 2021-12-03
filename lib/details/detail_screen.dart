import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:learn_flutter/admob/ad_helper.dart';
import 'package:learn_flutter/details/dish_list_view.dart';
import 'package:learn_flutter/details/restaurant_rich_view.dart';
import 'package:learn_flutter/models/restaurant.dart';

class DetailScreen extends StatefulWidget {
  final Restaurant restaurant;

  const DetailScreen({Key? key, required this.restaurant}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {

  BannerAd? _bannerAd;


  @override
  void initState() {
    super.initState();

    AdHelper.createAndLoadBannerAdIfSupported((bannerAd) {
      setState(() {
        _bannerAd = bannerAd;
      });
    });

    AdHelper.loadAndPresentInterstitialIfSupported();
  }

  @override
  Widget build(BuildContext context) {
    final bannerAd = _bannerAd;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.restaurant.name),
        backgroundColor: Colors.lightGreen,
      ),
      body: Column(
        children: [
          Expanded(flex: 1, child: RestaurantRichView(restaurant: widget.restaurant,)),
          Expanded(flex: 2, child: DishListView(restaurant: widget.restaurant,)),
          if (bannerAd != null)
            AdHelper.bottomBannerWidget(bannerAd),
        ],
      ),
    );
  }
}
