import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constants/app_colors.dart';

class HistoryTab extends StatefulWidget {
  const HistoryTab({super.key});

  @override
  State<HistoryTab> createState() => _HistoryTabState();
}

class _HistoryTabState extends State<HistoryTab> {
  final String _selectedMonth = 'September 2026';

  final List<Map<String, dynamic>> _historyLogs = [
    {
      'date': 'Kamis, 24 Sep 2026',
      'shift': 'Shift Pagi (07:00-14:00)',
      'masuk': '07:31',
      'pulang': '--:--',
      'status': 'Masuk Tepat Waktu',
      'statusType': 'success',
    },
    {
      'date': 'Rabu, 23 Sep 2026',
      'shift': 'Shift Pagi (07:00-14:00)',
      'masuk': '07:15',
      'pulang': '16:04',
      'status': 'Lengkap',
      'statusType': 'complete',
    },
    {
      'date': 'Selasa, 22 Sep 2026',
      'shift': 'Shift Pagi (07:00-14:00)',
      'masuk': '08:05',
      'pulang': '16:00',
      'status': 'Terlambat 5m',
      'statusType': 'warning',
    },
    {
      'date': 'Senin, 21 Sep 2026',
      'shift': 'Shift Pagi (07:00-14:00)',
      'masuk': '07:20',
      'pulang': '16:01',
      'status': 'Lengkap',
      'statusType': 'complete',
    },
    {
      'date': 'Jumat, 18 Sep 2026',
      'shift': 'Dinas Luar (Dinkes Jember)',
      'masuk': '08:14',
      'pulang': '16:30',
      'status': 'Dinas Luar',
      'statusType': 'dinas',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header title
          Text(
            'Riwayat Presensi Pegawai',
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.onSurface,
            ),
          ),
          Text(
            'Rekapitulasi absensi bulanan RSD dr. Soebandi',
            style: GoogleFonts.poppins(
              fontSize: 12,
              color: AppColors.onSurfaceVariant,
            ),
          ),

          const SizedBox(height: 16),

          // 1. Monthly Summary Cards (3 Columns)
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    color: AppColors.surfaceContainerLowest,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: AppColors.outlineVariant.withValues(alpha: 0.3),
                    ),
                  ),
                  child: Column(
                    children: [
                      Text(
                        '22',
                        style: GoogleFonts.poppins(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary,
                        ),
                      ),
                      Text(
                        'Hadir',
                        style: GoogleFonts.poppins(
                          fontSize: 11,
                          color: AppColors.outline,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    color: AppColors.surfaceContainerLowest,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: AppColors.outlineVariant.withValues(alpha: 0.3),
                    ),
                  ),
                  child: Column(
                    children: [
                      Text(
                        '1',
                        style: GoogleFonts.poppins(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: AppColors.error,
                        ),
                      ),
                      Text(
                        'Terlambat',
                        style: GoogleFonts.poppins(
                          fontSize: 11,
                          color: AppColors.outline,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    color: AppColors.surfaceContainerLowest,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: AppColors.outlineVariant.withValues(alpha: 0.3),
                    ),
                  ),
                  child: Column(
                    children: [
                      Text(
                        '0',
                        style: GoogleFonts.poppins(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: AppColors.secondary,
                        ),
                      ),
                      Text(
                        'Izin / Cuti',
                        style: GoogleFonts.poppins(
                          fontSize: 11,
                          color: AppColors.outline,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Filter bar
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: AppColors.surfaceContainerLow,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: AppColors.outlineVariant.withValues(alpha: 0.3),
                  ),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.calendar_today,
                      size: 14,
                      color: AppColors.primary,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      _selectedMonth,
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: AppColors.onSurface,
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Icon(
                      Icons.arrow_drop_down,
                      size: 18,
                      color: AppColors.outline,
                    ),
                  ],
                ),
              ),
              OutlinedButton.icon(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                ),
                icon: const Icon(Icons.filter_list, size: 16),
                label: Text(
                  'Filter',
                  style: GoogleFonts.poppins(fontSize: 12),
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Log items list
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _historyLogs.length,
            separatorBuilder: (context, index) => const SizedBox(height: 10),
            itemBuilder: (context, index) {
              final log = _historyLogs[index];
              return _buildHistoryCard(log);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildHistoryCard(Map<String, dynamic> log) {
    Color badgeBg;
    Color badgeText;

    switch (log['statusType']) {
      case 'success':
        badgeBg = AppColors.secondaryContainer;
        badgeText = AppColors.onSecondaryContainer;
        break;
      case 'complete':
        badgeBg = AppColors.surfaceContainerHigh;
        badgeText = AppColors.onSurfaceVariant;
        break;
      case 'warning':
        badgeBg = AppColors.errorContainer;
        badgeText = AppColors.error;
        break;
      case 'dinas':
        badgeBg = AppColors.primaryFixed.withValues(alpha: 0.3);
        badgeText = AppColors.primary;
        break;
      default:
        badgeBg = AppColors.surfaceContainer;
        badgeText = AppColors.onSurface;
    }

    return Container(
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: AppColors.outlineVariant.withValues(alpha: 0.3),
        ),
      ),
      padding: const EdgeInsets.all(14),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                log['date'] as String,
                style: GoogleFonts.poppins(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: AppColors.onSurface,
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                decoration: BoxDecoration(
                  color: badgeBg,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  log['status'] as String,
                  style: GoogleFonts.poppins(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: badgeText,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              log['shift'] as String,
              style: GoogleFonts.poppins(
                fontSize: 11,
                color: AppColors.outline,
              ),
            ),
          ),
          const SizedBox(height: 8),
          const Divider(color: AppColors.surfaceContainerHigh, height: 1),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.login,
                    size: 14,
                    color: AppColors.primary,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    'Masuk: ',
                    style: GoogleFonts.poppins(
                      fontSize: 11,
                      color: AppColors.onSurfaceVariant,
                    ),
                  ),
                  Text(
                    log['masuk'] as String,
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: AppColors.onSurface,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const Icon(
                    Icons.logout,
                    size: 14,
                    color: AppColors.secondary,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    'Pulang: ',
                    style: GoogleFonts.poppins(
                      fontSize: 11,
                      color: AppColors.onSurfaceVariant,
                    ),
                  ),
                  Text(
                    log['pulang'] as String,
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: AppColors.onSurface,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
