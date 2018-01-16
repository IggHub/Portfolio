module DefaultPageContent
  extend ActiveSupport::Concern

  included do
    before_action :set_title
  end

  def set_title
    @page_title = "Dev Portfolio | My Portfolio"
    @seo_keywords = "Igor Irianto portfolio"
  end
end
