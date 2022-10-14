class ApplicationController < ActionController::Base
  # Callback para verificar se usuário é admin
  def authorize_admin
    return if current_user.admin_role?

    redirect_to root_path, alert: t('authorize_role_message')
  end
end
