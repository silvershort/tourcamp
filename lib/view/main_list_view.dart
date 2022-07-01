import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:tourcamp/utilities/geo_locator_util.dart';
import 'package:tourcamp/view/widget/main_list_tile.dart';
import 'package:tourcamp/view/setting_view.dart';
import 'package:tourcamp/view_model/main_view_model.dart';

class MainListView extends StatefulWidget {
  const MainListView({Key? key}) : super(key: key);

  @override
  State<MainListView> createState() => _MainListViewState();
}

class _MainListViewState extends State<MainListView> {
  final ScrollController _scrollController = ScrollController();
  final MainViewModel _viewModel = MainViewModel();

  void _scrollToTop() {
    setState(() {
      _scrollController.jumpTo(0);
    });
  }

  void appInit() async {
    bool checkPermission = await GeoLocatorUtil.checkPermission();
    if (checkPermission) {
      _viewModel.init();
      return;
    }
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("위치 권한 허용"),
            content: const Text("주변 관광지 정보를 불러오기위해 위치 정보 권한을 켜주세요."),
            actions: [
              TextButton(
                onPressed: () {
                  GeoLocatorUtil.requestPermission().then((value) {
                    Navigator.of(context).pop();
                    if (value) {
                      _viewModel.init();
                    } else {
                      showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text("위치 권한 오류"),
                              content: const Text("위치 권한을 얻어오지 못했습니다. 앱 설청창에서 위치 정보 권한을 켜주세요."),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Geolocator.openAppSettings();
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text(
                                    "확인",
                                  ),
                                ),
                              ],
                            );
                          });
                    }
                  });
                },
                child: const Text(
                  "확인",
                ),
              ),
            ],
          );
        });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MainViewModel>(
      create: (context) {
        appInit();
        return _viewModel;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("투어캠△"),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: IconButton(
                  icon: const Icon(
                    Icons.settings,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (materialContext) {
                        return ChangeNotifierProvider.value(
                          value: _viewModel,
                          child: SettingView(),
                        );
                      }),
                    ).then((value) {
                      if (_viewModel.settingChanged) {
                        _viewModel.resetData();
                      }
                    });
                  }),
            )
          ],
        ),
        body: Center(
          child: Consumer<MainViewModel>(
            builder: (context, viewModel, _) {
              if (viewModel.locationBaseList.isEmpty) {
                if (viewModel.error) {
                  // 데이터를 가져오는데 실패했을때
                  return const Text(
                    '데이터 로드 실패',
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  );
                } else {
                  return const CircularProgressIndicator();
                }
              } else {
                return _buildListView(viewModel);
              }
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _scrollToTop();
          },
          mini: true,
          child: const Icon(
            Icons.keyboard_arrow_up,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildListView(MainViewModel viewModel) {
    return ListView.separated(
      controller: _scrollController,
      padding: const EdgeInsets.only(top: 1.0),
      itemCount: viewModel.locationBaseList.length + 1,
      itemBuilder: (context, index) {
        if (index < viewModel.locationBaseList.length) {
          return MainListTile(item: viewModel.locationBaseList[index]);
        }

        if (!viewModel.loading) {
          Future.microtask(() => viewModel.fetchLocationBase());
        }

        return const Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0),
          child: Center(child: CircularProgressIndicator()),
        );
      },
      separatorBuilder: (context, index) {
        return const Divider(
          color: Colors.white,
          height: 1.0,
        );
      },
    );
  }
}
