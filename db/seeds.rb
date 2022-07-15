if User.none?
  User.create!(name: "Đàm Đức Đạt", email: "damducdat0807@gmail.com", password: "123456", password_confirmation: "123456", admin: true)
  50.times do |i|
    bithday = Date.today - rand(-1..10000)
    User.create!(name: "User name #{i+1}", email: "user#{i+1}@gmail.com", password: "123456", password_confirmation: "123456", bithday: bithday, admin: false)
  end
end

if Author.none?
  a = Author.create(name: "Đàm Đức Đạt", profile: "Là người tạo ra trang webside này nè.")
  a.image.attach(io: File.open(File.join(Rails.root, "app/assets/images/me.jpg")), filename: "me.jpg")
  b = Author.create(name: "Bùi Hiền", profile: "tác giả của những câu chuyện hay ý nghĩa nhất việt nam")
  b.image.attach(io: File.open(File.join(Rails.root, "app/assets/images/buihien.jpg")), filename: "buihien.jpg")
  c = Author.create(name: "Kim Đồng", profile: "tác giả của những câu chuyện hay ý nghĩa nhất việt nam")
  c.image.attach(io: File.open(File.join(Rails.root, "app/assets/images/kimdong.png")), filename: "kimdong.png")
end

if Category.none?
  Category.create(name: "Truyện tranh thiếu nhi từ 1 - 3 tuổi")
  Category.create(name: "Truyện tranh thiếu nhi từ 3 - 5 tuổi")
  Category.create(name: "Truyện tranh thiếu nhi từ 5 - 10 tuổi")
  Category.create(name: "Nghe chuyện thiếu nhi 1-3 tuổi")
  Category.create(name: "Nghe chuyện thiếu nhi 3-5 tuổi")
end

