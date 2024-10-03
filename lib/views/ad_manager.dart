import 'package:flutter/foundation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdManager {
  // Replace these with your actual Ad Unit IDs
  static const String bannerAdUnitId = 'YOUR_BANNER_AD_UNIT_ID';
  static const String interstitialAdUnitId = 'YOUR_INTERSTITIAL_AD_UNIT_ID';
  static const String appOpenAdUnitId = 'YOUR_APP_OPEN_AD_UNIT_ID';

  static BannerAd? _bannerAd;

  static BannerAd? get bannerAd => _bannerAd;

  // Load the banner ad
  static void loadBannerAd() {
    _bannerAd = BannerAd(
      adUnitId: bannerAdUnitId,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (_) {
          if (kDebugMode) {
            print('Banner ad loaded.');
          }
        },
        onAdFailedToLoad: (ad, error) {
          if (kDebugMode) {
            print('Banner ad failed to load: $error');
          }
          ad.dispose(); // Dispose of the ad if it fails to load
        },
      ),
      size: AdSize.banner, // Corrected from Adsize to AdSize
    )..load();
  }

  // Dispose of the banner ad to free resources
  static void disposeBannerAd() {
    _bannerAd?.dispose();
    _bannerAd = null; // Set to null after disposing
  }
}
