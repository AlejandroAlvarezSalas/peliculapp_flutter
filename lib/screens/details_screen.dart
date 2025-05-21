import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/models.dart';
import '../providers/providers.dart';
import '../widgets/widgets.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Result movie = ModalRoute.of(context)!.settings.arguments as Result;

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          _CustomAppBar(
            screenHeightRatioSectionHeight: 0.4,
            imageUrl: movie.backdropImgUrl,
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              _FilmInfo(
                screenLongestRatio: 0.3,
                screenShortestRatio: 0.4,
                screenLongestRatioSectionHeight: 0.3,
                imageUrl: movie.fullPosterImgUrl,
                originalTitle: movie.originalTitle,
                originalLanguage: movie.originalLanguage,
                releaseDate:
                    '${movie.releaseDate.day}/${movie.releaseDate.month}/${movie.releaseDate.year}',
                localizedTitle: movie.title,
                voteAverage: movie.voteAverage,
                voteCount: movie.voteCount,
              ),
              _OverView(overviewText: movie.overview),
              /*_Casting(
                screenLongestRatio: 0.3,
                screenShortestRatio: 0.4,
                screenLongestRatioSectionHeight: 0.4,
                itemCount: 5,
                casting: movieProvider.onDisplayMovies,
              ),*/
            ]),
          ),
        ],
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  final double screenHeightRatioSectionHeight;
  final String imageUrl;

  const _CustomAppBar({
    super.key,
    required this.screenHeightRatioSectionHeight,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return SliverAppBar(
      expandedHeight: size.height * screenHeightRatioSectionHeight,
      floating: true,
      pinned: true,
      snap: true,
      flexibleSpace: FlexibleSpaceBar(
        background: FadeInImage(
          placeholder: AssetImage('assets/loading-roll.gif'),
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _FilmInfo extends StatelessWidget {
  final double screenShortestRatio;
  final double screenLongestRatio;
  final double screenLongestRatioSectionHeight;
  final String imageUrl;
  final String originalTitle;
  final String originalLanguage;
  final String releaseDate;
  final String localizedTitle;
  final double voteAverage;
  final int voteCount;

  const _FilmInfo({
    super.key,
    required this.screenShortestRatio,
    required this.screenLongestRatio,
    required this.screenLongestRatioSectionHeight,
    required this.imageUrl,
    required this.originalTitle,
    required this.originalLanguage,
    required this.releaseDate,
    required this.localizedTitle,
    required this.voteAverage,
    required this.voteCount,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(20),
            child: Container(
              height: size.longestSide * screenLongestRatioSectionHeight,
              color: Colors.grey,
              child: Row(
                children: [
                  _FilmPosterImage(
                    screenShortestRatio: screenShortestRatio,
                    screenLongestRatio: screenLongestRatio,
                    imageUrl: imageUrl,
                  ),
                  _FilmData(
                    localizedTitle: localizedTitle,
                    originalLanguage: originalLanguage,
                    originalTitle: originalTitle,
                    releaseDate: releaseDate,
                    voteAverage: voteAverage,
                    voteCount: voteCount,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _FilmPosterImage extends StatelessWidget {
  final double screenShortestRatio;
  final double screenLongestRatio;
  final String imageUrl;
  const _FilmPosterImage({
    super.key,
    required this.screenShortestRatio,
    required this.screenLongestRatio,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Container(
      width: size.shortestSide * screenShortestRatio,
      height: size.longestSide * screenLongestRatio,
      child: ClipRRect(
        borderRadius: BorderRadiusGeometry.circular(20),
        child: FadeInImage(
          fit: BoxFit.cover,
          placeholder: AssetImage('assets/loading-roll.gif'),
          image: NetworkImage(imageUrl),
        ),
      ),
    );
  }
}

class _FilmData extends StatelessWidget {
  final String originalTitle;
  final String originalLanguage;
  final String releaseDate;
  final String localizedTitle;
  final double voteAverage;
  final int voteCount;

  const _FilmData({
    super.key,
    required this.originalTitle,
    required this.originalLanguage,
    required this.releaseDate,
    required this.localizedTitle,
    required this.voteAverage,
    required this.voteCount,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 3.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 5,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Título:', style: TextStyle(fontWeight: FontWeight.bold)),
                Text('$localizedTitle'),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Título original:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text('$originalTitle'),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Fecha de lanzamiento:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text('$releaseDate'),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Idioma original:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text('$originalLanguage'),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Valoracion: ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text('$voteAverage ($voteCount)'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _OverView extends StatelessWidget {
  final String overviewText;
  const _OverView({super.key, required this.overviewText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Text(overviewText),
    );
  }
}

/*
class _Casting extends StatelessWidget {
  final double screenShortestRatio;
  final double screenLongestRatio;
  final double screenLongestRatioSectionHeight;
  final int itemCount;
  final List<Result> casting;

  const _Casting({
    super.key,
    required this.screenShortestRatio,
    required this.screenLongestRatio,
    required this.screenLongestRatioSectionHeight,
    required this.itemCount,
    required this.casting,
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
          Expanded(
            child: CardSliderWidget(
              itemCount: itemCount,
              screenShortestRatio: screenShortestRatio,
              screenLongestRatio: screenLongestRatio,
              items: casting,
              footer: 'FMDSAGKJNDFJKAFNDSALFdsnajghf ahjfdasnf hjlasgjldsa ',
            ),
          ),
        ],
      ),
    );
  }
}*/
