# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create(email: "admin@admin",password: "adminadmin")
User.create(name: "ユーザー１",email: "user@user",password: "useruser")
Post.create(user_id: 1,title: "タイトル1",body: "内容1",category: 0,is_public: true)
