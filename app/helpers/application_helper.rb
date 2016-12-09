module ApplicationHelper
  def mapped_omniauth(provider)
    map = { :google_oauth2 => "Google" }
    map.fetch(provider)
  end
end
