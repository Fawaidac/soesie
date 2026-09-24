import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constants/app_colors.dart';
import '../../widgets/qr_code_modal.dart';
import '../login_screen.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  void _handleLogout(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text(
          'Konfirmasi Keluar',
          style: GoogleFonts.inter(
            fontWeight: FontWeight.bold,
            color: AppColors.onSurface,
          ),
        ),
        content: Text(
          'Apakah Anda yakin ingin keluar dari akun SOESIE Mobile?',
          style: GoogleFonts.inter(
            fontSize: 13,
            color: AppColors.onSurfaceVariant,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(
              'Batal',
              style: GoogleFonts.inter(
                color: AppColors.outline,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const LoginScreen()),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.error,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Text(
              'Keluar',
              style: GoogleFonts.inter(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. Profile Hero Card Container
          Container(
            decoration: BoxDecoration(
              color: AppColors.surfaceContainerLowest,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: AppColors.primary.withValues(alpha: 0.1),
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withValues(alpha: 0.08),
                  blurRadius: 20,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: [
                // Top Banner
                Container(
                  height: 100,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        AppColors.primary,
                        AppColors.tertiaryContainer,
                        AppColors.secondary,
                      ],
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Colors.white.withValues(alpha: 0.3),
                          ),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 6,
                              height: 6,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.primaryFixed,
                              ),
                            ),
                            const SizedBox(width: 6),
                            Text(
                              'Presensi Terhubung (GPS Valid)',
                              style: GoogleFonts.inter(
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () => QrCodeModal.show(context),
                        child: Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white.withValues(alpha: 0.2),
                            border: Border.all(
                              color: Colors.white.withValues(alpha: 0.3),
                            ),
                          ),
                          child: const Icon(
                            Icons.qr_code_scanner,
                            size: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Avatar & Profile Details Overlap
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Transform.translate(
                        offset: const Offset(0, -32),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Stack(
                              children: [
                                Container(
                                  width: 76,
                                  height: 76,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.surfaceContainerLowest,
                                    border: Border.all(
                                      color: AppColors.surfaceContainerLowest,
                                      width: 4,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withValues(
                                          alpha: 0.15,
                                        ),
                                        blurRadius: 10,
                                      ),
                                    ],
                                  ),
                                  child: ClipOval(
                                    child: Image.asset(
                                      'images/logo_round.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 2,
                                  right: 2,
                                  child: Container(
                                    width: 20,
                                    height: 20,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColors.primary,
                                      border: Border.all(
                                        color: Colors.white,
                                        width: 1.5,
                                      ),
                                    ),
                                    child: const Icon(
                                      Icons.verified,
                                      size: 11,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            // Shift & Status Badges
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.secondary,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text(
                                    'Shift: Manajerial',
                                    style: GoogleFonts.inter(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 6),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.secondaryContainer,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 6,
                                        height: 6,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: AppColors.primary,
                                        ),
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        'Aktif',
                                        style: GoogleFonts.inter(
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.onSecondaryContainer,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      Transform.translate(
                        offset: const Offset(0, -20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Achmad Fawaid, S.Kom.',
                              style: GoogleFonts.inter(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: AppColors.onSurface,
                              ),
                            ),
                            Text(
                              'Instalasi Pengelola Data Elektronik (IPDE)',
                              style: GoogleFonts.inter(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: AppColors.onSurfaceVariant,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Row(
                              children: [
                                const Icon(
                                  Icons.badge,
                                  size: 14,
                                  color: AppColors.outline,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  'NIP. 350921250430001',
                                  style: GoogleFonts.inter(
                                    fontSize: 12,
                                    color: AppColors.outline,
                                    fontFeatures: const [
                                      FontFeature.tabularFigures(),
                                    ],
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 14),
                            const Divider(
                              color: AppColors.surfaceContainerHigh,
                              height: 1,
                            ),
                            const SizedBox(height: 12),

                            // Quick Metrics Bar
                            Row(
                              children: [
                                _buildMetricSnippet(
                                  '100%',
                                  'Kehadiran',
                                  AppColors.primary,
                                ),
                                const SizedBox(width: 8),
                                _buildMetricSnippet(
                                  '08:00',
                                  'Jam Masuk',
                                  AppColors.secondary,
                                ),
                                const SizedBox(width: 8),
                                _buildMetricSnippet(
                                  'RS Dera',
                                  'Radius Geofence',
                                  AppColors.tertiaryContainer,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // 2. Menu Presensi & Akun Section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'MENU PRESENSI & AKUN',
                style: GoogleFonts.inter(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.8,
                  color: AppColors.onSurfaceVariant,
                ),
              ),
              Text(
                'SOESIE Pass',
                style: GoogleFonts.inter(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          Container(
            decoration: BoxDecoration(
              color: AppColors.surfaceContainerLowest,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: AppColors.outlineVariant.withValues(alpha: 0.3),
              ),
            ),
            child: Column(
              children: [
                _buildProfileMenuItem(
                  context,
                  icon: Icons.qr_code_2,
                  iconBg: AppColors.primary.withValues(alpha: 0.1),
                  iconColor: AppColors.primary,
                  title: 'Kode QR Saya',
                  subtitle:
                      'Tampilkan QR Code untuk presensi cepat & gate pass',
                  onTap: () => QrCodeModal.show(context),
                ),
                const Divider(
                  color: AppColors.surfaceContainerHigh,
                  height: 1,
                  indent: 60,
                ),
                _buildProfileMenuItem(
                  context,
                  icon: Icons.manage_accounts,
                  iconBg: AppColors.secondaryFixed.withValues(alpha: 0.5),
                  iconColor: AppColors.secondary,
                  title: 'Ubah Data Pengguna',
                  subtitle: 'Perbarui kontak pribadi, email & foto dinas',
                  onTap: () {},
                ),
                const Divider(
                  color: AppColors.surfaceContainerHigh,
                  height: 1,
                  indent: 60,
                ),
                _buildProfileMenuItem(
                  context,
                  icon: Icons.fingerprint,
                  iconBg: AppColors.primary.withValues(alpha: 0.1),
                  iconColor: AppColors.primary,
                  title: 'Keamanan & Biometrik',
                  subtitle: 'Aktivasi Sidik Jari, Face ID & PIN Presensi',
                  badgeText: 'AKTIF',
                  onTap: () {},
                ),
                const Divider(
                  color: AppColors.surfaceContainerHigh,
                  height: 1,
                  indent: 60,
                ),
                _buildProfileMenuItem(
                  context,
                  icon: Icons.settings,
                  iconBg: AppColors.surfaceContainerHigh,
                  iconColor: AppColors.onSurfaceVariant,
                  title: 'Pengaturan Aplikasi',
                  subtitle: 'Notifikasi, tema & pengingat presensi',
                  onTap: () {},
                ),
                const Divider(
                  color: AppColors.surfaceContainerHigh,
                  height: 1,
                  indent: 60,
                ),
                _buildProfileMenuItem(
                  context,
                  icon: Icons.support_agent,
                  iconBg: AppColors.secondaryContainer.withValues(alpha: 0.5),
                  iconColor: AppColors.secondary,
                  title: 'Pusat Bantuan & SIMRS',
                  subtitle: 'Helpdesk IT Kepegawaian & Panduan SIMRS',
                  onTap: () {},
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // Logout Button
          SizedBox(
            width: double.infinity,
            height: 48,
            child: OutlinedButton.icon(
              onPressed: () => _handleLogout(context),
              style: OutlinedButton.styleFrom(
                foregroundColor: AppColors.error,
                side: BorderSide(color: AppColors.error.withValues(alpha: 0.4)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                backgroundColor: AppColors.errorContainer.withValues(
                  alpha: 0.2,
                ),
              ),
              icon: const Icon(Icons.logout, size: 20),
              label: Text(
                'Keluar Akun',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMetricSnippet(String value, String label, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: AppColors.surfaceContainerLow,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Text(
              value,
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            Text(
              label,
              style: GoogleFonts.inter(fontSize: 10, color: AppColors.outline),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileMenuItem(
    BuildContext context, {
    required IconData icon,
    required Color iconBg,
    required Color iconColor,
    required String title,
    required String subtitle,
    String? badgeText,
    required VoidCallback onTap,
  }) {
    return ListTile(
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(shape: BoxShape.circle, color: iconBg),
        child: Icon(icon, size: 20, color: iconColor),
      ),
      title: Row(
        children: [
          Text(
            title,
            style: GoogleFonts.inter(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: AppColors.onSurface,
            ),
          ),
          if (badgeText != null) ...[
            const SizedBox(width: 6),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: AppColors.primaryFixed,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                badgeText,
                style: GoogleFonts.inter(
                  fontSize: 9,
                  fontWeight: FontWeight.bold,
                  color: AppColors.onPrimaryFixed,
                ),
              ),
            ),
          ],
        ],
      ),
      subtitle: Text(
        subtitle,
        style: GoogleFonts.inter(fontSize: 11, color: AppColors.outline),
      ),
      trailing: const Icon(
        Icons.chevron_right,
        size: 20,
        color: AppColors.outlineVariant,
      ),
    );
  }
}
