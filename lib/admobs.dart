// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdModLoadVideo {
  static bool isAdload2 = false;
  static late InterstitialAd interstitialAd;

  static void lodein({required String theKey}) {
    InterstitialAd.load(
        adUnitId: theKey,
        request: const AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
            onAdLoaded: onAdLoaded, onAdFailedToLoad: (error) {}));
  }

  static void onAdLoaded(InterstitialAd ad) {
    interstitialAd = ad;
    isAdload2 = true;
  }
}

class AdModBanner {
  static late BannerAd bannerAd;
  static bool isAdload = false;
  static initBannerAd({required BannerAdListener set, required String theKey}) {
    bannerAd = BannerAd(
        size: AdSize.banner,
        adUnitId: theKey,
        listener: set,
        request: const AdRequest());
    bannerAd.load();
  }
}

class BannerCustom extends StatelessWidget {
  const BannerCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AdModBanner.bannerAd.size.height.toDouble(),
      width: AdModBanner.bannerAd.size.width.toDouble(),
      child: AdWidget(ad: AdModBanner.bannerAd),
    );
  }
}




  //  AdModBanner.initBannerAd(
  //     set: BannerAdListener(
  //         onAdLoaded: (ad) {
  //           setState(() {
  //             AdModBanner.isAdload = true;
  //           });
  //         },
  //         onAdFailedToLoad: (ad, error) {}),
  //   );
  //   AdModLoadVideo.lodein();



  //in buttom navecation banner
  //          AdModBanner.isAdload ? const BannerCustom() : const SizedBox(),




//for video adMod

//  if (AdModBanner.isAdload) {
//                                   AdModLoadVideo.interstitialAd.show();
//                                 }