require "base64"
class Link < ActiveRecord::Base
  validates :destination, :format => URI::regexp(%w(http https))
  before_create :generate_slug

  def short_url
    "http://localhost:3000/#{self.slug}"
  end

  private

    def generate_slug
      letters =  self.destination.split.shuffle[0 .. 8].join
      self.slug = Base64.encode64(letters)[0,8]
    end
end
