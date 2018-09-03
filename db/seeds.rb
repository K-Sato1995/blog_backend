User.create(name: 'Admin_User',
            status: 0,
            email: 'a@example.com',
            password: '111111',
            password_confirmation: '111111')

User.create(name: 'Sub_Admin_User',
            status: 1,
            email: 'sa@example.com',
            password: '111111',
            password_confirmation: '111111')
