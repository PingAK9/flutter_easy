import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easy/core/config.dart';
import 'package:flutter_easy/demo/otp/login_otp_view.dart';
import 'package:flutter_icons/flutter_icons.dart';

class AccountProfile extends StatefulWidget {
  @override
  _AccountProfileState createState() => _AccountProfileState();
}

class _AccountProfileState extends State<AccountProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tài khoản'),
      ),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: ExactAssetImage('assets/images/ui/pattern.png'),
                  ),
                ),
                alignment: Alignment.center,
                child: _buildNoLogin(),
              ),
              _builtTitle('Thông tin tài khoản'.toUpperCase()),
              _buildItemCommon('Hồ sơ bênh nhận',
                  icon: Icons.supervisor_account, onTap: () {}),
              _buildItemCommon(
                'Lịch sử khám bệnh',
                icon: MaterialCommunityIcons.file_document,
              ),
              _buildItemCommon('Danh sách địa chỉ',
                  icon: MaterialCommunityIcons.map_marker_radius, onTap: () {}),
              _buildItemCommon('Kết quả khám bệnh',
                  icon: MaterialCommunityIcons.clipboard_text, hasLine: false),
              _builtTitle('Cài đặt'.toUpperCase()),
              _buildItemCommon('Nhắc lịch hẹn',
                  icon: Icons.alarm, color: Colors.green, onTap: () {}),
              _buildItemCommon(
                'Thông báo',
                icon: Icons.notifications_active,
                color: Colors.green,
                hasLine: false,
              ),
              _builtTitle('Hỗ trợ'.toUpperCase()),
              _buildItemCommon('Hotline: 1234567890',
                  icon: MaterialCommunityIcons.phone_classic,
                  color: Colors.orange,
                  onTap: () {}),
              _buildItemCommon('Hộp thư điện tử',
                  icon: Icons.email, color: Colors.orange, onTap: () {}),
              _buildItemCommon(
                'Câu hỏi thường gặp',
                icon: MaterialCommunityIcons.comment_question,
                color: Colors.orange,
              ),
              _buildItemCommon(
                'Về $kAppName',
                icon: Icons.info,
                hasLine: false,
                color: Colors.orange,
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                child: OutlineButton(
                  child: Text(
                    'Logout',
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                  onPressed: (){
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => LoginOTPView()));
                  },
                ),
              ),
              const SizedBox(height: 15),
              const Center(
                child: Text('Version: 5.3.0+2'),
              ),
              const SizedBox(height: 30)
            ]),
          ),
        ],
      ),
    );
  }

  Widget _buildItemCommon(String title,
      {IconData icon,
      Color color = Colors.blue,
      GestureTapCallback onTap,
      bool hasLine = true}) {
    return Container(
      height: 45,
      padding: const EdgeInsets.symmetric(horizontal: 30),
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            border: hasLine
                ? Border(
                    bottom: BorderSide(
                        width: 1, color: Theme.of(context).dividerColor),
                  )
                : null,
          ),
          child: Row(
            children: <Widget>[
              Icon(
                icon,
                color: color,
                size: 20,
              ),
              Expanded(
                  child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        title,
                        textAlign: TextAlign.left,
                      ))),
              Icon(
                Icons.keyboard_arrow_right,
                color: Colors.blue,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNoLogin() {
    return InkWell(
      onTap: () {
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          UserAvatar(),
          Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Đăng nhập, đăng ký',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Chào mừng bạn đến với $kAppName',
                    maxLines: 2,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _builtTitle(String title) {
    return Container(
      height: 70,
      padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
      alignment: Alignment.bottomLeft,
      child: Text(
        title,
        style: TextStyle(
            fontWeight: FontWeight.w600, fontSize: 16, color: Colors.black54),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

}

class UserAvatar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 80,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.blue.withAlpha(50),
            offset: const Offset(0, 0),
            blurRadius: 4,
          ),
        ],
      ),
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Icon(
            Icons.account_circle,
            size: 80,
            color: Colors.grey[300],
          ),
          Container(
            height: 75,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 5),
            ),
          )
        ],
      ),
    );
  }
}
