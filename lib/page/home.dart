import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_banner_swiper/flutter_banner_swiper.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:outbreak_assistant/misc/constants.dart';
import 'package:outbreak_assistant/model/banner_post.dart';
import 'package:outbreak_assistant/page/search_page.dart';
import 'package:outbreak_assistant/page/web_page.dart';
import 'package:outbreak_assistant/widget/dashboard_menu_row.dart';
import 'package:outbreak_assistant/widget/my_bar.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var bannerList = [
    BannerPost(
        title: "欢迎来到我的校园",
        subTitle: "APP 目前处于初期开发中...",
        messageText: "https://blog.geek-cloud.top",
        assetAuthorName: "August",
        assetUrl:
            "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1580720726100&di=59e1bfbe77f2936067f3e97781330998&imgtype=0&src=http%3A%2F%2Fimg.pconline.com.cn%2Fimages%2Fupload%2Fupc%2Ftx%2Fwallpaper%2F1208%2F15%2Fc0%2F12924355_1344999165557.jpg",
        action: (context) {
//          Navigator.pushNamed(context, "/web");
        }),
    BannerPost(
        title: "抗击肺炎！",
        subTitle: "了解全国疫情最新消息",
        messageText: "数据来源：百度",
        assetAuthorName: "August",
        assetUrl:
            "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1580720892396&di=66682819f6152d78e1a6a22c2408b05c&imgtype=0&src=http%3A%2F%2Fn.sinaimg.cn%2Ftranslate%2F516%2Fw534h782%2F20200128%2F3fd9-intiarn8728876.jpg",
        action: (context) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => WebPage(
                title: "疫情时讯",
                url: "https://voice.baidu.com/act/newpneumonia/newpneumonia/?from=osari_pc_3",
              ),
            ),
          );
        }),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: NestedScrollView(
          headerSliverBuilder: _sliverBuilder,
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 4,
                ),
                buildBannerSwipe(),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: <Widget>[buildServiceCard()],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget actionMenuCard() => Card(
        elevation: 0.0,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              DashboardMenuRow(
                firstIcon: FontAwesomeIcons.solidUser,
                firstLabel: "朋友",
                firstIconCircleColor: Colors.blue,
                secondIcon: FontAwesomeIcons.userFriends,
                secondLabel: "小组",
                secondIconCircleColor: Colors.orange,
                thirdIcon: FontAwesomeIcons.mapMarkerAlt,
                thirdLabel: "附近人群",
                thirdIconCircleColor: Colors.purple,
                fourthIcon: FontAwesomeIcons.locationArrow,
                fourthLabel: "瞬间",
                fourthIconCircleColor: Colors.indigo,
              ),
              DashboardMenuRow(
                firstIcon: FontAwesomeIcons.images,
                firstLabel: "相册",
                firstIconCircleColor: Colors.red,
                secondIcon: FontAwesomeIcons.solidHeart,
                secondLabel: "喜爱",
                secondIconCircleColor: Colors.teal,
                thirdIcon: FontAwesomeIcons.solidNewspaper,
                thirdLabel: "文章",
                thirdIconCircleColor: Colors.lime,
                fourthIcon: FontAwesomeIcons.solidCommentDots,
                fourthLabel: "评论",
                fourthIconCircleColor: Colors.amber,
              ),
              DashboardMenuRow(
                firstIcon: FontAwesomeIcons.footballBall,
                firstLabel: "Sports",
                firstIconCircleColor: Colors.cyan,
                secondIcon: FontAwesomeIcons.solidStar,
                secondLabel: "Fav",
                secondIconCircleColor: Colors.redAccent,
                thirdIcon: FontAwesomeIcons.blogger,
                thirdLabel: "Blogs",
                thirdIconCircleColor: Colors.pink,
                fourthIcon: FontAwesomeIcons.wallet,
                fourthLabel: "Wallet",
                fourthIconCircleColor: Colors.brown,
              ),
            ],
          ),
        ),
      );

  Widget buildServiceCard() {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              width: 8,
              height: 30,
              color: Theme.of(context).primaryColor,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              "我的服务",
              style: TextStyle(fontSize: 18),
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
        actionMenuCard()
      ],
    );
  }

  Widget buildBannerSwipe() {
    return BannerSwiper(
      showIndicator: true,
      //width  和 height 是图片的高宽比  不用传具体的高宽   必传
      height: 100,
      width: 46,
      //轮播图数目 必传
      length: 3,
      //轮播的item  widget 必传
      getwidget: (index) {
        var bannerData = bannerList[index % bannerList.length];
        return GestureDetector(
          onTap: () {},
          child: Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Material(
              elevation: 1.5,
              borderRadius: BorderRadius.circular(8.0),
              color: Colors.transparent,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Stack(
                  children: <Widget>[
                    Image.network(
                      bannerData.assetUrl,
                      width: 400,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      color: Colors.black.withOpacity(0.4),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            bannerData.title,
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            bannerData.subTitle,
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            bannerData.messageText,
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          MaterialButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                                side: BorderSide(
                                    width: 1.5, color: Colors.white)),
                            onPressed: () {
                              bannerData.action(context);
                            },
                            child: Text(
                              "了解更多",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  List<Widget> _sliverBuilder(BuildContext context, bool innerBoxIsScrolled) {
    return <Widget>[buildAppBar()];
  }

  Widget buildAppBar() {
    return SliverAppBar(
      title: Text(
        APP_NAME,
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      elevation: 0,
      expandedHeight: 310.0,
      pinned: false,
      brightness: Brightness.dark,
      actions: <Widget>[
        IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: SearchBarDelegate());
            }),
        PopupMenuButton<Choice>(
          onSelected: (val) => val.onTap(),
          itemBuilder: (final BuildContext context) {
            return choices.map((final Choice choice) {
              return PopupMenuItem<Choice>(
                value: choice,
                child: Row(
                  children: <Widget>[
                    Text(choice.title),
                  ],
                ),
              );
            }).toList();
          },
        ),
      ],
      primary: true,
      flexibleSpace: CustomFlexibleSpaceBar(
        onImageTap: () {},
        appbarColor: Theme.of(context).backgroundColor,
        background: Stack(
          children: <Widget>[
//            Image.network(
//              "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1579795819240&di=a76686117f05bff3788ff5532a6fd196&imgtype=0&src=http%3A%2F%2Fpic1.win4000.com%2Fwallpaper%2F4%2F5743b11d203a1.jpg",
//              fit: BoxFit.cover,
//              height: 430,
//            ),
            Container(),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 82, 20, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          CircleAvatar(
                            backgroundImage: NetworkImage(
                                "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1580710514785&di=5e696c6b031c69503d8b187674c86096&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201703%2F26%2F20170326161532_aGteC.jpeg"),
                            radius: 35,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            children: <Widget>[
                              Text(
                                "尚未登陆",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                "个人签名",
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white),
                              )
                            ],
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                          ),
                        ],
                      ),
                      RaisedButton(
                        padding: EdgeInsets.all(10.0),
                        shape: CircleBorder(),
                        child: Icon(
                          Icons.code,
                          color: Colors.white,
                        ),
                        color: Color.fromARGB(50, 255, 255, 255),
                        elevation: 0,
                        onPressed: () {},
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: <Widget>[
                        getButton(
                            Column(
                              children: <Widget>[
                                Icon(
                                  Icons.rate_review,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "评论",
                                )
                              ],
                            ),
                            () {}),
                        SizedBox(
                          width: 10,
                        ),
                        getButton(
                            Column(
                              children: <Widget>[
                                Icon(
                                  Icons.star,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "收藏",
                                )
                              ],
                            ),
                            () {}),
                        SizedBox(
                          width: 10,
                        ),
                        getButton(
                            Column(
                              children: <Widget>[
                                Icon(
                                  Icons.calendar_today,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "签到",
                                )
                              ],
                            ),
                            () {}),
                        SizedBox(
                          width: 10,
                        ),
                        getButton(
                            Column(
                              children: <Widget>[
                                Icon(
                                  Icons.message,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "消息",
                                )
                              ],
                            ),
                            () {}),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Card(
                    child: Container(
                      margin: EdgeInsets.all(10),
                      child: Row(
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Icon(
                                Icons.description,
                                color: Colors.blueAccent,
                              ),
                              Text(
                                "校内头条",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 18,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              buildTouTiao("这是一个头条A------------A！"),
                              buildTouTiao("这是一个头条B---------------------b！"),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
//        bottom: TabBar(
//          labelColor: Colors.green,
//          unselectedLabelColor: Colors.grey,
//          tabs: [
//            Tab(text: '文章'),
//            Tab(text: '动态'),
//            Tab(text: '关注的话题'),
//            Tab(text: '粉丝'),
//          ],
//          controller: _tabController,
//        ),
    );
  }

  Widget buildTouTiao(final String message) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Icon(
          Icons.radio_button_checked,
          color: Colors.blueAccent,
          size: 15,
        ),
        SizedBox(
          width: 5,
        ),
        Text(message)
      ],
    );
  }

  Widget getButton(final Column content, final Function() action) {
    return RaisedButton(
      textColor: Colors.white,
      padding: EdgeInsets.all(10.0),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: content,
      color: Color.fromARGB(50, 255, 255, 255),
      elevation: 0,
      focusElevation: 0,
      highlightElevation: 0,
      onPressed: action,
    );
  }
}

class Choice {
  const Choice({this.title, this.icon, this.onTap});

  final String title;
  final IconData icon;
  final Function() onTap;
}

List<Choice> choices = <Choice>[
  Choice(title: '分享', icon: Icons.directions_boat, onTap: () {}),
  Choice(title: '查看我的资料', icon: Icons.directions_boat, onTap: () {}),
];
