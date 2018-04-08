# Categories Data
Category.create([{name: 'Architecture'},
                 { name: 'Art & Culture'},
                 { name: 'Biology & Life Sciences'},
                 { name: 'Business & Management'},
                 { name: 'Chemistry'},
                 { name: 'Communication'},
                 { name: 'Computer Science'},
                 { name: 'Data Analysis & Statistics'},
                 { name: 'Design'},
                 { name: 'Economics & Finance'},
                 { name: 'Education & Teaching Training'},
                 { name: 'Electronics'},
                 { name: 'Energy & Earth Sciences'},
                 { name: 'Engineering'},
                 { name: 'Environmental Studies'},
                 { name: 'Ethics'},
                 { name: 'Food & Nutrition'},
                 { name: 'Health & Safety'},
                 { name: 'History'},
                 { name: 'Humanities'},
                 { name: 'Language'},
                 { name: 'Law'},
                 { name: 'Literature'},
                 { name: 'Math'},
                 { name: 'Medicine'},
                 { name: 'Music'},
                 { name: 'Philosophy & Ethics'},
                 { name: 'Physics'},
                 { name: 'Science'},
                 { name: 'Social Sciences'}])

# Initial Data for Role
@admin = Role.create(name: "Admin")
@member = Role.create(name: "Member")
@student = Role.create(name: "Student")
# Admin
User.create(email: "admin@ait.asia",
            username: "admin",
            password: "admin123",
            password_confirmation: "admin123",
            role: @admin)
# Member
User.create(email: "member@ait.asia",
            username: "member",
            password: "member123",
            password_confirmation: "member123",
            role: @member)

# Student
User.create(email: "student@ait.asia",
            username: "student",
            password: "student123",
            password_confirmation: "student123",
            role: @student)