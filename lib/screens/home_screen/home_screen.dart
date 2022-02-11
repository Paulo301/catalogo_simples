import 'package:catalogo_simples/screens/home_screen/tabs/more/more_tab_widget.dart';
import 'package:catalogo_simples/screens/home_screen/tabs/home/home_tab_widget.dart';
import 'package:catalogo_simples/screens/home_screen/tabs/search/search_tab_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: const Color(0xFF011627),
        body: const SafeArea(
          child: TabBarView(
            children: [
              HomeTabWidget(),
              SearchTabWidget(),
              MoreTabWidget(),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          color: const Color(0x33070600),
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.7,
            height: MediaQuery.of(context).size.width * 0.2,
            child: Theme(
              data: ThemeData(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
              ),
              child: const TabBar(
                indicator: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x3323B5D3),
                      blurRadius: 10.0,
                      spreadRadius: 0.1,
                    ),
                  ],
                ),
                indicatorSize: TabBarIndicatorSize.label,
                tabs: [
                  Tab(icon: Icon(Icons.home_outlined, size: 35)),
                  Tab(icon: Icon(Icons.search_outlined, size: 35)),
                  Tab(icon: Icon(Icons.more_horiz_outlined, size: 35)),
                ],
                labelColor: Color(0xFF23B5D3),
                unselectedLabelColor: Color(0xFFF7F7FF),
              ),
            ),
          ),
        ),
      ),
    );
  }
}