import 'package:bloc_architecture/constant/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppLoadMore extends StatefulWidget {

  final Future<void> Function()? onRefresh;
  final Future<void> Function()? onLoadmore;
  final bool isLastPage;
  final Widget child;
  final String noMoreText;
  final TextStyle? noMoreTextStyle;
  final Color colorIndicator;

  AppLoadMore({
    required this.child,
    required this.isLastPage,
    this.onRefresh,
    this.noMoreText = "",
    this.colorIndicator = AppColor.primaryColor,
    this.noMoreTextStyle,
    this.onLoadmore
  });

  @override
  _AppLoadMoreState createState() => _AppLoadMoreState();
}

class _AppLoadMoreState extends State<AppLoadMore> {

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
  GlobalKey<RefreshIndicatorState>();

  late ScrollController _scrollController;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() async {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent) {
        if (_isLoading) {
          return;
        }

        if (mounted) {
          setState(() {
            _isLoading = true;
          });
        }

        if (widget.onLoadmore != null) {
          await widget.onLoadmore!();
        }

        if (mounted) {
          setState(() {
            _isLoading = false;
          });
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget mainWiget = ListView(
      physics: AlwaysScrollableScrollPhysics(),
      controller: _scrollController,
      children: <Widget>[
        widget.child,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(16),
              child: _isLoading
                  ? CupertinoActivityIndicator()
                  : Text(
                widget.isLastPage
                    ? widget.noMoreText ?? 'No more data'
                    : '',
                style: widget.noMoreTextStyle ??
                    TextStyle(
                      fontSize: 18,
                      color: Theme.of(context).disabledColor,
                    ),
              ),
            )
          ],
        )
      ],
    );

    if (widget.onRefresh == null) {
      return Scrollbar(child: mainWiget);
    }

    return RefreshIndicator(
      key: _refreshIndicatorKey,
      color: widget.colorIndicator,
      onRefresh: () async {
        if (_isLoading) return;
        await widget.onRefresh!();
      },
      child: mainWiget,
    );

  }
}