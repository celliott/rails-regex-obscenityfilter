class User < ActiveRecord::Base
  attr_accessible :name, :password, :hint, :password_confirmation
  
  belongs_to :character
  belongs_to :password_hint
  
  #validates :password, :presence => true, :confirmation => true
  #validates_length_of :password, :within => 8..25, :on => :create
  
	validate :obscenity_filter

  validates :name, 
          	:presence => true, 
         	 	:uniqueness => true,
         	 	:length => { :maximum => 25 } 

  before_save :create_password
  after_save :clear_password
  
  
	def obscenity_filter
		if self.name.match(/([s5]{1,25}[e3]{1,25}[x]{1,25})|([b6]{1,25}[i!1l|]{1,25}[t+]{1,25}[c<(]{1,25}[h]{1,25})|([s5]{1,25}[h]{1,25}[i!1l|]{1,25}[t+]{1,25})|([f]{1,25}[uv]{1,25}[ck<]{1,25}[k]{1,25})|([t]{1,25}[i!1l|]{1,25}[t+]{1,25})|([p]{1,25}[uv]{1,25}[s5]{1,25}[s5]{1,25}[yi]{1,25})|([p]{1,25}[0o]{1,25}[0o]{1,25}[p]{1,25})|([p]{1,25}[i!1l|]{1,25}[s5]{1,25}[s5]{1,25})|([ck<]{1,25}[uv]{1,25}[n]{1,25}[t]{1,25})|([ck<]{1,25}[o0]{1,25}[ck<]{1,25}[k]{1,25})|([a@]{1,25}[s5]{1,25}[s5]{1,25})|([p]{1,25}[e3]{1,25}[n]{1,25}[i!1l|]{1,25}[s5]{1,25})|([v]{1,25}[a4^@]{1,25}[g]{1,25}[i!1l|]{1,25}[n]{1,25}[a4^@]{1,25})|([n]{1,25}[i!1l|]{1,25}[g]{1,25}[e3]{1,25}[r]{1,25})|([b8]{1,25}[o0@]{1,25}[o0@]{1,25}[b8]{1,25}[s5]{1,25})|([p]{1,25}[o0@]{1,25}[o0@]{1,25}[p]{1,25})|([p]{1,25}[e3]{1,25})|([ck<]{1,25}[r]{1,25}[a4^@]{1,25}[p]{1,25})|([p]{1,25}[o0@]{1,25}[o0@]{1,25})|([t+]{1,25}[uv]{1,25}[r]{1,25}[d]{1,25})|([ck<]{1,25}[r]{1,25}[a4^@]{1,25}[ck<]{1,25}[ck<]{1,25})|([b8]{1,25}[o0]{1,25}[b8]{1,25})|([d]{1,25}[o0]{1,25}[d]{1,25}[yi]{1,25})|([t+]{1,25}[wu]{1,25}[a4^@]{1,25}[t+]{1,25})|([vu]{1,25}[vu]{1,25}[li|!]{1,25}[vu]{1,25}[a4^@]{1,25})|([c<]{1,25}[li|!]{1,25}[i!1l|]{1,25}[t+]{1,25})|([a4]{1,25}[s$]{1,25}[s$]{1,25})/i)
  	  errors.add(:name, "can't be obscene") 
  	end
	end
  
  def self.authenticate(email="", pass="")
    user = User.find_by_email(email)
    if user && user.password == Digest::SHA256.hexdigest(pass)
      return user
    else
      return false
    end
  end 
   
  private
  
  def create_password
    unless password.blank?
      self.password = Digest::SHA256.hexdigest(password)
    end
  end

  def clear_password
    self.password = nil
  end
  
end
