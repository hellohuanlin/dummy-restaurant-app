import 'package:flutter/cupertino.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:universal_io/io.dart';

typedef BannerCompletion = Function(BannerAd? bannerAd);

class AdHelper {

  static void createAndLoadBannerAdIfSupported(BannerCompletion completion) {
    try {
      final bannerAd = BannerAd(
          size: AdSize.banner,
          adUnitId: BannerAd.testAdUnitId,
          listener: BannerAdListener(
              onAdLoaded: (ad) {
                completion(ad as BannerAd);
              },
              onAdFailedToLoad: (ad, err) {
                completion(null);
                ad.dispose();
              }
          ),
          request: const AdRequest()
      );
      bannerAd.load();
    } catch (err) {
      // not supported (web)
    }
  }

  static void disposeBannerIfSupported(BannerAd? bannerAd) {
    bannerAd?.dispose();
  }

  static Widget bottomBannerWidget(BannerAd bannerAd) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SizedBox(
          width: bannerAd.size.width.toDouble(),
          height: bannerAd.size.height.toDouble(),
          child: AdWidget(ad: bannerAd,)
      ),
    );
  }

  static void loadAndPresentInterstitialIfSupported() {
    try {
      InterstitialAd.load(
          adUnitId: InterstitialAd.testAdUnitId,
          request: const AdRequest(),
          adLoadCallback: InterstitialAdLoadCallback(
              onAdLoaded: (ad) {
                ad.show();
              },
              onAdFailedToLoad: (err) {}
          )
      );
    } catch (err) {
      // not supported (web)
    }
  }



}