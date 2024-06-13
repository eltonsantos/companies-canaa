puts "Criando usuário padrão"
User.create!([{ name: "Admin", email: "admin@admin.com", password: 123456 }])
