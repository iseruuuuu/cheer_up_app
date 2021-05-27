import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:swipable_stack/swipable_stack.dart';

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
  '忙しいと言わない 「忙しい」と言って、やりたいことを後回しにしていたらいつまでもやりたいことはできません',
  'ここで逃げたら何も変わらない。今度こそ',
  '楽しいと思えるまで努力すればいい',
  'やる気になるのを待っていたら、もう遅い。今すぐやるかやらないか。',
  '何をしたいのか、明確にする。ゴールがわからないと辿り着かない。',
  'ほとんどの人は結果でしか判断しない。だから、結果さえ出せばいくらでも覆せる',
  'ほんとに強い人は誰とも戦わない',
  'あきらめたら、そこで試合終了です。',
  '多くの人は自分にはなれないものになろうとしている。あなたはあなたのままでいいのだ',
  '人の考えや行動のひとつひとつは、巡り巡っていつか必ず自分の身に返ってくる',
  '人を幸せにできるためには、自分をまず幸せにしなければらない。自分の中の革命である',
  '状況？何が状況だ。俺が状況を作るのだ。環境がどうしたというのだ。環境とは自分で作り出すものではないか',
  //井関の名言
  'やるかどうか悩んでいる時点でやる気がないでしょ。今やることで後で楽になる。',
  'いつやるの？今でしょという言葉を侮ってはいけない。今か後で未来は変わる。',

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
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {


  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late SwipableStackController _controller;
  late FlutterTts flutterTts;

  void _listenController() {
    setState(() {});
   // _controller = SwipableStackController()..addListener(_listenController);
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
  String word2 = '';
  String word3 = '';
  String word4 = '';
  String word5 = '';
  String word6 = '';
  int num = 0;
  int num2 = 0;
  int i = 0;

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
                /*
                if (i == 13) {
                  //TODO元に戻す？？
                  setState(() {
                    i = 0;
                    print("14だよ");
                  });
                }else{
                  i += 1;
                }

                 */

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
               // print(Path.length);
                print(index % welcomeImages.length); //0 1 2
              //  print(welcomeImages.length); //14 14 14
              //  print(index); //0.1 2
               // print(index / welcomeImages.length);



               // final Word2 = index - 2;
               // final Word3 = welcomeImages[index * 2];
               // final Word4 = index % welcomeImages.length;
                final Word = Path;
                word = Word;

                //word = Path;
               // num = Word2;
                //word3 = Word3;
                //num2 = Word4;

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
                            flutterTts.speak(word);
                            print(word);

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

