namespace :client do

  desc "contacts"
  task contacts: :environment do
    user_id = 1
    friend_id = 2
    puts "before add contact, contants: #{Client::Contact.where(:user_id => user_id).inspect}"
    res = Client::Contact.create(user_id: user_id, friend_id: friend_id)
    puts "after add contact, contacts: #{Client::Contact.where(:user_id => user_id).inspect}"
    res.destroy
    puts "after remove contact, contacts #{Client::Contact.where(:user_id => user_id).inspect}"
  end

  desc "contacts"
  task messages: :environment do
    user_id = 1
    friend_id = 2
    user_contact = Client::Contact.create(user_id: user_id, friend_id: friend_id)
    friend_contact = Client::Contact.create(user_id: friend_id, friend_id: user_id)


    puts "before send sms, user contants: #{Client::Contact.where(:user_id => user_id).inspect}"
    puts "before send sms, friend contants: #{Client::Contact.where(:user_id => friend_id).inspect}"
    puts "before send sms, user sms_history: #{user_contact.sms_history}"
    puts "before send sms, friend sms_history: #{friend_contact.sms_history}"
    3.times do |i|
      user_contact.send_sms("sms_#{i}")
      friend_contact.send_sms("sms_#{i}")
    end
    puts "after send sms, user contants: #{Client::Contact.where(:user_id => user_id).inspect}"
    puts "after send sms, friend contants: #{Client::Contact.where(:user_id => friend_id).inspect}"
    puts "after send sms, user sms_history: #{user_contact.sms_history}"
    puts "after send sms, friend sms_history: #{friend_contact.sms_history}"
    user_contact.send_history.first.destroy
    puts "after destory sms, user contants: #{Client::Contact.where(:user_id => user_id).inspect}"
    puts "after destory sms, friend contants: #{Client::Contact.where(:user_id => friend_id).inspect}"
    puts "after destory sms, user sms_history: #{user_contact.sms_history}"
    puts "after destory sms, friend sms_history: #{friend_contact.sms_history}"
    user_contact.receive_history.last.read
    puts "after read sms, user contants: #{Client::Contact.where(:user_id => user_id).inspect}"
    puts "after read sms, friend contants: #{Client::Contact.where(:user_id => friend_id).inspect}"
    puts "after read sms, user sms_history: #{user_contact.sms_history}"
    puts "after read sms, friend sms_history: #{friend_contact.sms_history}"
    
  end

end
