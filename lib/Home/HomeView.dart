// ignore_for_file: file_names, depend_on_referenced_packages
import 'dart:ui';
import 'package:card_swiper/card_swiper.dart';
import 'dart:developer';
import '../Components/tm_tabbar.dart';
import 'package:flutter/material.dart';
import 'HomeDesign.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);
  final bannerData = [
    "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fhbimg.b0.upaiyun.com%2Fe8b8a8a62e94ebe04d2b8c52beeb93c1ab7046f4157aa-YQKppb_fw658&refer=http%3A%2F%2Fhbimg.b0.upaiyun.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1665714182&t=370183ce7af02ee267bef935fafb2c96",
    "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fp2-q.mafengwo.net%2Fs11%2FM00%2FB6%2F7B%2FwKgBEFt_tvGAFvHxAAFIRKQnOBw21.jpeg&refer=http%3A%2F%2Fp2-q.mafengwo.net&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1665714251&t=df8655e293255c8dcb5cd65631b17781",
    "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fwww.tupkaeksunset.com%2Ffiles%2F5314%2F2105%2F5040%2FIMG_3660.jpg&refer=http%3A%2F%2Fwww.tupkaeksunset.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1665714411&t=b7d599e46cee0ecc63eca5887bae0455"
  ];
  @override
  State<StatefulWidget> createState() => HomeViewState();
}

class HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  Container banner = Container();
  var searchBar = Container();
  late TabController _tabController;
  double viewportFraction = 2.94;
  void tabTap(index) {
    viewportFraction = index == 0 ? 2.94 : 1.0;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    banner = Container(
        width: MediaQueryData.fromWindow(window)
            .size
            .width, //MediaQuery.of(context).size.width,
        height: 200,
        margin: const EdgeInsets.fromLTRB(0, 0, 0, 32),
        child: Swiper(
          itemBuilder: (BuildContext context, int index) {
            return Image.network(
              widget.bannerData[index],
              fit: BoxFit.fill,
            );
          },
          autoplay: true,
          itemCount: 3,
          onTap: (index) {
            log('$index');
          },
          pagination: const SwiperPagination(
              margin: EdgeInsets.only(bottom: 24, right: 12),
              alignment: Alignment.bottomRight,
              builder: DotSwiperPaginationBuilder(
                  activeColor: Colors.black45, space: 4, size: 6)),
        ));

    searchBar = Container(
        margin: const EdgeInsets.fromLTRB(20, 0, 20, 8),
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
        height: 36,
        decoration: const BoxDecoration(
            color: Color.fromRGBO(238, 238, 238, 1),
            borderRadius: BorderRadius.horizontal(
                left: Radius.circular(30), right: Radius.circular(30))),
        child: InkWell(
            onTap: () {
              log('message');
            },
            child: Row(children: const [
              Icon(
                Icons.search,
                color: Color.fromARGB(255, 158, 158, 158),
                size: 14,
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                '请输入搜索内容',
                style: TextStyle(
                    color: Color.fromARGB(2550, 158, 158, 158), fontSize: 14),
              )
            ])));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: searchBar,
        elevation: 0,
        backgroundColor: const Color.fromRGBO(238, 238, 238, 1),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            elevation: 0,
            expandedHeight: 254,
            toolbarHeight: 0,
            flexibleSpace: FlexibleSpaceBar(
              background: banner,
            ),
            bottom: TMTabbar(
                height: 54,
                child: Container(
                  height: 54,
                  padding: const EdgeInsets.fromLTRB(0, 0, 240, 0),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(16),
                          topLeft: Radius.circular(16)),
                      color: Colors.white),
                  child: TabBar(
                    indicator: TMTabbarIndicator(),
                    indicatorWeight: 5,
                    indicatorColor: Colors.black,
                    indicatorSize: TabBarIndicatorSize.label,
                    labelColor: Colors.black,
                    controller: _tabController,
                    isScrollable: false,
                    unselectedLabelColor: Colors.grey,
                    labelStyle: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 20),
                    unselectedLabelStyle: const TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 20),
                    tabs: const [
                      Tab(text: '主页'),
                      Tab(text: '推荐'),
                    ],
                    onTap: (value) {
                      log('$value');
                      tabTap(value);
                    },
                  ),
                )),
          ),
          // SliverPersistentHeader(
          //   // 可以吸顶的TabBar
          //   pinned: true,
          //   delegate: StickyTabBarDelegate(
          //     // ignore: sized_box_for_whitespace
          //     child: Container(
          //       height: 48,
          //       color: Colors.white,
          //       padding: const EdgeInsets.fromLTRB(0, 0, 240, 0),
          //       child: TabBar(
          //         indicator: TMTabbarIndicator(),
          //         indicatorWeight: 5,
          //         indicatorColor: Colors.black,
          //         splashBorderRadius: BorderRadius.circular(3),
          //         indicatorSize: TabBarIndicatorSize.label,
          //         labelColor: Colors.black,
          //         controller: _tabController,
          //         isScrollable: false,
          //         unselectedLabelColor: Colors.grey,
          //         labelStyle: const TextStyle(
          //             fontWeight: FontWeight.w600, fontSize: 20),
          //         unselectedLabelStyle: const TextStyle(
          //             fontWeight: FontWeight.w500, fontSize: 20),
          //         tabs: const [
          //           Tab(text: '设计'),
          //           Tab(text: '推荐'),
          //         ],
          //       ),
          //     ),
          //   ),
          // ),
          SliverFillViewport(
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              //创建列表项
              return TabBarView(
                controller: _tabController,
                children: [
                  Container(
                    height: Colors.primaries.length * 100 + 114,
                    color: Colors.white,
                    child: const HomeDesign(),
                  ),
                  const Center(child: Text('Content of Profile')),
                ],
              );
            }, childCount: 1),
            //占屏幕的比例
            viewportFraction: viewportFraction,
          ),
        ],
      ),
    );
  }
}

class StickyTabBarDelegate extends SliverPersistentHeaderDelegate {
  final Container child;

  StickyTabBarDelegate({required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  double get maxExtent => child.constraints?.maxHeight ?? 0;

  @override
  double get minExtent => child.constraints?.maxHeight ?? 0;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}

// ignore: must_be_immutable
class TMTabbar extends StatefulWidget implements PreferredSizeWidget {
  Widget child;
  double height = 0;
  // TMTabbar({Key? key}) : super(key: key);
  TMTabbar({Key? key, required this.child, required this.height})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return TMTabbarState();
  }

  @override
  Size get preferredSize =>
      Size(MediaQueryData.fromWindow(window).size.width, height);
}

class TMTabbarState extends State<TMTabbar> {
  @override
  Widget build(Object context) {
    return widget.child;
  }
}
