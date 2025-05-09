part of 'pages.dart';

class ProfileSettingPage extends StatefulWidget {
  const ProfileSettingPage({super.key});

  @override
  State<ProfileSettingPage> createState() => _ProfileSettingPageState();
}

class _ProfileSettingPageState extends State<ProfileSettingPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: bgSecondary,
      appBar: AppBar(
        title: Text(SharedString.settingAccount),
    backgroundColor: Colors.white,),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Card(
            margin: EdgeInsets.symmetric(vertical: 8),
            color: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Container(
              height: size.height * 0.3,
              margin: EdgeInsets.all(16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 45, // atur sesuai kebutuhan
                    backgroundColor: Colors.transparent, // opsional, kalau mau transparan
                    child: ClipOval(
                      child: Image.asset(
                        SharedImage.profilePic,
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(SharedString.username, style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 20, fontWeight: FontWeight.w500),),
                  SizedBox(height: 8,),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Nomor HP', style: Theme.of(context).textTheme.bodySmall,),
                            SizedBox(height: 4,),
                            Text('081290220757', style: Theme.of(context).textTheme.bodyMedium,)
                          ],
                        ),
                        Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: successColor50,
                            borderRadius: BorderRadius.circular(99),
                            border: Border.all(color: Colors.black.withOpacity(0.05))
                          ),
                          child: Text('Terverifikasi', style: Theme.of(context).textTheme.bodySmall!.copyWith(color: successColor700),),
                        )
                      ],
                    ),
                  ),
                  CustomButtonWidget(onClick: (){}, color: btnSecondary, text: 'Tambahkan Email', fontColor: textTertiary,),
                ],
              ),
            ),
          ),
          Card(
              margin: EdgeInsets.symmetric(vertical: 8),
              color: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              child: Column(
                children: [
                  CustomProfileMenu(title: 'Ubah Nama', leading: Icon(Icons.person_outline, color: textSecondary,), onClick: (){}),
                  CustomProfileMenu(title: 'Ubah Nomor HP', leading: Icon(Icons.call_outlined, color: textSecondary,), onClick: (){}),
                  CustomProfileMenu(title: 'Ubah PIN MyHartono', leading: Icon(Icons.lock_outline, color: textSecondary,), onClick: (){}),
                  CustomProfileMenu(title: 'Hapus Akun', leading: Icon(Icons.delete_outlined, color: errorColor), fontColor: errorColor, onClick: (){}),
                ],
              )
          ),
          SizedBox(height: 24,),
          CustomButtonWidget(height: 44, onClick: () {}, text: SharedString.logout, isMainGradient: false, isGradient: true,)
        ],
      ),
    );
  }
}
