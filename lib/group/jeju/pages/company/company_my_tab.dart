import 'package:app/group/jeju/common/bottomSheet.dart';
import 'package:app/group/jeju/common/mainContentTitle.dart';
import 'package:flutter/material.dart';
import 'package:app/shared/themes/app_colors.dart';

class CompanyMyTab extends StatefulWidget {
  const CompanyMyTab({super.key});

  @override
  State<CompanyMyTab> createState() => _CompanyMyTabState();
}

class _CompanyMyTabState extends State<CompanyMyTab> {
  String id = 'gtech21';
  int selectedCompanyIndex = -1;

  final List<Map<String, String>> companyData = [
    {
      'name': '지테크치킨',
      'owner': '홍길동',
      'phone': '010-1234-5678',
      'address': '서울특별시 강남구 테헤란로 123',
      'tagInfo': 'J0000000',
      'cardInfo': '삼성카드',
    },
    {
      'name': '길동치킨',
      'owner': '김철수',
      'phone': '010-9876-5432',
      'address': '서울특별시 종로구 종로 456',
      'tagInfo': 'J0000000',
      'cardInfo': '신한카드',
    },
    {
      'name': '네네치킨',
      'owner': '이영희',
      'phone': '010-1111-2222',
      'address': '서울특별시 마포구 홍대로 789',
      'tagInfo': 'J0000000',
      'cardInfo': '현대카드',
    },
  ];

  void onSelect(String selectedCompany) {
    setState(() {
      selectedCompanyIndex = companyData.indexWhere((company) => company['name'] == selectedCompany);
    });
  }

  @override
  void initState() {
    super.initState();
    // 업체가 1개뿐이면 자동으로 선택
    if (companyData.length == 1) {
      selectedCompanyIndex = 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          MainContentTitle(title: '마이페이지'),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 18.5),
            decoration: BoxDecoration(
              color: grey300,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                _buildInfoRow('ID', id),
                SizedBox(height: 14),
                _buildInfoRow('업체명', selectedCompanyIndex == -1 ? '업체를 선택해주세요' : companyData[selectedCompanyIndex]['name']!),
                // 업체가 선택되었을 때
                if (selectedCompanyIndex != -1) ...[
                  SizedBox(height: 14),
                  _buildInfoRow('대표자', companyData[selectedCompanyIndex]['owner']!),
                  SizedBox(height: 14),
                  _buildInfoRow('연락처', companyData[selectedCompanyIndex]['phone']!),
                  SizedBox(height: 14),
                  _buildInfoRow('업체주소', companyData[selectedCompanyIndex]['address']!),
                  SizedBox(height: 14),
                  _buildInfoRow('태그정보', companyData[selectedCompanyIndex]['tagInfo']!),
                  SizedBox(height: 14),
                  _buildInfoRow('카드정보', companyData[selectedCompanyIndex]['cardInfo']!),
                ],
              ],
            ),
          ),
          const SizedBox(height: 20),
          _buildLogoutButton(context),
          const SizedBox(height: 20,)
        ],
      ),
    );
  }

  Widget _buildCompanyNameWidget(String value) {
    if (companyData.length <= 1) {
      return Text(
        value,
        textAlign: TextAlign.end,
        style: TextStyle(
          fontSize: 16,
          color: textPrimary,
          fontWeight: FontWeight.bold,
        ),
        maxLines: null,
        overflow: TextOverflow.visible,
        softWrap: true,
      );
    }
    
    return GestureDetector(
      onTap: () => showCompanySelectBottomSheet(
        context: context,
        companyNames: companyData.map((company) => company['name']!).toList(),
        selectedCompany: selectedCompanyIndex == -1 ? '' : companyData[selectedCompanyIndex]['name']!,
        onSelect: onSelect
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Text(
              value,
              textAlign: TextAlign.end,
              style: TextStyle(
                fontSize: 16,
                color: textPrimary,
                fontWeight: FontWeight.bold,
              ),
              maxLines: null,
              overflow: TextOverflow.ellipsis,
              softWrap: true,
            ),
          ),
          const SizedBox(width: 8),
          Icon(
            Icons.keyboard_arrow_down,
            color: textPrimary,
            size: 20,
          ),
        ],
      ),
    );
  }

  Widget _buildValueText(String value) {
    return Text(
      value,
      textAlign: TextAlign.end,
      style: TextStyle(
        fontSize: 16,
        color: textPrimary,
        fontWeight: FontWeight.bold,
      ),
      maxLines: null,
      overflow: TextOverflow.visible,
      softWrap: true,
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Container(
      width: 255,
      constraints: BoxConstraints(minHeight: 55),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            child: Text(
              label,
              style: TextStyle(
                fontSize: 16,
                color: textPrimary,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: label == '업체명' 
                ? _buildCompanyNameWidget(value)
                : _buildValueText(value),
          ),
        ],
      ),
    );
  }

  Widget _buildLogoutButton(context) {
    return GestureDetector(
      onTap: () {
        // 로그아웃 로직 추가예정
        Navigator.pushReplacementNamed(context, '/');
      },
      child: Container(
        width: 120,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: grey400),
        ),
        child: Center(
          child: Text(
            '로그아웃',
            style: TextStyle(fontSize: 16, color: textPrimary),
          ),
        ),
      ),
    );
  }
}
