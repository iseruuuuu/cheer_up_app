import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class DepressList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(''),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: ListView(
          children: [
            _menuItem('忙しいと言わない。\n「忙しい」と言って、\nやりたいことを後回しにしていたら\nいつまでもやりたいことはできない',),
            _menuItem('ここで逃げたら何も変わらない。\n今度こそ',),
            _menuItem('楽しいと思えるまで努力すればいい',),
            _menuItem('やる気になるのを待っていたら、\nもう遅い。\n今すぐやるかやらないか。',),
            _menuItem('何をしたいのか、明確にする。\nゴールがわからないと辿り着かない。',),
            _menuItem('ほとんどの人は\n結果でしか判断しない。\nだから、結果さえ出せば\nいくらでも覆せる。',),
            _menuItem('ほんとに強い人は誰とも戦わない',),
            _menuItem('あきらめたら、そこで試合終了です。',),
            _menuItem('多くの人は\n自分にはなれないもの\nになろうとしている。\nあなたはあなたのままでいいのだ',),
            _menuItem('人の考えや行動のひとつひとつは、\n巡り巡っていつか\n必ず自分の身に返ってくる',),
            _menuItem('人を幸せにできるためには、\n自分をまず幸せに\nしなければらない。\n自分の中の革命である。',),
            _menuItem('状況？何が状況だ。\n俺が状況を作るのだ。\n環境がどうしたというのだ。\n環境とは自分で\n作り出すものではないか',),
            _menuItem('やるかどうか悩んでいる時点で\n無意識にやる選択肢を選んでみよう。\n今やることで後で楽になる。',),
            _menuItem( '「いつやるの？今でしょ」という\n言葉を侮ってはいけない。\n今か後で未来は変わる。',),
          ],
        ),
      ),
    );
  }



  Widget _menuItem(String title) {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.all(8.0),
        decoration: new BoxDecoration(
            border: new Border(bottom: BorderSide(width: 1.0, color: Colors.grey))
        ),
        child: Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(10),
              height: 400,
            ),
            Text(title,  overflow: TextOverflow.ellipsis,
              maxLines: 10,softWrap: true,style: TextStyle(color:Colors.black, fontSize: 20.0
              ),
            ),
          ],
        ),
      ),
      onTap: () {
      },
    );
  }
}