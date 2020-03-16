import 'package:flutter/material.dart';

class MarqueeWidget extends StatefulWidget {
  final Widget child;
  final Axis direction;
  final Duration animationDuration, backDuration, pauseDuration;

  const MarqueeWidget({
    this.direction: Axis.horizontal, 
    this.animationDuration: const Duration(milliseconds: 3000), 
    this.backDuration: const Duration(milliseconds: 800), 
    this.pauseDuration: const Duration(milliseconds: 800), 
    @required this.child
  });
  
  @override
  _MarqueeWidgetState createState() => _MarqueeWidgetState();
}

class _MarqueeWidgetState extends State<MarqueeWidget> {
  ScrollController scrollController;

  void scroll(_) async {
    while (scrollController.hasClients) {
      await Future.delayed(widget.pauseDuration);
      if(scrollController.hasClients)
        await scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration: widget.animationDuration,
          curve: Curves.linear
        );
      await Future.delayed(widget.pauseDuration);
      if(scrollController.hasClients){
        //await scrollController.
        
        await scrollController.animateTo(
          0.0, 
          duration: widget.backDuration, 
          curve: Curves.easeOut
        );
      }
    }
  }

  @override
  void initState() {
    scrollController = ScrollController(initialScrollOffset: 0.0);
    WidgetsBinding.instance.addPostFrameCallback(scroll);
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: widget.child,
      scrollDirection: widget.direction,
      controller: scrollController,
    );
  }
}