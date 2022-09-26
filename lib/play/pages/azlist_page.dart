import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lpinyin/lpinyin.dart';
import 'package:azlistview/azlistview.dart';
import 'package:flutter_starter/play/models/city.dart';
import 'package:flutter_starter/widgets/my_app_bar.dart';

class AzListPage extends StatefulWidget {
  const AzListPage({super.key});

  @override
  State<AzListPage> createState() => _AzListPageState();
}

class _AzListPageState extends State<AzListPage> {
  late List<CityModel> cityList = [];
  late List<CityModel> hotCityList = [];
  String activeCity = '';

  @override
  void initState() {
    super.initState();
    hotCityList.add(CityModel(name: '北京市', tagIndex: '★'));
    hotCityList.add(CityModel(name: '广州市', tagIndex: '★'));
    hotCityList.add(CityModel(name: '成都市', tagIndex: '★'));
    hotCityList.add(CityModel(name: '深圳市', tagIndex: '★'));
    hotCityList.add(CityModel(name: '杭州市', tagIndex: '★'));
    hotCityList.add(CityModel(name: '武汉市', tagIndex: '★'));
    cityList.addAll(hotCityList);
    SuspensionUtil.setShowSuspensionStatus(cityList);
    Future.delayed(const Duration(milliseconds: 500), () {
      loadData();
    });
  }

  loadData() async {
    rootBundle.loadString('assets/data/china.json').then((value) {
      cityList.clear();
      Map countyMap = json.decode(value);
      List list = countyMap['china'];
      for (var v in list) {
        cityList.add(CityModel.fromJson(v));
      }
      _handleList(cityList);
    });
  }

  void _handleList(List<CityModel> list) {
    if (list.isEmpty) return;
    for (int i = 0, length = list.length; i < length; i++) {
      String pinyin = PinyinHelper.getPinyinE(list[i].name);
      String tag = pinyin.substring(0, 1).toUpperCase();
      list[i].namePinyin = pinyin;
      if (RegExp('[A-Z]').hasMatch(tag)) {
        list[i].tagIndex = tag;
      } else {
        list[i].tagIndex = '#';
      }
    }
    // A-Z sort.
    SuspensionUtil.sortListBySuspensionTag(list);

    // add hotCityList.
    cityList.insertAll(0, hotCityList);

    // show sus tag.
    SuspensionUtil.setShowSuspensionStatus(cityList);

    setState(() {});
  }

  Widget header() {
    return Container(
      color: Colors.white,
      height: 44.0,
      child: Row(
        children: <Widget>[
          const Expanded(
            child: TextField(
              autofocus: false,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 10, right: 10),
                border: InputBorder.none,
                labelStyle: TextStyle(fontSize: 14, color: Color(0xFF333333)),
                hintText: '城市中文名或拼音',
                hintStyle: TextStyle(fontSize: 14, color: Color(0xFFCCCCCC)),
              ),
            ),
          ),
          Container(
            width: 0.33,
            height: 14.0,
            color: const Color(0xFFEFEFEF),
          ),
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                "取消",
                style: TextStyle(color: Color(0xFF999999), fontSize: 14),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        title: '城市选择',
      ),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            header(),
            Expanded(
              child: Material(
                child: Card(
                  clipBehavior: Clip.hardEdge,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(4.0),
                      topRight: Radius.circular(4.0),
                    ),
                  ),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(left: 15.0),
                        height: 50.0,
                        child: activeCity.isEmpty
                            ? const Text('请选择城市')
                            : Text('当前城市: $activeCity'),
                      ),
                      Expanded(
                        child: AzListView(
                          data: cityList,
                          itemCount: cityList.length,
                          itemBuilder: (BuildContext context, int index) {
                            CityModel model = cityList[index];
                            return ListTile(
                              title: Text(model.name),
                              onTap: () {
                                activeCity = model.name;
                                setState(() {});
                              },
                            );
                          },
                          padding: EdgeInsets.zero,
                          susItemBuilder: (BuildContext context, int index) {
                            CityModel model = cityList[index];
                            String tag = model.getSuspensionTag();
                            return Utils.getSusItem(context, tag);
                          },
                          indexBarData: const ['★', ...kIndexBarData],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Utils {
  static Widget getSusItem(
    BuildContext context,
    String tag, {
    double susHeight = 40,
  }) {
    if (tag == '★') {
      tag = '★ 热门城市';
    }
    return Container(
      height: susHeight,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.only(left: 16.0),
      color: const Color(0xFFF3F4F5),
      alignment: Alignment.centerLeft,
      child: Text(
        tag,
        softWrap: false,
        style: const TextStyle(
          fontSize: 14.0,
          color: Color(0xFF666666),
        ),
      ),
    );
  }
}
