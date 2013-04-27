module UrlsHelper
  def full_url(secret_token)
    secret_url(:id => secret_token)
  end
end
