import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DetailWebView extends StatefulWidget {
  const DetailWebView({Key? key, required this.siteType, required this.keyword}) : super(key: key);
  final SiteType siteType;
  final String keyword;

  @override
  State<DetailWebView> createState() => _DetailWebViewState();
}

class _DetailWebViewState extends State<DetailWebView> {
  WebViewController? _webViewController;
  final Completer<WebViewController> _completer = Completer<WebViewController>();

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "검색",
        ),
        centerTitle: true,
      ),
      body: WillPopScope(
        onWillPop: () => _goBack(context),
        child: Scaffold(
          body: WebView(
            onWebViewCreated: (WebViewController webViewController) {
              _completer.future.then((value) => _webViewController = value);
              _completer.complete(webViewController);
            },
            initialUrl: widget.siteType == SiteType.naver ?
              "https://search.naver.com/search.naver?sm=top_hty&fbm=1&ie=utf8&query=${widget.keyword}" :
                  "http://www.google.co.kr/search?complete=1&hl=ko&q=${widget.keyword}",
            javascriptMode: JavascriptMode.unrestricted,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _goBack(context);
        },
        mini: true,
        child: const Icon(
          Icons.arrow_back,
        ),
      ),
    );
  }

  Future<bool> _goBack(BuildContext context) async {
    if (_webViewController == null) {
      return true;
    }

    if (await _webViewController!.canGoBack()) {
      _webViewController!.goBack();
      return Future.value(false);
    } else {
      return Future.value(true);
    }
  }
}

enum SiteType {
  google,
  naver,
}