import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          _CustomAppBar(screenHeightRatioSectionHeight: 0.4),
          SliverList(
            delegate: SliverChildListDelegate([
              _FilmInfo(
                screenLongestRatio: 0.3,
                screenShortestRatio: 0.4,
                screenLongestRatioSectionHeight: 0.3,
              ),
              _OverView(),
              _Casting(
                screenLongestRatio: 0.3,
                screenShortestRatio: 0.4,
                screenLongestRatioSectionHeight: 0.4,
                itemCount: 5,
              ),
            ]),
          ),
        ],
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  final double screenHeightRatioSectionHeight;

  const _CustomAppBar({
    super.key,
    required this.screenHeightRatioSectionHeight,
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
        title: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Text('Details: FILENAME', maxLines: 1),
        ),
        centerTitle: true,
        background: FadeInImage(
          placeholder: AssetImage('assets/loading-roll.gif'),
          image: NetworkImage('https://i.sstatic.net/y9DpT.jpg'),
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
  const _FilmInfo({
    super.key,
    required this.screenShortestRatio,
    required this.screenLongestRatio,
    required this.screenLongestRatioSectionHeight,
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
                  ),
                  _FilmData(),
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
  const _FilmPosterImage({
    super.key,
    required this.screenShortestRatio,
    required this.screenLongestRatio,
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
          image: NetworkImage('https://i.sstatic.net/y9DpT.jpg'),
        ),
      ),
    );
  }
}

class _FilmData extends StatelessWidget {
  const _FilmData({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Title: TITULO'),
            Text('Release date: XX-XX-XXXX'),
            Text('Country: COUNTRY'),
            Text('Genre: GENRE'),
            Text('Genre: GENRE'),
            Text('Genre: GENRE'),
            Text('Genre: GENRE'),
            Text('Genre: GENRE'),
            Text('Genre: GENRE'),
            Text('Genre: GENRE'),
            Text('Genre: GENRE'),
            Text('Genre: GENRE'),
            Text('Genre: GENRE'),
          ],
        ),
      ),
    );
  }
}

class _OverView extends StatelessWidget {
  const _OverView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Text(
        '''ndsjalf dhjsal gfjlds gfjldsgbhjflds ghjflds gbhjfldsg jhfdls ghjflds
        fdmsjaknfjdlksngjfkldsngjkdfs
        gfdjnsgkndfjkgsfjkdñsgfkjlsgnfkjldsgkdflsnoñfndjkglsn dfs
        gfdjsgknfkdjglsfkdlsgn d,.sngdfkjls
        gfdsgjfkodsgnmlfñsngjfkñsngkfjdlsg
        fgkfdñsngjkfñniosñafmdklsmklñfhsa fnekoañnfdañnfdsñoav fdspia´fmdsioañnvça
        njfkldjkds vflds ''',
      ),
    );
  }
}

class _Casting extends StatelessWidget {
  final double screenShortestRatio;
  final double screenLongestRatio;
  final double screenLongestRatioSectionHeight;
  final int itemCount;

  const _Casting({
    super.key,
    required this.screenShortestRatio,
    required this.screenLongestRatio,
    required this.screenLongestRatioSectionHeight,
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
          Expanded(
            child: CardSliderWidget(
              itemCount: itemCount,
              screenShortestRatio: screenShortestRatio,
              screenLongestRatio: screenLongestRatio,
              footer: 'FMDSAGKJNDFJKAFNDSALFdsnajghf ahjfdasnf hjlasgjldsa ',
            ),
          ),
        ],
      ),
    );
  }
}
