module ApplicationHelper
  def make_active_if_it_matches given_url
    "active" if given_url == request.original_fullpath
  end
end
