# == Schema Information
#
# Table name: links
#
#  id              :integer          not null, primary key
#  product_id      :integer
#  expiration_date :datetime
#  downloads       :integer
#  downloads_limit :integer
#  custom_id       :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  email           :string
#

require 'rails_helper'

RSpec.describe Link, type: :model do
	it { should belong_to :product}
	it "should generate a custom_id" do
		link = FactoryGirl.create(:link)
		expect(link.custom_id).to_not be_nil
		puts link.custom_id
	end

	it "should send and email" do
		expect{
			FactoryGirl.create(:link)
		}.to change(ActionMailer::Base.deliveries,:count).by(1)
	end



	describe "#create_attachment_links" do	
		before :each do
			@product = FactoryGirl.create(:product)
			2.times do
				attachmet = FactoryGirl.create(:attachmet,product: @product)
			end
			@link = FactoryGirl.create(:link,product: @product)
		end
		it "should generate a link per product attachmet" do 
			expect{
				@link.create_attachment_links
			}.to change(LinkAttachment,:count).by(2)

		end

	end
end
