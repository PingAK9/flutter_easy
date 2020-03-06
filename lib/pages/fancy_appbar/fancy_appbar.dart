import 'package:flutter/material.dart';

class FancyAppbar extends StatefulWidget {
  FancyAppbar(
      {@required this.children,
      this.appbarSetting,
      this.title = '',
      this.bigAppbar,
      this.expandedHeight = 190});

  final AppBar appbarSetting;
  final String title;
  final Widget bigAppbar;
  final List<Widget> children;
  final double expandedHeight;

  @override
  _FancyAppbarState createState() => _FancyAppbarState();
}

class _FancyAppbarState extends State<FancyAppbar> {
  ScrollController _scrollController = ScrollController();

  double topPosition;

  @override
  void initState() {
    topPosition = -80;
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  double _getOpacity() {
    double op = (topPosition + 80) / 80;
    return op > 1 || op < 0 ? 1 : op;
  }

  _onScroll() {
    if (_scrollController.offset > 50) {
      if (topPosition < 0)
        setState(() {
          topPosition = (60 - widget.expandedHeight) + _scrollController.offset;
          if (_scrollController.offset > (widget.expandedHeight - 60))
            topPosition = 0;
        });
    } else {
      if (topPosition > (100 - widget.expandedHeight))
        setState(() {
          topPosition--;
          if (_scrollController.offset <= 0) topPosition = -80;
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    AppBar appbar = widget.appbarSetting ??
        AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
        );

    int actionLength = appbar.actions == null ? 0 : appbar.actions.length;
    bool hasLeading = appbar.leading != null ||
        (Navigator.canPop(context) && appbar.automaticallyImplyLeading == true);

    return Scaffold(
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: <Widget>[
                Container(
                  padding:
                      const EdgeInsets.only(left: 16.0, right: 50, top: 70),
                  height: widget.expandedHeight,
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.only(bottomRight: Radius.circular(30.0)),
                    color: Theme.of(context).primaryColor,
                  ),
                  child: widget.bigAppbar,
                ),
                Column(
                  children: widget.children,
                ),
              ],
            ),
          ),
          Positioned(
            top: topPosition,
            left: 0,
            right: 0,
            child: Container(
              height: 80,
              padding: EdgeInsets.only(
                  left: (15.0 + (hasLeading ? 35 : 0)),
                  top: 20.0,
                  right: (15.0 + actionLength * 40)),
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.only(bottomRight: Radius.circular(30.0)),
                color:
                    Theme.of(context).primaryColor.withOpacity(_getOpacity()),
              ),
              child: DefaultTextStyle(
                style: const TextStyle(),
                softWrap: false,
                overflow: TextOverflow.ellipsis,
                child: Semantics(
                  child: Text(widget.title),
                  header: true,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 80,
            child: appbar,
          )
        ],
      ),
    );
  }
}
