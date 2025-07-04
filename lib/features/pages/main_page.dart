import 'package:flutter/material.dart';
import 'package:app/shared/themes/app_colors.dart';
import 'package:app/shared/widgets/custom_app_bar.dart';
import 'package:app/shared/widgets/quick_action_button.dart';
import 'package:app/features/widgets/feature_card.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  final List<String> _titles = ['홈', '탐색', '알림', '프로필'];

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: CustomAppBar(
      title: _titles[_selectedIndex],
      actions: [
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
            // 검색 기능
          },
        ),
        IconButton(
          icon: const Icon(Icons.notifications_outlined),
          onPressed: () {
            // 알림 기능
          },
        ),
      ],
    ),
    body: _buildBody(),
    bottomNavigationBar: _buildBottomNavigationBar(),
    floatingActionButton: _selectedIndex == 0
        ? FloatingActionButton(
      onPressed: () {
        _showAddDialog();
      },
      child: const Icon(Icons.add),
      backgroundColor: AppColors.primary,
    )
        : null,
  );
}

Widget _buildBody() {
  switch (_selectedIndex) {
    case 0:
      return _buildHomePage();
    case 1:
      return _buildExplorePage();
    case 2:
      return _buildNotificationPage();
    case 3:
      return _buildProfilePage();
    default:
      return _buildHomePage();
  }
}

Widget _buildHomePage() {
  return SingleChildScrollView(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 환영 메시지
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColors.primary, AppColors.primary],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '안녕하세요! 👋',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '오늘도 좋은 하루 되세요',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.9),
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.star,
                  color: Colors.white,
                  size: 28,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 24),

        // 빠른 액션 버튼들
        Text(
          '빠른 실행',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 16),

        Row(
          children: [
            Expanded(
              child: QuickActionButton(
                icon: Icons.camera_alt,
                label: '카메라',
                color: AppColors.success,
                onTap: () => _handleQuickAction('카메라'),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: QuickActionButton(
                icon: Icons.location_on,
                label: '위치',
                color: AppColors.warning,
                onTap: () => _handleQuickAction('위치'),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: QuickActionButton(
                icon: Icons.qr_code_scanner,
                label: 'QR 스캔',
                color: AppColors.info,
                onTap: () => _handleQuickAction('QR 스캔'),
              ),
            ),
          ],
        ),

        const SizedBox(height: 24),

        // 기능 카드들
        Text(
          '주요 기능',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 16),

        FeatureCard(
          title: '데이터 분석',
          subtitle: '실시간 데이터를 확인하고 분석하세요',
          icon: Icons.analytics,
          color: AppColors.primary,
          onTap: () => _handleFeatureAction('데이터 분석'),
        ),

        const SizedBox(height: 12),

        FeatureCard(
          title: '설정 관리',
          subtitle: '앱 설정을 관리하고 개인화하세요',
          icon: Icons.settings,
          color: AppColors.secondary,
          onTap: () => _handleFeatureAction('설정 관리'),
        ),

        const SizedBox(height: 12),

        FeatureCard(
          title: '도움말',
          subtitle: '사용법과 자주 묻는 질문을 확인하세요',
          icon: Icons.help,
          color: AppColors.success,
          onTap: () => _handleFeatureAction('도움말'),
        ),
      ],
    ),
  );
}

Widget _buildExplorePage() {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.explore,
          size: 64,
          color: AppColors.grey300,
        ),
        const SizedBox(height: 16),
        Text(
          '탐색 페이지',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: 8),
        Text(
          '새로운 콘텐츠를 발견해보세요',
          style: TextStyle(color: AppColors.textPrimary),
        ),
      ],
    ),
  );
}

Widget _buildNotificationPage() {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.notifications,
          size: 64,
          color: AppColors.grey300,
        ),
        const SizedBox(height: 16),
        Text(
          '알림 페이지',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: 8),
        Text(
          '새로운 알림이 없습니다',
          style: TextStyle(color: AppColors.textPrimary),
        ),
      ],
    ),
  );
}

Widget _buildProfilePage() {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 40,
          backgroundColor: AppColors.primary,
          child: Icon(
            Icons.person,
            size: 40,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          '사용자 프로필',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: 8),
        Text(
          'user@example.com',
          style: TextStyle(color: AppColors.textPrimary),
        ),
      ],
    ),
  );
}

Widget _buildBottomNavigationBar() {
  return BottomNavigationBar(
    type: BottomNavigationBarType.fixed,
    currentIndex: _selectedIndex,
    onTap: (index) {
      setState(() {
        _selectedIndex = index;
      });
    },
    selectedItemColor: AppColors.primary,
    unselectedItemColor: AppColors.grey300,
    items: const [
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: '홈',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.explore),
        label: '탐색',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.notifications),
        label: '알림',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.person),
        label: '프로필',
      ),
    ],
  );
}

void _handleQuickAction(String action) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text('$action 기능이 실행되었습니다'),
      backgroundColor: AppColors.success,
    ),
  );
}

void _handleFeatureAction(String feature) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(feature),
      content: Text('$feature 기능을 구현해보세요!'),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('확인'),
        ),
      ],
    ),
  );
}

void _showAddDialog() {
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (context) => Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: AppColors.grey300,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            '새로 만들기',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          ListTile(
            leading: Icon(Icons.note_add, color: AppColors.primary),
            title: const Text('메모 작성'),
            onTap: () {
              Navigator.pop(context);
              _handleQuickAction('메모 작성');
            },
          ),
          ListTile(
            leading: Icon(Icons.photo_camera, color: AppColors.success),
            title: const Text('사진 촬영'),
            onTap: () {
              Navigator.pop(context);
              _handleQuickAction('사진 촬영');
            },
          ),
          ListTile(
            leading: Icon(Icons.videocam, color: AppColors.warning),
            title: const Text('동영상 촬영'),
            onTap: () {
              Navigator.pop(context);
              _handleQuickAction('동영상 촬영');
            },
          ),
        ],
      ),
    ),
  );
}
}