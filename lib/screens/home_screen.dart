import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:peliculapp_flutter/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('PeliculApp'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 5.0),
            child: Icon(Icons.search_outlined),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _Highlights(
              itemCount: 10,
              screenLongestRatioCard: 0.6,
              screenShortestRatioCard: 0.6,
              screenLongestRatioSectionHeight: 0.5,
              showDetails: true,
            ),
            _Favourites(
              screenShortestRatio: 0.5,
              screenLongestRatio: 0.4,
              screenLongestRatioSectionHeight: 0.5,
              itemCount: 5,
              showDetails: true,
            ),
          ],
        ),
      ),
    );
  }
}

class _Highlights extends StatelessWidget {
  final double screenShortestRatioCard;
  final double screenLongestRatioCard;
  final double screenLongestRatioSectionHeight;
  final bool showDetails;
  final int itemCount;

  const _Highlights({
    super.key,
    required this.screenShortestRatioCard,
    required this.screenLongestRatioCard,
    required this.screenLongestRatioSectionHeight,
    this.showDetails = false,
    required this.itemCount,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
      width: double.infinity,
      height: size.longestSide * screenLongestRatioSectionHeight,
      child: Center(
        child: Swiper(
          itemCount: itemCount,
          layout: SwiperLayout.STACK,
          scrollDirection: Axis.horizontal,
          itemWidth: size.shortestSide * screenShortestRatioCard,
          itemHeight: size.longestSide * screenLongestRatioCard,
          onTap:
              (index) =>
                  showDetails
                      ? Navigator.pushNamed(
                        context,
                        'details',
                        arguments: index,
                      )
                      : null,
          itemBuilder:
              (context, index) => ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(20),
                child: FadeInImage(
                  fit: BoxFit.cover,
                  placeholder: AssetImage('assets/loading-roll.gif'),
                  image: NetworkImage('https://i.sstatic.net/y9DpT.jpg'),
                ),
              ),
        ),
      ),
    );
  }
}

class _Favourites extends StatelessWidget {
  final double screenShortestRatio;
  final double screenLongestRatio;
  final double screenLongestRatioSectionHeight;
  final bool showDetails;
  final int itemCount;

  const _Favourites({
    super.key,
    required this.screenShortestRatio,
    required this.screenLongestRatio,
    required this.screenLongestRatioSectionHeight,
    this.showDetails = false,
    required this.itemCount,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);

    return Container(
      width: double.infinity,
      height: size.longestSide * screenLongestRatioSectionHeight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Text(
              'FAVORITAS',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              textScaler: TextScaler.linear(2),
              textAlign: TextAlign.start,
            ),
          ),
          Expanded(
            child: CardSliderWidget(
              itemCount: itemCount,
              screenShortestRatio: screenShortestRatio,
              screenLongestRatio: screenLongestRatio,
              showDetails: showDetails,
              footer:
                  'Title: fndsjafuhndhsuafndshjafndsjiofbdshiaofbdhnsioagbndfhaogbndfhsiogbndhiosgndfjisogbndfhosgnadfijpndahipgbfdhiagndfjiap',
            ),
          ),
        ],
      ),
    );
  }
}
