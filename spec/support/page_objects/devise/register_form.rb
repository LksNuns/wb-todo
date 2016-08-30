class RegisterForm
  include Capybara::DSL

  def visit_page
    visit('/users/sign_up')
    self
  end

  def fill(params = {})
    form do
      fill_in('E-mail', with: params.fetch(:email, 'user@user.com'))
      fill_in('Password', with: params.fetch(:password, 'password123'))
      fill_in('Name', with: params.fetch(:password, 'name'))
      fill_in('Confrim Password', with: params.fetch(:confirm_password, 'password123'))
    end
    self
  end

  def submit
    form do
      click_on('Sign Up')
    end
    self
  end

  private

  def form
    within("#new_user") { yield }
    self
  end

end
