class Notification < ActiveRecord::Base
  attr_accessible :name, :site, :diff_url
  
  default_scope order("created_at DESC")
  
  validates :name, :site, :diff_url, presence: true
    
  def image_from_sitename
    path = "logo/" + site.gsub(/\.([^.]*)$/,".png")
    return Rails.application.assets.find_asset(path).nil? ? 'logo/default.png' : path
  end
end
