# This requires jquery_lazyload and activate :automatic_image_sizes
module LazyLoad
  def ll_img(src, alt="")
    img_t = image_tag src, :alt => alt, :class => 'lazy'
    img_t_org = image_tag src, :alt => alt, :class => 'lazy'
    img_t.sub! ' src="', ' data-original="'
    img_width = img_t.scan(/width="([0-9]+)/)[0]
    img_width = img_width && img_width[0]
    img_height = img_t.scan(/height="([0-9]+)/)[0]
    img_height = img_height && img_height[0]
    img_t = img_t.chomp('>').chomp('/').chomp(' ') + ' src="http://placehold.it/' + img_width + 'x' + img_height + '/bbbbbb/bbbbbb">'
    return '<noscript>' + img_t_org + '</noscript>' + img_t
  end
end
