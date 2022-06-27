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
end

if Category.none?
  Category.create(name: "Truyện thiếu nhi từ 1 - 3 tuổi")
  Category.create(name: "Truyện thiếu nhi từ 3 - 5 tuổi")
  Category.create(name: "Truyện thiếu nhi từ 5 - 7 tuổi")
  Category.create(name: "Truyện thiếu nhi từ 7 - 10 tuổi")
  Category.create(name: "Truyện thiếu nhi từ 10 - 12 tuổi")
end

if Tale.none?
  tale1 = Tale.create(title: "Cây lòng tốt", description: "sorry các bạn trẻ nha mình chưa đọc lên mình cũng kb review thế nào đâu >.<",
    category_id: 1, view: 100, author_id: 2, user_id: 1)
  tale1.image.attach(io: File.open(File.join(Rails.root, "app/assets/images/caylongtot.jpg")), filename: "caylongtot.jpg")
end
