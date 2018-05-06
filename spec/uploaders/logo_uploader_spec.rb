require 'rails_helper'
require 'carrierwave/test/matchers'

RSpec.describe LogoUploader do
    
    include CarrierWave::Test::Matchers

    let(:tipology) { create(:tipology) }
    let(:uploader) { LogoUploader.new(tipology, :logo) }

    before(:each) do
        LogoUploader.enable_processing = true
        File.open(Rails.root.join('spec', 'support', 'images', 'profile_picture.png')) { |f|
            uploader.store!(f) 
        }
    end

    after(:each) do
        LogoUploader.enable_processing = false
        uploader.remove!
    end

    context "versions" do
        it "scales down a landscape image to be exactly 25 by 25 pixels" do
            expect(uploader.dim_x25).to have_dimensions(25, 25)
        end

        it "scales down a landscape image to be exactly 50 by 50 pixels" do
            expect(uploader.dim_x50).to have_dimensions(50, 50)
        end

        it "scales down a landscape image to be exactly 100 by 100 pixels" do
            expect(uploader.dim_x100).to have_dimensions(100, 100)
        end

        it "scales down a landscape image to be exactly 200 by 200 pixels" do
            expect(uploader.dim_x200).to have_dimensions(200, 200)
        end

        it "scales down a landscape image to be exactly 300 by 300 pixels" do
            expect(uploader.dim_x300).to have_dimensions(300, 300)
        end
    end

    context "white list" do
        it "accept png file expension" do
            expect(uploader.extension_whitelist).to include("png")
        end

        it "accept jpg file expension" do
            expect(uploader.extension_whitelist).to include("jpg")
        end

        it "accept jpg file expension" do
            expect(uploader.extension_whitelist).to include("jpeg")
        end
    end

end