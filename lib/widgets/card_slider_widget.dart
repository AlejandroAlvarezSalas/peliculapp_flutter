import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CardSliderWidget extends StatelessWidget {
  final double screenShortestRatio;
  final double screenLongestRatio;
  final bool showDetails;
  final int itemCount;
  final String footer;

  const CardSliderWidget({
    super.key,
    this.showDetails = false,
    required this.itemCount,
    required this.screenLongestRatio,
    required this.screenShortestRatio,
    required this.footer,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ListView.builder(
      padding: EdgeInsets.all(15),
      scrollDirection: Axis.horizontal,
      itemCount: itemCount,
      itemBuilder: (context, index) {
        return Container(
          width: size.shortestSide * screenShortestRatio,
          height: size.longestSide * screenLongestRatio,
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(20),
                  child: GestureDetector(
                    onTap:
                        () =>
                            showDetails
                                ? Navigator.pushNamed(
                                  context,
                                  'details',
                                  arguments: index,
                                )
                                : null,
                    child: FadeInImage(
                      placeholder: AssetImage('assets/loading-roll.gif'),
                      image: NetworkImage('https://i.sstatic.net/y9DpT.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Text(
                'Titulo nfdhslafbhjsld hfdjsakfhdl njdfkalfmdjsak fdksalf ndslakf dnksla fndkslaf dnsalf dnsas fjhdsiafbkdhsa nfejaligfbdhiat9treopoñ',
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        );
      },
    );
  }
}
