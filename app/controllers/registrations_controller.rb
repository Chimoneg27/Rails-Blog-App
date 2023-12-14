class RegistrationsController < Devise::RegistrationsController
  def create
    super do |resource|
      resource.posts_counter = 0 if resource.valid?
    end
  end
end
