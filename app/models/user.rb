# == Schema Information
#
# Table name: users
#
#  id                 :integer(4)      not null, primary key
#  name               :string(255)
#  email              :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#  encrypted_password :string(255)
#  salt               :string(255)
#

class User < ActiveRecord::Base
    has_many :articles
    has_many :comments
    has_many :vote_articles
    has_many :vote_comments
    attr_accessor(:password)
    attr_accessible(:name,:email,:password,:password_confirmation)
    
    email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    
    validates(:name ,           :presence => true,
                                :length => {:maximum => 50})
    validates(:email,           :presence => true,
                                :format => {:with => email_regex },
                                :uniqueness => {:case_sensitive => false })
    validates(:password,        :presence => true,
                                :confirmation => true,
                                :length => {:within => 6..40})
                                
    before_save (:encrypt_password) #callback after [user].save or create!
    #verify using encrypted password
    def has_password?(submitted_password)
        self.encrypted_password == encrypted(submitted_password)
    end
    
    #self.[method_name] is static method in rail
    #verify using encrypted password
    def self.authentication(email,submitted_password)
        #find_by_email are  inherit method in the active_record class
        #rails implicit create object
        user = find_by_email(email)
        return nil if user.nil?
        return user if user.has_password?(submitted_password)
    end    
    #verify using salt
    def self.authentication_with_salt(id,salt)
        user = find_by_id(id)
        #if user valid and user.salt == salt return user else return nill
        (user && user.salt == salt) ? user : nil
    end
    
    private
        
        def encrypt_password
            self.salt = make_salt if self.new_record?
            self.encrypted_password = encrypted(self.password)
        end
        #correct salt in the  user database
        def encrypted(string)     
            secure_hash("#{self.salt}--#{string}")
        end
        def make_salt
            secure_hash("#{Time.now.utc}--#{self.password}")
        end

        # use independent function to make it easier to change the encryption method  
        def secure_hash(string)
            Digest::SHA2.hexdigest(string)
        end
        
end

