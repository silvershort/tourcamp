import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tourcamp/view/license_view.dart';
import 'package:tourcamp/view_model/main_view_model.dart';

class SettingView extends StatelessWidget {
  SettingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "설정",
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Text(
              "- 검색 반경 설정(KM) : ${context
                  .watch<MainViewModel>()
                  .radius
                  .round()}",
              style: const TextStyle(
                fontSize: 18.0,
              ),
            ),
            SizedBox(height: 10),
            FractionallySizedBox(
              widthFactor: 0.9,
              child: Slider(
                value: context
                    .watch<MainViewModel>()
                    .radius,
                min: 1,
                max: 50,
                onChanged: (value) {
                  context.read<MainViewModel>().setRadius(value);
                },
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "- 검색 할 관광지 타입",
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            const SizedBox(height: 10),
            GridView.builder(
              itemCount: context
                  .watch<MainViewModel>()
                  .settingList
                  .length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 5 / 1,
              ),
              itemBuilder: (context, index) {
                return Container(
                  alignment: Alignment.center,
                  child: InkWell(
                    child: Row(
                      children: [
                        Checkbox(
                          value: context
                              .watch<MainViewModel>()
                              .settingList[index].value,
                          onChanged: (value) {
                            context.read<MainViewModel>().setSettingCheckData(index, value ?? true);
                          },
                        ),
                        Text(
                          context
                              .watch<MainViewModel>()
                              .settingList[index].kor,
                          style: const TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    ),
                    onTap: () {
                      context.read<MainViewModel>().setSettingCheckData(index, !context
                          .read<MainViewModel>()
                          .settingList[index].value);
                    },
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            const Text(
              "- 어플 및 라이센스 정보",
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            const SizedBox(height: 10),
            FractionallySizedBox(
              widthFactor: 1,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const LicenseView();
                  }));
                },
                child: const Text(
                  "오픈소스 라이센스",
                  style: TextStyle(
                    fontSize: 14.0,
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
