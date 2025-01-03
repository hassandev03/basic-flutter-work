import 'package:flutter/material.dart';

class ImageWidget extends StatefulWidget {
  final String imageUrl;
  final double height, width;
  const ImageWidget({
    super.key,
    required this.imageUrl,
    required this.height,
    required this.width,
  });

  @override
  State<ImageWidget> createState() => _ImageWidgetState();
}

class _ImageWidgetState extends State<ImageWidget> {
  bool _isLoading = true, _hasError = false;

  void _handleImageLoading() {
    final ImageStream stream =
        NetworkImage(widget.imageUrl).resolve(ImageConfiguration());
    stream.addListener(
      ImageStreamListener(
        (image, _) {
          if (mounted) {
            setState(
              () {
                _isLoading = false;
              },
            );
          }
        },
        onError: (error, stackTrace) {
          if (mounted) {
            setState(
              () {
                _isLoading = false;
                _hasError = true;
              },
            );
          }
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _handleImageLoading();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (_isLoading && !_hasError)
          Positioned.fill(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        if (_hasError)
          SizedBox(
            height: widget.height,
            width: widget.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.error,
                  color: Theme.of(context).colorScheme.error,
                  size: widget.height * 0.3,
                ),
                SizedBox(height: widget.height * 0.05),
                Text(
                  "Failed to load image",
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Theme.of(context).colorScheme.error,
                      ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        if (!_isLoading && !_hasError)
          Image.network(
            widget.imageUrl,
            height: widget.height,
            width: widget.width,
            fit: BoxFit.cover,
          ),
      ],
    );
  }
}
