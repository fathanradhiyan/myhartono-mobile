part of 'pages.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: bgSecondary,
      appBar: AppBar(
        title: Text(SharedString.myProfile),
        backgroundColor: Colors.white,
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.search,color: textPrimary,)),
          IconButton(onPressed: (){}, icon: Icon(Icons.comment_outlined, color: textPrimary,)),
          IconButton(onPressed: (){}, icon: Icon(Icons.notifications_none_outlined, color: textPrimary,))
        ],
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(16),
        shrinkWrap: true,
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
                  Expanded(
                    flex: 2,
                    child: Row(
                      children: [
                        Expanded(
                          child: CircleAvatar(
                            radius: 45, // atur sesuai kebutuhan
                            backgroundColor: Colors.transparent, // opsional, kalau mau transparan
                            child: ClipOval(
                              child: Image.asset(
                                SharedImage.profilePic,
                                width: 75,
                                height: 75,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(SharedString.username),
                              Text('123.456 Poin Member',),
                              Material(color: Colors.transparent, child: InkWell(onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ProfileSettingPage())), child: Text('Atur akun saya', style: Theme.of(context).textTheme.bodySmall?.copyWith(color: mainColor, fontWeight: FontWeight.w600),)))
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(flex: 4, child: Image(image: AssetImage(SharedImage.memberCard))),
                  CustomButtonWidget(onClick: () {}, color: btnSecondary, icon: Icon(Icons.qr_code_2), text: 'Tunjukkan kode saya', fontColor: textTertiary,),
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
                  CustomProfileMenu(title: 'Daftar Transaksi', leading: Icon(Icons.receipt_long, color: textSecondary,), onClick: (){}),
                  CustomProfileMenu(title: 'Wishlist Saya', leading: Icon(Icons.favorite_border, color: textSecondary,), onClick: (){}),
                  CustomProfileMenu(title: 'Faktur Pajak', leading: Icon(Icons.account_balance, color: textSecondary,), onClick: (){}),
                  CustomProfileMenu(title: 'Daftar Alamat', leading: Icon(Icons.location_on_outlined, color: textSecondary,), onClick: (){}),
                  CustomProfileMenu(title: 'Lokasi Toko Kami', leading: Icon(Icons.store_mall_directory_outlined, color: textSecondary,), onClick: (){}),
                  CustomProfileMenu(title: 'Official Service Center', leading: Icon(Icons.build_outlined, color: textSecondary,), onClick: (){}),
                  CustomProfileMenu(title: 'Kebijakan Privasi', leading: Icon(Icons.privacy_tip_outlined, color: textSecondary,), onClick: (){}),
                  CustomProfileMenu(title: 'Syarat dan Ketentuan', leading: Icon(Icons.description_outlined, color: textSecondary,), onClick: (){}),
                ],
              )
          ),
          Align(alignment: Alignment.center, child: Text("${SharedString.appName} version 1.0.0", style: Theme.of(context).textTheme.bodySmall,)),
          Align(alignment: Alignment.center, child: Text("Copyright @ 2025 Hartono Elektronika", style: Theme.of(context).textTheme.bodySmall,)),
        ],
      )
    );
  }
}

class CustomProfileMenu extends StatelessWidget {
  final String title;
  final Widget leading;
  final Color? fontColor;
  final GestureTapCallback onClick;
  const CustomProfileMenu({
    super.key, required this.title, required this.leading, required this.onClick, this.fontColor
  });


  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: leading,
      title: Text(title, style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: fontColor ?? textPrimary)),
      trailing: Icon(Icons.chevron_right),
      onTap: onClick,
    );
  }
}
