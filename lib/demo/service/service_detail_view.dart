import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easy/core/config.dart';
import 'package:flutter_easy/core/utility.dart';
import 'package:flutter_easy/demo/service/service.dart';
import 'package:flutter_easy/demo/service/service_benefit.dart';
import 'package:flutter_easy/demo/service/service_blood_test.dart';
import 'package:flutter_easy/demo/service/service_provider.dart';
import 'package:flutter_easy/pages/block/block_shadow.dart';
import 'package:flutter_easy/ui/utility/html_content.dart';
import 'package:flutter_easy/ui/utility/indicator.dart';
import 'package:provider/provider.dart';

class ServiceDetailView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ServiceProvider(0),
      child: Consumer<ServiceProvider>(
        builder: (context, provider, child) {
          if (provider.currentService.isLoadFinish() == false) {
            return Scaffold(
              appBar: AppBar(
                title: const Text('Service'),
              ),
              body: const Center(
                child: Indicator(),
              ),
            );
          } else {
            return _ServiceDetailChild(provider.currentService.data);
          }
        },
      ),
    );
  }
}

class _ServiceDetailChild extends StatefulWidget {
  const _ServiceDetailChild(this.data);

  final Service data;

  @override
  _ServiceDetailChildState createState() => _ServiceDetailChildState();
}

class _ServiceDetailChildState extends State<_ServiceDetailChild> {
  @override
  void initState() {
    super.initState();
  }

  void _onClickRegister() {
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Service'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          )
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        elevation: 0,
        child: Container(
          padding:
              EdgeInsets.symmetric(vertical: 8, horizontal: defaultPadding),
          width: double.infinity,
          child: RaisedButton(
            child: const Text(
              'Đặt lịch hẹn',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: _onClickRegister,
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: Provider.of<ServiceProvider>(context).loadCurrentService,
        child: CustomScrollView(
          physics: const ClampingScrollPhysics(),
          slivers: <Widget>[
            SliverList(
              delegate: SliverChildListDelegate([
                Container(
                  height: 140,
                  child: Image.asset(
                    widget.data.image,
                    fit: BoxFit.cover,
                  ),
                ),
                Baseline(
                  baseline: 0,
                  baselineType: TextBaseline.alphabetic,
                  child: BlockShadow(
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          widget.data.title,
                          style: Theme.of(context).textTheme.title,
                        ),
                        const SizedBox(height: 5),
                        Text(
                          widget.data.description,
                        ),
                        const SizedBox(height: 10),
                        RichText(
                          textAlign: TextAlign.left,
                          text: TextSpan(children: [
                            TextSpan(
                                text: 'Giá dịch vụ: ',
                                style: TextStyle(color: Colors.grey)),
                            TextSpan(
                              text:
                                  '${Utility.formatPrice(widget.data.price)} đ',
                              style: Theme.of(context)
                                  .textTheme
                                  .title
                                  .merge(TextStyle(color: Colors.red)),
                            )
                          ]),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: <Widget>[
                      _buildTitle('THÔNG TIN CHUNG'),
                      _buildInfo(),
                      _buildTitle('TÍN NĂNG'),
                      Column(
                        children:
                            widget.data.feature.map(_buildFeatureItem).toList(),
                      ),
                      _buildTitle('Điều gì giúp bạn khi chọn dịch vụ này?'
                          .toUpperCase()),
                      Column(
                        children: widget.data.benefits
                            .map(_buildBenefitItem)
                            .toList(),
                      ),
                      _buildTitle('Quy trình'.toUpperCase()),
                      Column(
                        children: <Widget>[
                          for (int i = 0; i < widget.data.process.length; i++)
                            _buildProcessItem(i, widget.data.process[i]),
                        ],
                      ),
                      _buildTitle('THÔNG TIN SẢN PHẨM'.toUpperCase()),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(widget.data.description),
                      ),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 15),
                        child: Text(
                          'Nội dung xét nghiệm',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                      ),
                      Column(
                        children: <Widget>[
                          for (int i = 0; i < widget.data.bloodTest.length; i++)
                            _buildBloodTestItem(i, widget.data.bloodTest[i]),
                        ],
                      ),
                      _buildNotice(),
                    ],
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle(String text) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 30, bottom: 20),
      child: Text(
        text,
        textAlign: TextAlign.left,
        style: Theme.of(context)
            .textTheme
            .title
            .merge(TextStyle(color: Colors.black54)),
      ),
    );
  }

  Widget _buildFeatureItem(String item) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 3, right: 10),
            child: Icon(
              Icons.lens,
              size: 10,
              color: Colors.blue,
            ),
          ),
          Expanded(child: Text(item)),
        ],
      ),
    );
  }

