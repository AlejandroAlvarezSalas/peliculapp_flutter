import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../models/models.dart';

class CardSliderWidget extends StatelessWidget {
  final double screenShortestRatio;
  final double screenLongestRatio;
  final bool showDetails;
  final int itemCount;
  final String? footer;
  final List<Result> items;

  const CardSliderWidget({
    super.key,
    this.showDetails = false,
    required this.itemCount,
    required this.screenLongestRatio,
    required this.screenShortestRatio,
    this.footer,
    required this.items,
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
                                  arguments: items[index],
                                )
                                : null,
                    child: FadeInImage(
                      placeholder: AssetImage('assets/loading-roll.gif'),
                      image: NetworkImage(items[index].fullPosterImgUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Text(
                footer ?? items[index].title,
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
