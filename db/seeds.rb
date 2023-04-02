HO = %w(Nguyễn Trần Lê Phạm Đặng)
TEN_DEM = %w(Thị Văn Xuân Minh Hoàng)
TEN = %w(Hồng Nam Hoa Linh Mai Anh)

def random_name
  "#{HO.sample} #{TEN_DEM.sample} #{TEN.sample}"
end

if User.none?
  bithday = Faker::Date.birthday(min_age: 5, max_age: 65)
  admin = User.create!(name: 'Đàm Đức Đạt', email: 'damducdat0807@gmail.com', password: 'Aa@123456', bithday: bithday, password_confirmation: 'Aa@123456', admin: true)
  admin.image.attach(io: File.open(File.join(Rails.root, 'app/assets/images/me.jpg')), filename: 'me.jpg')
  admin.cover_image.attach(io: File.open(File.join(Rails.root, "app/assets/images/cover-image.jpg")), filename: 'image.jpg')
  50.times do |i|
    bithday = Faker::Date.birthday(min_age: 5, max_age: 65)
    user = User.create!(name: "#{random_name}", email: "#{Faker::Internet.unique.email(domain: 'gmail.com')}", password: 'Aa@123456', password_confirmation: 'Aa@123456', bithday: bithday, admin: false, created_at: Date.today - rand(0..110))
    user.image.attach(io: File.open(File.join(Rails.root, "app/assets/images/avatar-#{ rand(1..5) }.jpg")), filename: 'avatar.jpg')
    user.cover_image.attach(io: File.open(File.join(Rails.root, "app/assets/images/cover-image.jpg")), filename: 'image.jpg')
  end
end

if Author.none?
  a = Author.create(name: 'Đàm Đức Đạt', profile: 'Là người tạo ra trang webside này nè.')
  a.image.attach(io: File.open(File.join(Rails.root, 'app/assets/images/me.jpg')), filename: 'me.jpg')
  b = Author.create(name: 'Bùi Hiền', profile: 'tác giả của những câu chuyện hay ý nghĩa nhất việt nam')
  b.image.attach(io: File.open(File.join(Rails.root, 'app/assets/images/buihien.jpg')), filename: 'buihien.jpg')
  c = Author.create(name: 'Kim Đồng', profile: 'tác giả của những câu chuyện hay ý nghĩa nhất việt nam')
  c.image.attach(io: File.open(File.join(Rails.root, 'app/assets/images/kimdong.png')), filename: 'kimdong.png')
end

if Category.none?
  Category.create(name: 'Truyện tranh thiếu nhi từ 1 - 3 tuổi')
  Category.create(name: 'Truyện tranh thiếu nhi từ 3 - 5 tuổi')
  Category.create(name: 'Truyện tranh thiếu nhi từ 5 - 10 tuổi')
  Category.create(name: 'Nghe chuyện thiếu nhi 1-3 tuổi')
  Category.create(name: 'Nghe chuyện thiếu nhi 3-5 tuổi')
end

