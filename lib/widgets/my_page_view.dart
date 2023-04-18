import 'package:bookano/logic/data/app_database.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MyPageView extends StatefulWidget {
  const MyPageView({
    super.key,
    required this.useTheme,
    required this.onTap,
    required this.aspectRatio,
    this.left = 24,
    this.right = 24,
    this.top = 22,
    this.bottom = 14,
  });

  final ThemeData useTheme;
  final double aspectRatio, left, right, top, bottom;
  final GestureTapCallback onTap;

  @override
  State<MyPageView> createState() => _MyPageViewState();
}

class _MyPageViewState extends State<MyPageView> {
  final PageController _controller = PageController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AspectRatio(
          aspectRatio: widget.aspectRatio,
          child: PageView.builder(
            itemCount: AppDatabase.myPageView.length,
            controller: _controller,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              PageViewData data = AppDatabase.myPageView[index];

              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                margin: EdgeInsets.fromLTRB(
                  widget.left,
                  widget.top,
                  widget.right,
                  widget.bottom,
                ),
                child: Stack(
                  alignment: AlignmentDirectional.topStart,
                  children: [
                    Image.asset(
                      data.imagePath,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      left: 10,
                      top: 14,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data.title,
                            style: widget.useTheme.textTheme.bodySmall!.apply(
                              color: widget.useTheme.colorScheme.onPrimary,
                            ),
                          ),
                          const SizedBox(height: 6),
                          ElevatedButton(
                            onPressed: widget.onTap,
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              minimumSize: const Size(50, 35),
                            ),
                            child: const Text('Explore'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        SmoothPageIndicator(
          controller: _controller,
          count: AppDatabase.myPageView.length,
          effect: ExpandingDotsEffect(
            dotColor: widget.useTheme.colorScheme.surface,
            activeDotColor: widget.useTheme.colorScheme.primary,
            dotHeight: 13,
            dotWidth: 13,
          ),
          onDotClicked: (index) => _controller.animateToPage(
            index,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          ),
        ),
      ],
    );
  }
}
