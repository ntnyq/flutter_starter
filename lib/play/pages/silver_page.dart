import 'package:flutter/material.dart';

class SilverPage extends StatelessWidget {
  const SilverPage({super.key});

  Widget _buildAppBar() {
    return SliverAppBar(
      expandedHeight: 190,
      title: const Text('Flutter Starter'),
      elevation: 5,
      pinned: true,
      floating: true,
      backgroundColor: Colors.orange,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.only(
          left: 60,
          bottom: 15,
        ),
        collapseMode: CollapseMode.parallax,
        background: Image.asset(
          'assets/images/tong.jpg',
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildSilverFixedExtendList() {
    return SliverFixedExtentList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return Container(
            color: Colors.white,
            alignment: Alignment.center,
            height: 50,
            child: const Material(
              child: Text(
                'Hello world',
                style: TextStyle(
                  color: Colors.black87,
                ),
              ),
            ),
          );
        },
        childCount: 20,
      ),
      itemExtent: 60,
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        _buildAppBar(),
        _buildSilverFixedExtendList(),
      ],
    );
  }
}
