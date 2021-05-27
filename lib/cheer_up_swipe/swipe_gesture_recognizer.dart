import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:share/share.dart';
import 'package:swipable_stack/swipable_stack.dart';
import 'package:url_launcher/url_launcher.dart';
import 'card_label.dart';
import '';

class SwipeDirectionColor {
  static const right = Color.fromRGBO(70, 195, 120, 1);
  static const left = Color.fromRGBO(220, 90, 108, 1);
  static const up = Color.fromRGBO(83, 170, 232, 1);
  static const down = Color.fromRGBO(154, 85, 215, 1);
}

extension SwipeDirecionX on SwipeDirection {
  Color get color {
    switch (this) {
      case SwipeDirection.right:
        return Color.fromRGBO(70, 195, 120, 1);
      case SwipeDirection.left:
        return Color.fromRGBO(220, 90, 108, 1);
      case SwipeDirection.up:
        return Color.fromRGBO(83, 170, 232, 1);
      case SwipeDirection.down:
        return Color.fromRGBO(154, 85, 215, 1);
    }
    return Colors.transparent;
  }
}

const _images = [
  'assets/1.png',
  'assets/2.png',
  'assets/3.png',
];

const welcomeImages = [
  'できると思えばできる、できないと思えばできない。これは、ゆるぎない絶対的な法則である。',
  'うつむいてはいけない。いつも頭を高くあげていなさい。世の中を真っ正面から見つめなさい。',
  '薬を10錠飲むよりも、心から笑った方がずっと効果があるはず。',
  'この浮世は一つの鏡である。この鏡には皆自分の姿が映る。だから君が額に八の字を浮かべて鏡に向かえば、鏡も八の字を寄せて君を睨み返し、君が微笑みを浮かべて鏡に対すれば、鏡も微笑みをもって君に応える。',
  '友達とはあなたの欠点を愛してくれる人のこと。',
  '失敗して、考え悩むこともあるだろうけど、立ち止まっていてはいけない。一気に100メートルも進まなくていい。1センチでもいいから前に進もう',
  '心が変われば行動が変わる行動が変われば習慣が変わる習慣が変われば人格が変わる人格が変われば運命が変わる',
  '今、この瞬間を幸せでいましょう。それで十分です。その瞬間、瞬間が、私たちの求めているものすべてであって、他には何もいらないのです。',
  '最も大事なことは、人生を楽しむこと、幸せを感じること、それが全てです。',
  '愛はお互いを見つめることではなく、同じ方向に向かって一緒に外を向くことで成り立っています。',
  '長い目で見れば、『努力をしない天才』よりも、『才能のない努力家』のほうが多くのことを成し遂げる',

  //井関の名言
  '将来のことを悲観しすぎなくてもいい。今、していることが将来を形成しているのから。今、一生懸命やることが将来につながる。',
  '他の人のことを気にしすぎなくてもいい。気になって何もできないなら、ひとりの時に全力でやってみよう。いつか認めてくれる人がいるだろう。',
];



class Swipeable extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HHome(),
    );
  }
}

class HHome extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HHome> {
  late SwipableStackController _controller;
  late FlutterTts flutterTts;

  void _listenController() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _controller = SwipableStackController()..addListener(_listenController);
    flutterTts = FlutterTts();
    flutterTts.setLanguage('ja-Jp');
  }





  static const double _bottomPadding = 140;
  static const double _topPadding = 10;

  String word = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('',style: TextStyle(color: Colors.blue),),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.blue),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            SwipableStack(
              controller: _controller,
              onSwipeCompleted: (index, direction) {
                print('$index,は $direction');
                print(index);
              },
              overlayBuilder: (
                  context,
                  constraints,
                  index,
                  direction,
                  swipeProgress,
                  ) {
                final opacity = min(swipeProgress, 1.0);
                final isRight = direction == SwipeDirection.right;
                final isLeft = direction == SwipeDirection.left;
                final isUp = direction == SwipeDirection.up;
                final isDown = direction == SwipeDirection.down;
                return Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 32,
                  ).copyWith(
                    top: _topPadding + 0,
                  ),
                  child: Stack(
                    children: [
                      Opacity(
                        opacity: isRight ? opacity : 0,
                        child: Container(),
                      ),
                      Opacity(
                        opacity: isLeft ? opacity : 0,
                        child: Container(),
                      ),
                      Opacity(
                        opacity: isUp ? opacity : 0,
                        child: Container(),
                      ),
                      Opacity(
                        opacity: isDown ? opacity : 0,
                        child: Container(),
                      ),
                    ],
                  ),
                );
              },
              builder: (context, index, constraints) {
                //  final imagePath = _images[index % _images.length];
                final Path = welcomeImages[index % welcomeImages.length];
                return Padding(
                  padding: EdgeInsets.only(
                    top: _topPadding ,
                    bottom: _bottomPadding,
                  ),
                  child: Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.95,
                        height: MediaQuery.of(context).size.height * 0.6,
                        color: Colors.grey.shade200,
                        child: Center(
                          // child: Text('${welcomeImages[index]}',
                          child: Text(Path,
                            style: TextStyle(fontSize: 30),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: _bottomPadding,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    _BottomButton(
                        color: Colors.yellow,
                        child: const Icon(Icons.play_arrow),
                        onPressed: () {
                          setState(() {
                            //TODO 音声を追加する。
                            flutterTts.setLanguage('ja-JP');
                            flutterTts.speak('asadad');
                          });
                        }
                    ),
/*
                    _BottomButton(
                      color: SwipeDirectionColor.left,
                      child: const Icon(Icons.arrow_back),
                      onPressed: () {
                        _controller.next(
                          swipeDirection: SwipeDirection.left,
                        );
                      },
                    ),
                    _BottomButton(
                      color: SwipeDirectionColor.up,
                      onPressed: () {
                        _controller.next(
                          swipeDirection: SwipeDirection.up,
                        );
                      },
                      child: const Icon(Icons.arrow_upward),
                    ),
                    _BottomButton(
                      color: SwipeDirectionColor.right,
                      onPressed: () {
                        _controller.next(
                          swipeDirection: SwipeDirection.right,
                        );
                      },
                      child: const Icon(Icons.arrow_forward),
                    ),
                    _BottomButton(
                      color: SwipeDirectionColor.down,
                      onPressed: () {
                        _controller.next(
                          swipeDirection: SwipeDirection.down,
                        );
                      },
                      child: const Icon(Icons.arrow_downward),
                    ),

                     */
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.removeListener(_listenController);
    _controller.dispose();
  }
}

class _BottomButton extends StatelessWidget {
  const _BottomButton({
    required this.onPressed,
    required this.child,
    required this.color,
  }) : super();

  final VoidCallback onPressed;
  final Icon child;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64,
      width: 64,
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.resolveWith(
                (states) => RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
          ),
          backgroundColor: MaterialStateProperty.resolveWith(
                (states) => color,
          ),
        ),
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}


/*

メモ

Opacity(
                        opacity: isRight ? opacity : 0,
                        child: CardLabel.right(),
                      ),
                      Opacity(
                        opacity: isLeft ? opacity : 0,
                        child: CardLabel.left(),
                      ),
                      Opacity(
                        opacity: isUp ? opacity : 0,
                        child: CardLabel.up(),
                      ),
                      Opacity(
                        opacity: isDown ? opacity : 0,
                        child: CardLabel.down(),
                      ),
 */