  final List<Color> colors = [
    Colors.blue,
    Colors.green,
    Colors.orange,
    Colors.purple
  ];

  Widget _buildProcessItem(int index, String item) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(top: 3, right: 15),
              width: 28,
              child: Column(
                children: <Widget>[
                  Container(
                    width: 28,
                    height: 28,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: colors[index % 4]),
                    alignment: Alignment.center,
                    child: Text(
                      index.toString(),
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Colors.white),
                    ),
                  ),
                  if (index != (widget.data.process.length - 1))
                    Expanded(
                      child: Container(
                        width: 1,
                        color: Colors.grey[300],
                      ),
                    ),
                ],
              ),
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Text(item),
            )),
          ],
        ),
      ),
    );
  }

  Widget _buildBloodTestItem(int index, ServiceBloodTest item) {
    return Theme(
      data:
          ThemeData(dividerColor: Colors.transparent, accentColor: Colors.blue),
      child: ExpansionTile(
        title: Text(
          item.title,
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
        ),
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              item.description,
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBenefitItem(ServiceBenefit item) {
    const radius = Radius.circular(10);
    return Padding(
      padding: const EdgeInsets.only(left: 20, bottom: 10),
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.fromLTRB(15, 10, 25, 10),
            margin: const EdgeInsets.only(right: 25),
            decoration: BoxDecoration(
                color: Colors.lightBlue[100],
                borderRadius: const BorderRadius.only(
                    topLeft: radius, topRight: radius, bottomRight: radius)),
            child: HtmlContent(item.description),
          ),
          Positioned(
            right: 0,
            child: Container(
              width: 50,
              height: 50,
              child: Image.asset('assets/images/service/${item.icon}'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNotice() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 40),
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
      decoration: BoxDecoration(
          color: const Color(0xFFF6FAFF),
          borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: <Widget>[
          _buildTitle('LƯU Ý'),
          for (String item in widget.data.notices)
            Padding(
              padding: const EdgeInsets.only(left: 10, bottom: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 3, right: 10),
                    child: Icon(
                      Icons.lens,
                      size: 10,
                      color: Colors.blue,
                    ),
                  ),
                  Expanded(child: Text(item)),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildInfo() {
    return Row(
      children: <Widget>[
        _buildIconItem('Dành cho mọi đối tượng',
            icon: Icons.group, color: const Color(0xFFEBFBF2)),
        const SizedBox(width: 15),
        _buildIconItem('Lứa tuổi không giới hạn',
            icon: Icons.timeline, color: const Color(0xFFFFF6E6)),
        const SizedBox(width: 15),
        _buildIconItem('${widget.data.bloodTest.length} hạng mục xét nghiệm',
            icon: Icons.opacity, color: const Color(0xFFF2F3FF)),
      ],
    );
  }

  Widget _buildIconItem(String title, {IconData icon, Color color}) {
    return Expanded(
      flex: 1,
      child: Container(
        height: 100,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: Icon(
                icon,
                size: 26,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              title,
              textAlign: TextAlign.center,
              maxLines: 2,
              style: Theme.of(context).textTheme.subtitle,
            ),
          ],
        ),
      ),
    );
  }
}
