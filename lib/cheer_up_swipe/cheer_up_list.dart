import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class CheerUpList extends StatelessWidget {
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
            _menuItem('できると思えばできる、\nできないと思えばできない。\nゆるぎない絶対的な法則である。',),
            _menuItem( 'うつむいてはいけない。\nいつも頭を高くあげていなさい。\n世の中を真っ正面から\n見つめなさい。',),
            _menuItem( '薬を10錠飲むよりも、\n心から笑った方が\nずっと効果があるはず。',),
            _menuItem( 'この浮世は一つの鏡である。\nこの鏡には皆自分の姿が映る。\nだから君が額に八の字を浮かべて\n鏡に向かえば、\n鏡も八の字を寄せて\n君を睨み返し、\n君が微笑みを浮かべて\n鏡に対すれば、\n鏡も微笑みをもって君に応える。',),
            _menuItem('友達とはあなたの欠点を\n愛してくれる人のこと。',),
            _menuItem( '失敗して、\n考え悩むこともあるだろうけど、\n立ち止まっていてはいけない。\n一気に100メートルも\n進まなくていい。\n1センチでもいいから前に進もう',),
            _menuItem( '今、この瞬間を幸せでいよう。\nそれで十分です。\nその瞬間、瞬間が、\n私たちの求めているもの\nすべてであって、\n他には何もいらないのです。',),
            _menuItem( '最も大事なことは、\n人生を楽しむこと、\n幸せを感じること、\nそれが全てです。',),
            _menuItem( '愛はお互いを見つめること\nではなく、同じ方向に向かって\n一緒に外を向くことで\n成り立っています。',),
            _menuItem( '長い目で見れば、\n『努力をしない天才』よりも、\n『才能のない努力家』のほうが\n多くのことを成し遂げる',),
            _menuItem(  '将来のことを\n悲観しすぎなくてもいい。\n今、していることが\n将来を形成しているのから。\n今、一生懸命やることが\n将来につながる。',),
            _menuItem(  '他の人のことを\n気にしすぎなくてもいい。\n気になって何もできないなら、\nひとりの時に全力でやってみよう。\n僕が代わりに認めてあげるから。',),
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