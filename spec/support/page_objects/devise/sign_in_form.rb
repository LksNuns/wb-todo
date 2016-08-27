class SignInForm
  include Capybara::DSL

  def visit_page
    visit('/users/sign_in')
    self
  end

  def fill(user)
    form do
      fill_in('E-mail', with: user.email)
      fill_in('Password', with: user.password )
    end
    self
  end

  def submit
    form do
      click_on('Sign In')
    end
    self
  end

  private

  def form
    within(".panel-body") { yield }
    self
  end
end
