module ErrorPagesHelper
  def inline_pack_tag(asset)
    file_path = 'public' + asset_pack_path(asset)
    content = File.read(file_path)
    if asset.include?('.js')
      "<script type='text/javascript'>#{content}</script>".html_safe
    else
      "<style type='text/css'>#{content}</style>".html_safe
    end
  end
end