if Tale.none?
  tale1 = Tale.create(title: "Cây lòng tốt", description: "sorry các bạn trẻ nha mình chưa đọc nên mình cũng kb review thế nào đâu >.<",
    category_id: 1, view: 100, author_id: 1, user_id: 1)
  tale1.image.attach(io: File.open(File.join(Rails.root, "app/assets/images/caylongtot.jpg")), filename: "caylongtot.jpg")
  15.times do |i|
    content = TaleContent.create(content_type: 2, tale_id: tale1.id)
    content.image.attach(io: File.open(File.join(Rails.root, "app/assets/images/truyen-tranh-cay-long-tot-#{i+2}.png")), filename: "phu_ong_tham_lam#{i+2}.jpg")
  end

  tale2 = Tale.create(title: "Phú ông tham lam", description: "sorry các bạn trẻ nha mình chưa đọc nên mình cũng kb review thế nào đâu >.<",
    category_id: 2, view: 1111, author_id: 2, user_id: 1)
  tale2.image.attach(io: File.open(File.join(Rails.root, "app/assets/images/phu_ong_tham_lam0.jpg")), filename: "phu_ong_tham_lam.jpg")
  15.times do |i|
    content = TaleContent.create(content_type: 2, tale_id: tale2.id)
    content.image.attach(io: File.open(File.join(Rails.root, "app/assets/images/phu_ong_tham_lam#{i+1}.jpg")), filename: "phu_ong_tham_lam#{i+1}.jpg")
  end
  
  tale3 = Tale.create(title: "Bác nông dân mơ mộng", description: "Kể về bác nông dân rất là cute phô mai que luôn có suy nghĩ mơ mộng",
    category_id: 3, view: 121, author_id: 2, user_id: 1)
  tale3.image.attach(io: File.open(File.join(Rails.root, "app/assets/images/bac-nong-dan-mo-mong-1.png")), filename: "bac-nong-dan-mo-mong-1.png")
  14.times do |i|
    content = TaleContent.create(content_type: 2, tale_id: tale3.id)
    content.image.attach(io: File.open(File.join(Rails.root, "app/assets/images/bac-nong-dan-mo-mong-#{i+2}.png")), filename: "bac-nong-dan-mo-mong-#{i+2}.png")
  end
  
  tale4 = Tale.create(title: "Bò và dê", description: "kể về cuộc sống xa hoa trụy lạc của bò con và dê con",
    category_id: 3, view: 121, author_id: 2, user_id: 1)
  tale4.image.attach(io: File.open(File.join(Rails.root, "app/assets/images/bo-va-de-1.png")), filename: "bo-va-de-1.png")
  13.times do |i|
    content = TaleContent.create(content_type: 2, tale_id: tale4.id)
    content.image.attach(io: File.open(File.join(Rails.root, "app/assets/images/bo-va-de-#{i+2}.png")), filename: "bo-va-de-#{i+2}.png")
  end
  
  tale5 = Tale.create(title: "Cậu bé chăn cừu", description: "chúng ta không lợi dùng lòng tốt của người khác để làm niềm vui cho mình cùng như không nên nói dối mọi người",
    category_id: 3, view: 121, author_id: 2, user_id: 1)
  tale5.image.attach(io: File.open(File.join(Rails.root, "app/assets/images/truyen-tranh-cau-be-chan-cuu-1.png")), filename: "truyen-tranh-cau-be-chan-cuu-1.png")
  10.times do |i|
    content = TaleContent.create(content_type: 2, tale_id: tale5.id)
    content.image.attach(io: File.open(File.join(Rails.root, "app/assets/images/truyen-tranh-cau-be-chan-cuu-#{i+2}.png")), filename: "truyen-tranh-cau-be-chan-cuu-#{i+2}.png")
  end
      
  tale6 = Tale.create(title: "Nàng Bạch Tuyết và bảy chú lùn", description: "Bạch Tuyết và bảy chú lùn là một trong những truyện cổ Grimm nổi tiếng khắp thế giới, kể về nàng công chúa xinh đẹp phải trốn chạy bà hoàng hậu ác độc.",
    category_id: 3, view: 121, author_id: 3, user_id: 1)
  tale6.image.attach(io: File.open(File.join(Rails.root, "app/assets/images/bach-tuye-va-bay-chu-lun0.jpg")), filename: "bach-tuye-va-bay-chu-lun0.jpg")
  content = TaleContent.create(content_type: 0, tale_id: tale6.id, text: "<p>Khi Bạch Tuyết l&ecirc;n bảy tuổi, c&ocirc; b&eacute; bỗng trở n&ecirc;n tươi đẹp như &aacute;nh nắng m&ugrave;a xu&acirc;n v&agrave; đẹp hơn cả b&agrave;
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
  content.image.attach(io: File.open(File.join(Rails.root, "app/assets/images/bach-tuye-va-bay-chu-lun1.jpg")), filename: "bach-tuye-va-bay-chu-lun1.jpg")
  content = TaleContent.create(content_type: 0, tale_id: tale6.id, text: "<p>Bạch Tuyết đ&oacute;i qu&aacute; b&egrave;n ăn ở mỗi đĩa một ch&uacute;t thức ăn v&agrave; uống ở mỗi ly một ch&uacute;t rượu, xong n&agrave;ng đặt m&igrave;nh l&ecirc;n một chiếc giường nhỏ, ngủ một giấc say sưa.</p>    
    <p>Đến xẩm tối, chủ nh&agrave; l&agrave; bảy ch&uacute; l&ugrave;n trở về căn nh&agrave; ấm c&uacute;ng sau một ng&agrave;y v&agrave;o trong n&uacute;i đ&agrave;o mỏ sắt kh&aacute; vất vả. Họ vừa bước v&agrave;o nh&agrave;, đến b&ecirc;n chiếc b&agrave;n ăn,
    bỗng ngạc nhi&ecirc;n c&ugrave;ng k&ecirc;u l&ecirc;n:</p>   
    <p>&ndash; Ồ, ai đ&atilde; ngồi v&agrave;o chiếc ghế của t&ocirc;i thế n&agrave;y? Ai đ&atilde; d&ugrave;ng dao, dĩa v&agrave; th&igrave;a của t&ocirc;i? Ai đ&atilde; nếm thức ăn trong đĩa t&ocirc;i? Ai đ&atilde; uống trong ly của t&ocirc;i?</p>
    <p>Rồi mọi người nh&igrave;n quanh v&agrave; ngạc nhi&ecirc;n v&ocirc; c&ugrave;ng khi thấy Bạch Tuyết đang nằm ngủ ngon l&agrave;nh tr&ecirc;n chiếc giường thứ bảy. Họ lại c&ugrave;ng k&ecirc;u l&ecirc;n:</p>
    <p>&ndash; Ch&agrave;, một n&agrave;ng c&ocirc;ng ch&uacute;a&nbsp;<sup>[6]</sup>&nbsp;tuyệt đẹp!</p>
    <p>Thế l&agrave; họ để y&ecirc;n cho c&ocirc; b&eacute; ngủ. Ch&uacute; l&ugrave;n thứ bảy đ&agrave;nh ngủ chung giường với một ch&uacute; kh&aacute;c.</p>
  ")
  content = TaleContent.create(content_type: 2, tale_id: tale6.id)
  content.image.attach(io: File.open(File.join(Rails.root, "app/assets/images/bach-tuye-va-bay-chu-lun2.jpg")), filename: "bach-tuye-va-bay-chu-lun2.jpg")
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
  content.image.attach(io: File.open(File.join(Rails.root, "app/assets/images/bach-tuye-va-bay-chu-lun3.jpg")), filename: "bach-tuye-va-bay-chu-lun3.jpg")
  content = TaleContent.create(content_type: 0, tale_id: tale6.id, text: "<p>Mụ ta t&aacute;i m&eacute;t mặt lại. Suốt đ&ecirc;m mụ trằn trọc kh&ocirc;ng ngủ lo t&igrave;m mưa t&iacute;nh kế l&agrave;m hại n&agrave;ng. H&ocirc;m sau, mụ ta giả dạng&nbsp;<sup>[7]</sup>&nbsp;l&agrave;m một b&agrave; gi&agrave; đi b&aacute;n gương lược. 
    M&ugrave; m&ograve; đến nh&agrave; bảy ch&uacute; l&ugrave;n, g&otilde; cửa v&agrave; rao to:</p>
    <p><em>&ndash; Ai mua gương lược chải đầu,</em><br />
    <em>Chải v&agrave;o t&oacute;c đẹp gấp bao nhi&ecirc;u lần!</em></p>
    <p>Bạch Tuyết l&oacute; đầu ra xem thấy kh&ocirc;ng phải l&agrave; b&agrave; mẹ kế liền mở cửa chạy ra hỏi mua một chiếc lược. Mụ ta lấy ra một chiếc lược nhỏ x&iacute;u bằng ng&agrave; b&oacute;ng đẹp rồi n&oacute;i:</p>
    <p>&ndash; Để b&agrave; chải đầu thử cho ch&aacute;u nh&eacute;! &Ocirc;i chao, t&oacute;c ch&aacute;u đen như gỗ min thế n&agrave;y cơ m&agrave;!</p>
    <p>Bạch Tuyết để y&ecirc;n cho mụ chải. Nhưng lược vừa chạm v&agrave;o m&aacute;i t&oacute;c xinh đẹp th&igrave; n&agrave;ng ng&atilde; lăn xuống trước cửa chết ngất đi. Th&igrave; ra chiếc lược c&oacute; tẩm sẵn thuốc độc. Mụ gi&agrave; độc &aacute;c liền g&aacute;nh h&agrave;ng bỏ đi ngay.</p>
  ")
  tale7 = Tale.create(title: "Chị Hà Mã Tốt Bụng", description: "sorry các bạn trẻ nha mình chưa đọc nên mình cũng kb review thế nào đâu >.<",
    category_id: 3, view: 121, author_id: 2, user_id: 1)
  tale7.image.attach(io: File.open(File.join(Rails.root, "app/assets/images/chi-ha-ma-tot-bung-1.png")), filename: "chi-ha-ma-tot-bung-1.png")
  12.times do |i|
    content = TaleContent.create(content_type: 2, tale_id: tale7.id)
    content.image.attach(io: File.open(File.join(Rails.root, "app/assets/images/chi-ha-ma-tot-bung-#{i+1}.png")), filename: "chi-ha-ma-tot-bung-#{i+1}.png")
  end

  tale8 = Tale.create(title: "Bạn Lợn Lười Tắm", description: "Các bé ơi, hãy giữ gìn vệ sinh cơ thể sạch sẽ nhé, đừng như Bạn lợn lười tắm dưới đây nhé.",
    category_id: 3, view: 121, author_id: 2, user_id: 1)
  tale8.image.attach(io: File.open(File.join(Rails.root, "app/assets/images/truyentranhthieunhi-banlonluoitam-1.jpg")), filename: "truyentranhthieunhi-banlonluoitam-1.jpg  ")
  12.times do |i|
    content = TaleContent.create(content_type: 2, tale_id: tale8.id)
    content.image.attach(io: File.open(File.join(Rails.root, "app/assets/images/truyentranhthieunhi-banlonluoitam-#{i+2}.jpg")), filename: "truyentranhthieunhi-banlonluoitam-#{i+2}.jpg")
  end
    
end
      