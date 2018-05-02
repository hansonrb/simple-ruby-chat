# Backend

It's based on https://github.com/bilalbash/rails_5_devise_app

my works are

```
app/controllers/application_controller.rb - update

app/models/user.rb - update
app/models/chat.rb - new

views/application/chats.html.erb - new
views/application/chatform.html.erb - new
views/application/not_auth.html.slim - new

config/routes.rb - update

db/migrate/xxxx_add_role_to_users.rb - new
db/migrate/xxxx_create_chats.rb - new
```

I skipped using pundit for authrization, cos it's very small app,
I skipped using separate controllers for chats
