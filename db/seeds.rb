# Initial Data for Role
@admin = Role.create(name: "Admin")
@member = Role.create(name: "Member")
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