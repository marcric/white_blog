class AddDefaultUserAdmin < ActiveRecord::Migration
  def self.up
   salt = [Array.new(6){rand(256).chr}.join].pack("m").chomp
   pw   = Digest::MD5.hexdigest("123change" + salt)

   user = User.new (
     :first_name      => "Webmaster",
	 :last_name       => "Webmaster",
	 :login           => "admin",
	 :password_hash   => pw,
	 :password_salt   => salt,
	 :email           => "webmaster@domain.com"
    )	
    user.save!
  end

  def self.down
  end
end
