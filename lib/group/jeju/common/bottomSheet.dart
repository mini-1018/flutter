import 'package:flutter/material.dart';
import 'package:app/shared/themes/app_colors.dart';

/// 업체 선택 바텀 시트 컴포넌트
class CompanySelectBottomSheet extends StatelessWidget {
  final List<String> companyNames;
  final String selectedCompany;
  final void Function(String) onSelect;

  const CompanySelectBottomSheet({
    super.key,
    required this.companyNames,
    required this.selectedCompany,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    // 업체 개수에 따른 동적 높이 계산
    const double headerHeight = 60; // 핸들 + 타이틀 높이
    const double itemHeight = 56; // ListTile 높이
    const double dividerHeight = 1; // 구분선 높이
    const double padding = 32; // 상하 패딩

    double calculatedHeight = headerHeight +
        (itemHeight * companyNames.length) +
        (dividerHeight * (companyNames.length - 1)) +
        padding;

    // 최대 높이 제한 (화면의 80%)
    double maxHeight = MediaQuery.of(context).size.height * 0.8;
    double finalHeight =
        calculatedHeight > maxHeight ? maxHeight : calculatedHeight;

    return Container(
      height: finalHeight,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40,
            height: 4,
            margin: EdgeInsets.only(top: 12),
            decoration: BoxDecoration(
              color: grey400,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
          ),
          calculatedHeight > maxHeight
              ? Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    itemCount: companyNames.length,
                    separatorBuilder: (_, __) => const Divider(height: 1),
                    itemBuilder: (context, index) {
                      final name = companyNames[index];
                      final isSelected = name == selectedCompany;
                      return ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text(
                          name,
                          style: TextStyle(
                            color: isSelected ? primary : textPrimary,
                            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                          ),
                        ),
                        trailing: isSelected
                          ? Icon(Icons.check, color: primary)
                          : null,
                        onTap: () {
                          Navigator.pop(context);
                          onSelect(name);
                        },
                      );
                    },
                  ),
                )
              : Column(
                  children: companyNames.asMap().entries.map((entry) {
                    final index = entry.key;
                    final name = entry.value;
                    final isSelected = name == selectedCompany;
                    return Column(
                      children: [
                        if (index > 0) const Divider(height: 1),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: ListTile(
                            contentPadding: EdgeInsets.zero,
                            title: Text(
                              name,
                              style: TextStyle(
                                color: isSelected ? primary : textPrimary,
                                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                              ),
                            ),
                            trailing: isSelected
                              ? Icon(Icons.check, color: primary)
                              : null,
                            onTap: () {
                              Navigator.pop(context);
                              onSelect(name);
                            },
                          ),
                        ),
                      ],
                    );
                  }).toList(),
                ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

/// 바텀 시트 호출 함수
Future<void> showCompanySelectBottomSheet({
  required BuildContext context,
  required List<String> companyNames,
  required String selectedCompany,
  required void Function(String) onSelect,
}) async {
  await showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) => CompanySelectBottomSheet(
      companyNames: companyNames,
      selectedCompany: selectedCompany,
      onSelect: onSelect,
    ),
  );
}
