import 'package:simple_animations/simple_animations.dart';
 import 'package:flutter/material.dart';


class FadeAnimation extends StatelessWidget {
	final double delay;
	final Widget child;
FadeAnimation(this.delay,this.child);
	@override
	Widget build(BuildContext context) {
		final tween = MultiTrackTween([
			Track("opacity").add(Duration(milliseconds: 500), Tween(begin: 0.0, end: 1.0)),
			Track("translateY").add(Duration(milliseconds: 500), Tween(begin:-30, end:0.0),curve: Curves.easeOut)
		]);
		return  ControlledAnimation(
			delay: Duration(milliseconds: ( 500*delay).round()),
			duration: tween.duration,
			child: child,
			tween: tween,
			builderWithChild: (context,child, animation)=> Opacity(
opacity: animation["opacity"],
				child: Transform.translate(offset: Offset(10,animation["translateY"]),
				child: child ,),
		)
		);
		}

	}


