User.delete_all
Song.delete_all
Track.delete_all

f = User.create(:name => 'Fred', :email => "fred@gmail.com", :password => "asdasd", :password_confirmation => "asdasd", :role => 'listener')
j = User.create(:name => 'Joe', :email => "joe@gmail.com", :password => "asdasd", :password_confirmation => "asdasd", :role => 'listener')
sm = User.create(:name => 'Steve', :email => "steve@gmail.com", :password => "stevem", :password_confirmation => "stevem", :role => 'admin')
nk = User.create(:name => 'Nikki', :email => "nikki@gmail.com", :password => "niknaks", :password_confirmation => "niknaks", :role => 'admin')
