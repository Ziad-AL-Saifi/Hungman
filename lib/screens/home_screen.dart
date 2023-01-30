import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hungman/utilities/hangman_words.dart';
import '../admobs.dart';
import '../components/action_button.dart';
import 'game_screen.dart';
import 'loading_screen.dart';

class HomeScreen extends StatefulWidget {
  final HangmanWords hangmanWords = HangmanWords();

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    AdModBanner.initBannerAd(
      theKey: 'ca-app-pub-9200897818831061/2237022197',
      set: BannerAdListener(
          onAdLoaded: (ad) {
            setState(() {
              AdModBanner.isAdload = true;
            });
          },
          onAdFailedToLoad: (ad, error) {}),
    );
    AdModLoadVideo.lodein(theKey: 'ca-app-pub-9200897818831061/1303214477');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    widget.hangmanWords.readWords();
    return Scaffold(
      bottomNavigationBar:
          AdModBanner.isAdload ? const BannerCustom() : const SizedBox(),
      body: SafeArea(
          child: Column(
        children: <Widget>[
          Center(
            child: Container(
              margin: EdgeInsets.fromLTRB(8.0, 1.0, 8.0, 8.0),
              child: Text(
                'HANGMAN',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 58.0,
                    fontWeight: FontWeight.w300,
                    letterSpacing: 3.0),
              ),
            ),
          ),
          Center(
            child: Container(
//              padding: EdgeInsets.all(5.0),
              child: Image.asset(
                'images/gallow.png',
                height: height * 0.49,
              ),
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          Center(
            child: IntrinsicWidth(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
//                    width: 155,
                    height: 64,
                    child: ActionButton(
                      buttonTitle: 'Start',
                      onPress: () {
                        if (AdModBanner.isAdload) {
                          AdModLoadVideo.interstitialAd.show();
                        }
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => GameScreen(
                              hangmanObject: widget.hangmanWords,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 18.0,
                  ),
                  Container(
//                    width: 155,
                    height: 64,
                    child: ActionButton(
                      buttonTitle: 'High Scores',
                      onPress: () {
                        if (AdModBanner.isAdload) {
                          AdModLoadVideo.interstitialAd.show();
                        }
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoadingScreen(),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}
