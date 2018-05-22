require 'rails_helper'

RSpec.describe Url, :type => :model do
  context "When testing, the Url " do

    it "should expire 5 minutes after its creation" do
      url = Url.new link: "https://www.google.com"
      url.save
      status = Url.expired(url)
      if Time.now > url.created_at + 5.minutes
        expect(status).to eq false
      else
        expect(status).to eq false
      end
    end

  end
end
