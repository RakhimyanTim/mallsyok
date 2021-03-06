import 'package:flutter/material.dart';
import 'package:mallsyok/res/app_config.dart';
import 'package:mallsyok/model/mall.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mallsyok/screen/mall_list_screen.dart';
import 'package:mallsyok/screen/outlet_list_screen.dart';
import 'package:mallsyok/screen/promotion_screen.dart';
import 'package:mallsyok/screen/mall_details_screen.dart';
import 'package:mallsyok/screen/direction_screen.dart';

class PlatformDrawer extends StatelessWidget {
  final Mall mall;

  const PlatformDrawer({Key key, this.mall}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                mall.mallName,
                style: new TextStyle(
                  fontSize: 30.0,
                  color: Colors.white,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: kAppThemeColor,
            ),
          ),
          ListTile(
            title: Text(AppConfig.TEXT_CHANGE_MALL),
            leading: const Icon(
              FontAwesomeIcons.exchangeAlt,
            ),
            onTap: () {
              Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => MallListScreen()));
            },
          ),
          Divider(),
          ListTile(
            title: Text(AppConfig.TEXT_PROMOTION),
            leading: const Icon(
              FontAwesomeIcons.tags,
            ),
            onTap: () {
              Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => PromotionScreen(mall: mall,)));
            },
          ),
          Divider(),
          ListTile(
            title: Text(AppConfig.TEXT_STORE_DIRECTORY),
            leading: const Icon(
              FontAwesomeIcons.mapSigns,
            ),
            onTap: () {
              Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) =>
                      OutletListPage(mall: mall)));
            },
          ),
          Divider(),
          ListTile(
            title: Text(AppConfig.TEXT_GETTING_THERE),
            leading: const Icon(
              FontAwesomeIcons.mapMarkedAlt,
            ),
            onTap: () {
              Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => DirectionScreen(mall: mall)));

            },
          ),
          Divider(),
          ListTile(
            title: Text(AppConfig.TEXT_CONTACT_US),
            leading: const Icon(
              FontAwesomeIcons.envelope,
            ),
            onTap: () {
              Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => MallDetailsScreen(mall: mall,)));
            },
          ),
          Divider(),
          new Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                AppConfig.APP_VERSION,
                style: new TextStyle(color: Colors.black45, fontSize: 15.0),
              ),
            ),
          )
        ],
      ),
    );
  }
}
