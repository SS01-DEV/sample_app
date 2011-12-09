class User < ActiveRecord::Base

   # **NOTE   (key used to find in multiple files)

   # 'attr_accessor'  :name, :email
	# see Rails 3 tutorial Listing 4.8
	# creates attribute accessors corresponding to a user’s name and email address. This creates
	# “getter” and “setter” methods that allow us to retrieve (get) and assign (set) @name and
	# @email instance variables.


	# see Rails 3 tutorial beneath Listing 6.5
   # for info on 'attr_accessible'
   # -- really good idea to tell Rails which attributes of the model are accessible,
   #   i.e., which attributes can be modified by outside users



	# see Rails 3 tutorial Listing 7.2
	attr_accessor :password
	attr_accessible :name, :email, :password, :password_confirmation


	# see Rails 3 tutorial Listing 6.17
   email_regex = /\A[(\w)+\.]+@([a-z\d-])+\.([a-z])+$/i

	validates :name,  :presence => true,
                     :length => { :maximum => 50 }

	validates :email, :presence => true,
             :format => { :with => email_regex },
       #     :uniqueness => true,
             :uniqueness => { :case_sensitive => false }



	# see Rails 3 tutorial Listing 7.2
   # Automatically create the virtual attribute 'password_confirmation'.
   validates :password, :presence     => true,
                        :confirmation => true,
                        :length => { :within => 6..40 }



	#=============================================================[1]
	# see Rails 3 Tutorial listing 7.6
 
   before_save :encrypt_password


	#------------------------------------------------------------------[2]
	# Implement public method for testing password machinery via RSpec
	# see Rails 3 Tutorial listing 7.7

   # Return true if the user's password matches the submitted password.
   def has_password?(submitted_password)
      # Compare encrypted_password with the encrypted version of
      # submitted_password.
   end


   # see Rails 3 Tutorial listing 7.6,  7.10
   def has_password?(submitted_password)
      encrypted_password == encrypt(submitted_password)
   end

   # see Rails 3 Tutorial listing 7.12
   #  (returns nil if neither of the two returns are invoked)
	def self.authenticate(email, submitted_password)
		user = find_by_email(email)
		return nil if user.nil?
		return user if user.has_password?(submitted_password)
	end

	#------------------------------------------------------------------[2]


   private

      def encrypt_password
         self.salt = make_salt if new_record?
         self.encrypted_password = encrypt(password)
      end

      def encrypt(string)
         secure_hash("#{salt}--#{string}")
      end

      def make_salt
      	secure_hash("#{Time.now.utc}--#{password}")
      end

      def secure_hash(string)
      	Digest::SHA2.hexdigest(string)
      end 

  end
	#=============================================================[1]







end
