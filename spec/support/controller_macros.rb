module ControllerMacros
  def login_admin
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:admin]
      sign_in FactoryBot.create(:admin) # Using factory girl as an example
    end
  end

  def login_signaler
      @request.env["devise.mapping"] = Devise.mappings[:signaler]
      signaler = FactoryBot.create(:signaler)
      sign_in signaler
  end
end