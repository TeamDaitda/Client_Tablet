import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:get/get.dart';


class PaymentPage extends StatefulWidget {
  @override
  _PaymentPageState createState() => _PaymentPageState();
} 

class _PaymentPageState extends State<PaymentPage> {
  InterstitialAd myInterstitial;
  bool hasFailed;

  @override
  void initState() {
    super.initState();
    myInterstitial = InterstitialAd(
      adUnitId: 'ca-app-pub-3940256099942544/4411468910', 
      request: AdRequest(),
      listener: AdListener(
        onAdLoaded: (ad) {
          setState(() {
            hasFailed = false;
          });
        },
        onAdClosed: (ad) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SecondPage(), // Navigate to second page
            ),
          );
          ad.dispose(); // dispose of ad
        },
        onAdFailedToLoad: (ad, error) {
          setState(() {
            hasFailed = true;
          });
          ad.dispose(); // dispose of ad
          print('Ad exited with error: $error');
        },
      ),
    );
    myInterstitial.load(); // loads ad before showing
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Interstatial Ads'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            hasFailed
                ? Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          SecondPage(), // Navigate to second page
                    ),
                  )
                : myInterstitial.show();
          },
          child: Text('Go To Second Page'),
        ),
      ),
    );
  }
}

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  InterstitialAd myInterstitial;
  bool hasFailed;

  @override
  void initState() {
    super.initState();
    myInterstitial = InterstitialAd(
      adUnitId: 'ca-app-pub-3940256099942544/4411468910', // test ad ids for differemt platform
      request: AdRequest(),
      listener: AdListener(
        onAdLoaded: (ad) {
          setState(() {
            hasFailed = false;
          });
        },
        onAdClosed: (ad) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => PaymentPage(), // Navigate to first page
            ),
          );
          ad.dispose(); // dispose of ad
        },
        onAdFailedToLoad: (ad, error) {
          setState(() {
            hasFailed = true;
          });
          ad.dispose(); // dispose of ad
          print('Ad exited with error: $error');
        },
      ),
    );
    myInterstitial.load(); // loads ad before showing
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            Navigator.pop(context); // pops page
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    PaymentPage(), // replace popped page to call init again
              ),
            );
          },
        ),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            if (hasFailed) {
              Navigator.pop(context); // pops page
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      PaymentPage(), // replace popped page to call init again
                ),
              );
            } else {
              myInterstitial.show();
            }
          },
          child: Text('Go To First Page'),
        ),
      ),
    );
  }
}