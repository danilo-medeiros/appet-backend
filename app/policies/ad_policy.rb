class AdPolicy
  attr_reader :user, :ad

  def initialize(user, ad)
    @user = user
    @ad = ad
  end

  def update?
    created_by_current_user?
  end

  def picture?
    created_by_current_user?
  end

  def destroy?
    created_by_current_user?
  end

  private

  def created_by_current_user?
    @user.id == @ad.created_by
  end
end