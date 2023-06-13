import 'package:art_core/art_core.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ImageSlider<T> extends StatefulWidget {
  final double height;

  final double width;

  final bool enableInfiniteScroll;

  final bool autoPlay;

  final List<T> images;

  final double viewportFraction;

  const ImageSlider(
      {Key? key,
      this.height = 225,
      required this.width,
      this.enableInfiniteScroll = true,
      this.autoPlay = true,
      required this.images,
      this.viewportFraction = 0.8})
      : super(key: key);

  @override
  State<ImageSlider<T>> createState() => _ImageSliderState<T>();
}

class _ImageSliderState<T> extends State<ImageSlider<T>> {
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: Stack(
        children: [

          Positioned(
            right: 0,
            left: 0,
            child: CarouselSlider(
              options: CarouselOptions(
                  initialPage: 0,
                  enableInfiniteScroll: widget.enableInfiniteScroll,
                  // aspectRatio: 1,
                 // viewportFraction: widget.viewportFraction,
                  autoPlay: widget.autoPlay,
                  onPageChanged: (index, _) {
                    setState(() {
                      pageIndex = index;
                    });
                  }
                  // enlargeCenterPage: true,
                  ),
              items: widget.images
                  .map((image) => ClipRRect(
                        borderRadius: BorderRadius.circular(0),
                        child: GestureDetector(
                          onTap :()=>  showDialog(
                              context: context,
                              builder: (context) => Dialog(
                                child: CachedNetworkImage(imageUrl:image.toString()),
                              )),
                          child: CachedNetworkImage(
                            width: widget.width,
                            imageUrl: image.toString(),
                            // fit: BoxFit.fitHeight,
                            imageBuilder: (context, imageProvider) => Container(
                              padding: const EdgeInsets.only(bottom: 15),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: imageProvider,
                                   fit: BoxFit.fill,
                                ),
                              ),
                              alignment: Alignment.bottomCenter,
                            ),
                          ),
                        ),
                      ))
                  .toList(),
            ),
          ),
          Positioned(
            bottom: 20,
            right: 0,
            left: 0,
            child: Center(
              child: CarouselIndicator(
                count: widget.images.length,
                index: pageIndex,
                space: 5,
                activeColor: AppColors.primaryColor,
                color: colorWhite,
                height: 5,
                width: 20,
                cornerRadius: 0,
              ),
            ),
          )
        ],
      ),
    );
  }
}
