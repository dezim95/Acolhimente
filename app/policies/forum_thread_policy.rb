class ForumThreadPolicy < ApplicationPolicy
  def destroy?
    user.has_role?(:admin) || user.has_role?(:volunteer) # verifica se o usuário tem o papel de admin ou volunteer
  end

  def update?
    user.has_role?(:admin) || user.has_role?(:volunteer) # verifica se o usuário tem o papel de admin ou volunteer
  end

  def edit?
    user.has_role?(:admin) || user.has_role?(:volunteer) # verifica se o usuário tem o papel de admin ou volunteer
  end
end
