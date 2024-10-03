import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdManager {
  static const String bannerAdUnitId = 'YOUR_BANNER_AD_UNIT_ID';
  static const String interstitialAdUnitId = 'YOUR_INTERSTITIAL_AD_UNIT_ID';
  static const String appOpenAdUnitId = 'YOUR_APP_OPEN_AD_UNIT_ID';

  static BannerAd? _bannerAd;

  static BannerAd? get bannerAd => _bannerAd;

  static void loadBannerAd() {
    _bannerAd = BannerAd(
      adUnitId: bannerAdUnitId,
      request: AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (_) {
          print('Banner ad loaded.');
        },
        onAdFailedToLoad: (ad, error) {
          print('Banner ad failed to load: $error');
          ad.dispose();
        },
      ),
    )..load();
  }
}