if Tale.none?
  tale1 = Tale.create(title: 'Cây lòng tốt', description: 'sorry các bạn trẻ nha mình chưa đọc nên mình cũng kb review thế nào đâu >.<',
                      category_id: 1, view: 100, author_id: 1, user_id: 1)
  tale1.image.attach(io: File.open(File.join(Rails.root, 'app/assets/images/caylongtot.jpg')), filename: 'caylongtot.jpg')
  15.times do |i|
    content = TaleContent.create(content_type: 2, tale_id: tale1.id)
    content.image.attach(io: File.open(File.join(Rails.root, "app/assets/images/truyen-tranh-cay-long-tot-#{i + 2}.png")), filename: "phu_ong_tham_lam#{i + 2}.jpg")
  end

  tale2 = Tale.create(title: 'Phú ông tham lam', description: 'sorry các bạn trẻ nha mình chưa đọc nên mình cũng kb review thế nào đâu >.<',
                      category_id: 2, view: 1111, author_id: 2, user_id: 1)
  tale2.image.attach(io: File.open(File.join(Rails.root, 'app/assets/images/phu_ong_tham_lam0.jpg')), filename: 'phu_ong_tham_lam.jpg')
  15.times do |i|
    content = TaleContent.create(content_type: 2, tale_id: tale2.id)
    content.image.attach(io: File.open(File.join(Rails.root, "app/assets/images/phu_ong_tham_lam#{i + 1}.jpg")), filename: "phu_ong_tham_lam#{i + 1}.jpg")
  end

  tale3 = Tale.create(title: 'Bác nông dân mơ mộng', description: 'Kể về bác nông dân rất là cute phô mai que luôn có suy nghĩ mơ mộng',
                      category_id: 3, view: 121, author_id: 2, user_id: 1)
  tale3.image.attach(io: File.open(File.join(Rails.root, 'app/assets/images/bac-nong-dan-mo-mong-1.png')), filename: 'bac-nong-dan-mo-mong-1.png')
  14.times do |i|
    content = TaleContent.create(content_type: 2, tale_id: tale3.id)
    content.image.attach(io: File.open(File.join(Rails.root, "app/assets/images/bac-nong-dan-mo-mong-#{i + 2}.png")), filename: "bac-nong-dan-mo-mong-#{i + 2}.png")
  end

  tale4 = Tale.create(title: 'Bò và dê', description: 'kể về cuộc sống xa hoa trụy lạc của bò con và dê con',
                      category_id: 3, view: 121, author_id: 2, user_id: 1)
  tale4.image.attach(io: File.open(File.join(Rails.root, 'app/assets/images/bo-va-de-1.png')), filename: 'bo-va-de-1.png')
  13.times do |i|
    content = TaleContent.create(content_type: 2, tale_id: tale4.id)
    content.image.attach(io: File.open(File.join(Rails.root, "app/assets/images/bo-va-de-#{i + 2}.png")), filename: "bo-va-de-#{i + 2}.png")
  end

  tale5 = Tale.create(title: 'Cậu bé chăn cừu', description: 'chúng ta không lợi dùng lòng tốt của người khác để làm niềm vui cho mình cùng như không nên nói dối mọi người',
                      category_id: 3, view: 121, author_id: 2, user_id: 1)
  tale5.image.attach(io: File.open(File.join(Rails.root, 'app/assets/images/truyen-tranh-cau-be-chan-cuu-1.png')), filename: 'truyen-tranh-cau-be-chan-cuu-1.png')
  10.times do |i|
    content = TaleContent.create(content_type: 2, tale_id: tale5.id)
    content.image.attach(io: File.open(File.join(Rails.root, "app/assets/images/truyen-tranh-cau-be-chan-cuu-#{i + 2}.png")), filename: "truyen-tranh-cau-be-chan-cuu-#{i + 2}.png")
  end

  tale6 = Tale.create(title: 'Nàng Bạch Tuyết và bảy chú lùn', description: 'Bạch Tuyết và bảy chú lùn là một trong những truyện cổ Grimm nổi tiếng khắp thế giới, kể về nàng công chúa xinh đẹp phải trốn chạy bà hoàng hậu ác độc.',
                      category_id: 3, view: 1121, author_id: 3, user_id: 1)
  tale6.image.attach(io: File.open(File.join(Rails.root, 'app/assets/images/bach-tuye-va-bay-chu-lun0.jpg')), filename: 'bach-tuye-va-bay-chu-lun0.jpg')
  TaleContent.create(content_type: 0, tale_id: tale6.id, text: "<p>Ng&agrave;y xưa, c&oacute; một b&agrave; ho&agrave;ng hậu&nbsp;<sup>[1]</sup>&nbsp;nhan sắc tuyệt trần ngồi kh&acirc;u b&ecirc;n khung cửa sổ bằng gỗ mun đen b&oacute;ng.
    Ngo&agrave;i trời tuyết rơi lả tả. Đột nhi&ecirc;n kim đ&acirc;m v&agrave;o ng&oacute;n tay ho&agrave;ng hậu, một giọt m&aacute;u đỏ tươi rơi xuống nền tuyết trắng x&oacute;a. B&agrave; chợt ước &aacute;o c&oacute;
    được một đứa con g&aacute;i cũng xinh đẹp như cảnh vật trước mắt.</p>
    <p>Quả nhi&ecirc;n, &iacute;t l&acirc;u sau b&agrave; sinh được một c&ocirc; con g&aacute;i da trắng như tuyết, m&ocirc;i thắm như giọt m&aacute;u tươi v&agrave; t&oacute;c đen l&aacute;y như gỗ mun cửa sổ. B&agrave; đặt t&ecirc;n con l&agrave; Bạch Tuyết.</p>
    <p>Chẳng bao l&acirc;u ho&agrave;ng hậu qua đời v&agrave; một thời gian sau nh&agrave; vua lấy một b&agrave; vợ kh&aacute;c. B&agrave; n&agrave;y cũng xinh đẹp kh&aacute;c thường, nhưng t&iacute;nh t&igrave;nh rất ki&ecirc;u căng, hợm hĩnh&nbsp;<sup>[2]</sup>.
    B&agrave; ta c&oacute; một tấm gương thần&nbsp;<sup>[3]</sup>. Mỗi lần ngồi trước gương b&agrave; thường hỏi:</p>
    <p><em>&ndash; Gương kia ngự ở tr&ecirc;n tường,</em><br />
    <em>Thế gian&nbsp;<sup>[4]</sup>&nbsp;ai đẹp được dường như ta?</em></p>
    <p>Gương b&egrave;n trả lời:</p>
    <p><em>&ndash; Ho&agrave;ng hậu đẹp nhất tr&ecirc;n đời,</em><br />
    <em>Thế gian&nbsp;ai s&aacute;nh với Người được đ&acirc;u!</em></p>
    ")
  content = TaleContent.create(content_type: 2, tale_id: tale6.id)
  content.image.attach(io: File.open(File.join(Rails.root, 'app/assets/images/bach-tuye-va-bay-chu-lun1.jpg')), filename: 'bach-tuye-va-bay-chu-lun1.jpg')
  TaleContent.create(content_type: 0, tale_id: tale6.id, text: "<p>Khi Bạch Tuyết l&ecirc;n bảy tuổi, c&ocirc; b&eacute; bỗng trở n&ecirc;n tươi đẹp như &aacute;nh nắng m&ugrave;a xu&acirc;n v&agrave; đẹp hơn cả b&agrave;
    mẹ kế của n&agrave;ng nữa. Một h&ocirc;m, ngồi trước gương thần, b&agrave; ta lại hỏi:</p>
    <p><em>&nbsp; &nbsp; &nbsp;&ndash; Gương kia ngự ở tr&ecirc;n tường,</em><br />
    <em>&nbsp; &nbsp; &nbsp;Thế gian ai đẹp được dường như ta?</em></p>
    <p>Gương b&egrave;n trả lời:</p>
    <p><em>&nbsp; &nbsp; &nbsp;&ndash; Xưa kia Người đẹp nhất trần,<br />
    &nbsp; &nbsp; &nbsp;Ng&agrave;y nay Bạch Tuyết mu&ocirc;n phần đẹp hơn.</em></p>
    <p>Nghe gương trả lời như vậy, ho&agrave;ng hậu ghen tức lồng lộn l&ecirc;n. Bụng dạ ki&ecirc;u căng độc &aacute;c,
    mụ ta gọi một vi&ecirc;n quan hầu đến v&agrave; sai đem ngay Bạch Tuyết v&agrave;o rừng giết đi, sau đ&oacute; phải đem tr&aacute;i tim n&agrave;ng về cho mụ ăn sống để nhan sắc mụ c&agrave;ng xinh đẹp hơn.</p>
    <p>Vi&ecirc;n quan hầu đem Bạch Tuyết v&agrave;o rừng. Nhưng phần th&igrave; nhớ đến l&ograve;ng nh&acirc;n từ của b&agrave; ho&agrave;ng hậu trước,
    phần th&igrave; x&oacute;t thương c&ocirc; b&eacute; xinh đẹp v&ocirc; tội, &ocirc;ng b&egrave;n kẻ mọi chuyện cho n&agrave;ng r&otilde; rồi bảo n&agrave;ng trốn biệt đi đừng trở về cung nữa.
    Ngay l&uacute;c đ&oacute; c&oacute; một ch&uacute; nai con ở đ&acirc;u chạy đến, vi&ecirc;n quan liền đ&oacute;n bắt lấy, mổ bụng con vật ra để lấy quả tim đem về cho mụ ho&agrave;ng hậu.</p>
    <p>Thế l&agrave; c&ocirc; b&eacute; tội nghiệp lang thang một m&igrave;nh trong rừng. Chim ch&oacute;c r&iacute;u r&iacute;t v&acirc;y quanh,
    mu&ocirc;ng th&uacute;&nbsp;<sup>[5]</sup>&nbsp;tung tăng chạy theo. M&atilde;i đến xế chiều, Bạch Tuyết mới tr&ocirc;ng thấy một căn nh&agrave; b&eacute; nhỏ liền gh&eacute; v&agrave;o định xin nghỉ nhờ. Trong nh&agrave; đồ đạc thứ g&igrave; cũng nhỏ x&iacute;u nhưng sạch sẽ, ngăn nắp.
    Giữa nh&agrave; c&oacute; một chiếc b&agrave;n trải khăn trắng tinh, b&ecirc;n tr&ecirc;n b&agrave;y sẵn bảy bộ đồ ăn xinh xắn: đĩa đựng thức ăn, th&igrave;a, dĩa, dao v&agrave; cả ly rượu đỏ. Hai b&ecirc;n tường k&ecirc; bảy chiếc giường nhỏ c&ugrave;ng trải khăn trắng tinh tươm.</p>
  ")
  content = TaleContent.create(content_type: 2, tale_id: tale6.id)
  content.image.attach(io: File.open(File.join(Rails.root, 'app/assets/images/bach-tuye-va-bay-chu-lun2.jpg')), filename: 'bach-tuye-va-bay-chu-lun1.jpg')
  content = TaleContent.create(content_type: 0, tale_id: tale6.id, text: "<p>Bạch Tuyết đ&oacute;i qu&aacute; b&egrave;n ăn ở mỗi đĩa một ch&uacute;t thức ăn v&agrave; uống ở mỗi ly một ch&uacute;t rượu, xong n&agrave;ng đặt m&igrave;nh l&ecirc;n một chiếc giường nhỏ, ngủ một giấc say sưa.</p>
    <p>Đến xẩm tối, chủ nh&agrave; l&agrave; bảy ch&uacute; l&ugrave;n trở về căn nh&agrave; ấm c&uacute;ng sau một ng&agrave;y v&agrave;o trong n&uacute;i đ&agrave;o mỏ sắt kh&aacute; vất vả. Họ vừa bước v&agrave;o nh&agrave;, đến b&ecirc;n chiếc b&agrave;n ăn,
    bỗng ngạc nhi&ecirc;n c&ugrave;ng k&ecirc;u l&ecirc;n:</p>
    <p>&ndash; Ồ, ai đ&atilde; ngồi v&agrave;o chiếc ghế của t&ocirc;i thế n&agrave;y? Ai đ&atilde; d&ugrave;ng dao, dĩa v&agrave; th&igrave;a của t&ocirc;i? Ai đ&atilde; nếm thức ăn trong đĩa t&ocirc;i? Ai đ&atilde; uống trong ly của t&ocirc;i?</p>
    <p>Rồi mọi người nh&igrave;n quanh v&agrave; ngạc nhi&ecirc;n v&ocirc; c&ugrave;ng khi thấy Bạch Tuyết đang nằm ngủ ngon l&agrave;nh tr&ecirc;n chiếc giường thứ bảy. Họ lại c&ugrave;ng k&ecirc;u l&ecirc;n:</p>
    <p>&ndash; Ch&agrave;, một n&agrave;ng c&ocirc;ng ch&uacute;a&nbsp;<sup>[6]</sup>&nbsp;tuyệt đẹp!</p>
    <p>Thế l&agrave; họ để y&ecirc;n cho c&ocirc; b&eacute; ngủ. Ch&uacute; l&ugrave;n thứ bảy đ&agrave;nh ngủ chung giường với một ch&uacute; kh&aacute;c.</p>
  ")
  content = TaleContent.create(content_type: 2, tale_id: tale6.id)
  content.image.attach(io: File.open(File.join(Rails.root, 'app/assets/images/bach-tuye-va-bay-chu-lun3.jpg')), filename: 'bach-tuye-va-bay-chu-lun2.jpg')
  content = TaleContent.create(content_type: 0, tale_id: tale6.id, text: "<p>S&aacute;ng h&ocirc;m sau, Bạch Tuyết tỉnh dậy, kể lại cho mọi người nghe hết mọi chuyện. Bảy ch&uacute; l&ugrave;n b&egrave;n khuy&ecirc;n Bạch Tuyết n&ecirc;n ở lại đ&acirc;y với họ v&agrave; n&agrave;ng đừng sợ thiếu thốn g&igrave; cả.
    Họ cũng kh&ocirc;ng qu&ecirc;n căn dặn n&agrave;ng phải lu&ocirc;n lu&ocirc;n ở trong nh&agrave;, đề ph&ograve;ng b&agrave; mẹ kế t&igrave;m đường đến h&atilde;m hại.</p>
    <p>Thế l&agrave; Bạch Tuyết ở lại trong căn nh&agrave; ấm &aacute;p đ&oacute;, h&agrave;ng ng&agrave;y tr&ocirc;ng nom nh&agrave; cửa rất chu đ&aacute;o. Tối tối, bảy ch&uacute; l&ugrave;n đi l&agrave;m về lại c&oacute; bữa ăn n&oacute;ng sốt sẵn s&agrave;ng.</p>
    <p>Về phần mụ ho&agrave;ng hậu, sau khi ăn sống tr&aacute;i tim của ch&uacute; nai con xong (m&agrave; mụ cứ tưởng l&agrave; của Bạch Tuyết), mụ lại soi gương v&agrave; hỏi:</p>
    <p><em>&ndash; Gương kia ngự ở tr&ecirc;n tường,</em><br />
    <em>Thế gian ai đẹp được dường như ta?</em></p>
    <p>Gương trả lời:</p>
    <p><em>&ndash; Xưa kia Người đẹp nhất trần,<br />
    Ng&agrave;y nay Bạch Tuyết mu&ocirc;n phần đẹp hơn.<br />
    N&agrave;ng ta ở khuất n&uacute;i non,<br />
    Tại nh&agrave; của bảy ch&uacute; l&ugrave;n xa xa.</em></p>
  ")
  content = TaleContent.create(content_type: 2, tale_id: tale6.id)
  content.image.attach(io: File.open(File.join(Rails.root, 'app/assets/images/bach-tuye-va-bay-chu-lun4.jpg')), filename: 'bach-tuye-va-bay-chu-lun3.jpg')
  content = TaleContent.create(content_type: 0, tale_id: tale6.id, text: "<p>Mụ ta t&aacute;i m&eacute;t mặt lại. Suốt đ&ecirc;m mụ trằn trọc kh&ocirc;ng ngủ lo t&igrave;m mưa t&iacute;nh kế l&agrave;m hại n&agrave;ng. H&ocirc;m sau, mụ ta giả dạng&nbsp;<sup>[7]</sup>&nbsp;l&agrave;m một b&agrave; gi&agrave; đi b&aacute;n gương lược.
    M&ugrave; m&ograve; đến nh&agrave; bảy ch&uacute; l&ugrave;n, g&otilde; cửa v&agrave; rao to:</p>
    <p><em>&ndash; Ai mua gương lược chải đầu,</em><br />
    <em>Chải v&agrave;o t&oacute;c đẹp gấp bao nhi&ecirc;u lần!</em></p>
    <p>Bạch Tuyết l&oacute; đầu ra xem thấy kh&ocirc;ng phải l&agrave; b&agrave; mẹ kế liền mở cửa chạy ra hỏi mua một chiếc lược. Mụ ta lấy ra một chiếc lược nhỏ x&iacute;u bằng ng&agrave; b&oacute;ng đẹp rồi n&oacute;i:</p>
    <p>&ndash; Để b&agrave; chải đầu thử cho ch&aacute;u nh&eacute;! &Ocirc;i chao, t&oacute;c ch&aacute;u đen như gỗ min thế n&agrave;y cơ m&agrave;!</p>
    <p>Bạch Tuyết để y&ecirc;n cho mụ chải. Nhưng lược vừa chạm v&agrave;o m&aacute;i t&oacute;c xinh đẹp th&igrave; n&agrave;ng ng&atilde; lăn xuống trước cửa chết ngất đi. Th&igrave; ra chiếc lược c&oacute; tẩm sẵn thuốc độc. Mụ gi&agrave; độc &aacute;c liền g&aacute;nh h&agrave;ng bỏ đi ngay.</p>
  ")
  content = TaleContent.create(content_type: 2, tale_id: tale6.id)
  content.image.attach(io: File.open(File.join(Rails.root, 'app/assets/images/bach-tuye-va-bay-chu-lun5.jpg')), filename: 'bach-tuye-va-bay-chu-lun3.jpg')
  TaleContent.create(content_type: 0, tale_id: tale6.id, text: '')
  tale7 = Tale.create(title: 'Chị Hà Mã Tốt Bụng', description: 'sorry các bạn trẻ nha mình chưa đọc nên mình cũng kb review thế nào đâu >.<',
                      category_id: 3, view: 121, author_id: 2, user_id: 1)
  tale7.image.attach(io: File.open(File.join(Rails.root, 'app/assets/images/chi-ha-ma-tot-bung-1.png')), filename: 'chi-ha-ma-tot-bung-1.png')
  12.times do |i|
    content = TaleContent.create(content_type: 2, tale_id: tale7.id)
    content.image.attach(io: File.open(File.join(Rails.root, "app/assets/images/chi-ha-ma-tot-bung-#{i + 1}.png")), filename: "chi-ha-ma-tot-bung-#{i + 1}.png")
  end

  tale8 = Tale.create(title: 'Bạn Lợn Lười Tắm', description: 'Các bé ơi, hãy giữ gìn vệ sinh cơ thể sạch sẽ nhé, đừng như Bạn lợn lười tắm dưới đây nhé.',
                      category_id: 3, view: 121, author_id: 2, user_id: 1)
  tale8.image.attach(io: File.open(File.join(Rails.root, 'app/assets/images/truyentranhthieunhi-banlonluoitam-1.jpg')), filename: 'truyentranhthieunhi-banlonluoitam-1.jpg  ')
  12.times do |i|
    content = TaleContent.create(content_type: 2, tale_id: tale8.id)
    content.image.attach(io: File.open(File.join(Rails.root, "app/assets/images/truyentranhthieunhi-banlonluoitam-#{i + 2}.jpg")), filename: "truyentranhthieunhi-banlonluoitam-#{i + 2}.jpg")
  end
  tale9 = Tale.create(title: 'Truyền thuyết Con Rồng cháu Tiên', description: 'Truyền thuyết Con Rồng cháu Tiên hay còn gọi sự tích Trăm trứng nở trăm con nhằm giải thích về nguồn gốc dân tộc cũng như đề cao lòng tự hào và tinh thần đoàn kết của dân tộc Việt Nam.',
    category_id: 1, view: 3000, author_id: 3, user_id: 1)
  tale9.image.attach(io: File.open(File.join(Rails.root, 'app/assets/images/con-rong-chau-tien.jpg')), filename: 'con-rong-chau-tien.jpg')
  tale9.tale_contents.create!(content_type: 0, text: "<p>Ng&agrave;y xưa, ở miền đất Lạc Việt, cứ như b&acirc;y giờ l&agrave; Bắc Bộ nước ta, c&oacute; một vị thần thuộc n&ograve;i rồng, con trai thần Long nữ, t&ecirc;n l&agrave; Lạc Long Qu&acirc;n.
    Thần m&igrave;nh rồng, thường ở dưới nước, thỉnh thoảng l&ecirc;n sống tr&ecirc;n cạn, sức khỏe v&ocirc; địch, c&oacute; nhiều ph&eacute;p lạ.</p>")
  content = tale9.tale_contents.create(content_type: 2)
  content.image.attach(io: File.open(File.join(Rails.root, 'app/assets/images/con-rong-chau-tien1.jpg')), filename: '1')
  tale9.tale_contents.create!(content_type: 0, text: "<p>Thần gi&uacute;p nh&acirc;n d&acirc;n diệt trừ Ngư tinh, Hồ tinh, Mộc tinh l&agrave; những lo&agrave;i y&ecirc;u qu&aacute;i bấy l&acirc;u l&agrave;m hại d&acirc;n l&agrave;nh.
    Thần dạy d&acirc;n c&aacute;ch trồng trọt, chăn nu&ocirc;i v&agrave; c&aacute;ch ăn ở. Xong việc, thần thường về thủy cung&nbsp;<sup>[1]</sup>&nbsp;với mẹ, khi c&oacute; việc cần, thần mới hiện l&ecirc;n.</p>")
  content = tale9.tale_contents.create(content_type: 2)
  content.image.attach(io: File.open(File.join(Rails.root, 'app/assets/images/con-rong-chau-tien2.jpg')), filename: '2')
  tale9.tale_contents.create!(content_type: 0, text: "<p>Bấy giờ, ở v&ugrave;ng n&uacute;i cao phương Bắc, c&oacute; n&agrave;ng &Acirc;u Cơ thuộc d&ograve;ng họ Thần N&ocirc;ng, xinh đẹp tuyệt trần, nghe tiếng v&ugrave;ng đất Lạc c&oacute; nhiều hoa thơm cỏ lạ, b&egrave;n t&igrave;m đến thăm.
    &Acirc;u Cơ v&agrave; Lạc Long Qu&acirc;n gặp nhau, đ&egrave;m l&ograve;ng y&ecirc;u thương, rồi trở th&agrave;nh vợ chồng, c&ugrave;ng nhau chung sống tr&ecirc;n cạn ở điện Long Tr&aacute;ng.</p>")
  content = tale9.tale_contents.create(content_type: 2)
  content.image.attach(io: File.open(File.join(Rails.root, 'app/assets/images/con-rong-chau-tien3.jpg')), filename: '3')
  tale9.tale_contents.create!(content_type: 0, text: "<p>&Iacute;t l&acirc;u sau, &Acirc;u Cơ c&oacute; mang đến k&igrave; sinh nở. Chuyện thật lạ, n&agrave;ng sinh ra một c&aacute;i bọc trăm trứng nở ra một trăm con trai, con n&agrave;o con ấy hồng h&agrave;o, đẹp đẽ lạ thường.
    Đ&agrave;n con kh&ocirc;ng cần b&uacute; mớm m&agrave; tự lớn l&ecirc;n như thổi, mặt mũi kh&ocirc;i ng&ocirc;&nbsp;<sup>[2]</sup>, khỏe mạnh như thần.</p>")
  content = tale9.tale_contents.create(content_type: 2)
  content.image.attach(io: File.open(File.join(Rails.root, 'app/assets/images/con-rong-chau-tien4.jpg')), filename: '4')
  tale9.tale_contents.create!(content_type: 0, text: "<p>Thế rồi một h&ocirc;m, Lạc Long Qu&acirc;n vốn quen ở nước, cảm thấy m&igrave;nh kh&ocirc;ng thể sống m&atilde;i tr&ecirc;n cạn được, đ&agrave;nh từ biệt &Acirc;u Cơ v&agrave; đ&agrave;n con để trở về thủy cung với mẹ.
    &Acirc;u Cơ ở lại một m&igrave;nh nu&ocirc;i đ&agrave;n con, th&aacute;ng ng&agrave;y chờ mong, buồn tủi. Cuối c&ugrave;ng n&agrave;ng gọi chồng l&ecirc;n v&agrave; than thở.
    &ndash; Sao ch&agrave;ng bỏ thiếp [3] m&agrave; đi, kh&ocirc;ng c&ugrave;ng thiếp nu&ocirc;i đ&agrave;n con nhỏ? Lạc Long Qu&acirc;n n&oacute;i: &ndash; Ta vốn n&ograve;i rồng ở miền nước thẳm, n&agrave;ng l&agrave; gi&ograve;ng ti&ecirc;n ở chốn non cao.
    Kẻ ở cạn, người ở nước, t&iacute;nh t&igrave;nh tập qu&aacute;n [4] kh&aacute;c nhau, kh&oacute; m&agrave; ăn ở c&ugrave;ng nhau một nơi l&acirc;u d&agrave;i được. Nay ta đưa năm mươi con xuống biển, n&agrave;ng đưa năm mươi con l&ecirc;n n&uacute;i, chia nhau cai quản c&aacute;c phương.
    Kẻ miền n&uacute;i, người miền biển, khi c&oacute; việc g&igrave; th&igrave; gi&uacute;p đỡ lẫn nhau, đừng qu&ecirc;n lời hẹn.</p>")
  content = tale9.tale_contents.create(content_type: 2)
  content.image.attach(io: File.open(File.join(Rails.root, 'app/assets/images/con-rong-chau-tien5.jpg')), filename: '5')
  tale9.tale_contents.create!(content_type: 0, text: "<p>&Acirc;u Cơ v&agrave; trăm con nghe theo, rồi c&ugrave;ng nhau chia tay nhau l&ecirc;n đường.</p>
    <p>Người con trưởng được t&ocirc;n l&ecirc;n l&agrave;m vua, lấy hiệu l&agrave; H&ugrave;ng Vương, đ&oacute;ng đ&ocirc;&nbsp;<sup>[5]</sup>&nbsp;ở đất Phong Ch&acirc;u, đặt t&ecirc;n nước l&agrave; Văn Lang. Triều đ&igrave;nh c&oacute; tướng văn, tướng v&otilde;,
    con trai vua gọi l&agrave; quan lang, con g&aacute;i vua gọi l&agrave; mị nương, khi cha chết th&igrave; được truyền ng&ocirc;i cho con trưởng, mười mấy đời truyền nối ng&ocirc;i vua đều lấy danh hiệu H&ugrave;ng Vương, kh&ocirc;ng hề thay đổi.</p>
    <p>Cũng bởi sự t&iacute;ch n&agrave;y m&agrave; về sau, người Việt Nam ta con ch&aacute;u vua H&ugrave;ng, thường nhắc đến nguồn gốc của m&igrave;nh l&agrave;&nbsp; con Rồng ch&aacute;u Ti&ecirc;n.</p>")
  content = tale9.tale_contents.create(content_type: 2)
  content.image.attach(io: File.open(File.join(Rails.root, 'app/assets/images/con-rong-chau-tien6.jpg')), filename: '6')
end

if Relationship.none?
  6.times do |i|
    numbers = (1..9).to_a.shuffle
    User.all.each do |u|
      Relationship.find_or_create_by(follower_id: u.id, followed_id: numbers.pop)
    end
  end
end

if Favourite.none?
  6.times do |i|
    numbers = (1..9).to_a.shuffle
    User.all.each do |u|
      Favourite.find_or_create_by(favouriter_id: u.id, favourited_id: numbers.pop)
    end
  end
end

if Reviewtale.none?
  6.times do |i|
    numbers = (1..9).to_a.shuffle
    User.all.each do |u|
      u.reviewtales.create(tale_id: numbers.pop, rating: rand(4..5), comment: ["Hay", "10 Điểm", "Tuyệt vời", "Ý nghĩa"].sample)
    end
  end
end

if Request.none?
  10.times do |i|
    numbers = (1..9).to_a.shuffle
    User.all.each do |u|
      u.requests.create(title: "#{u.name} gửi request test hệ thống #{i}", status: 1, content: "Người dùng #{u.name} gửi request test hệ thống #{i} vui lòng check request được gửi.")
    end
  end
end
