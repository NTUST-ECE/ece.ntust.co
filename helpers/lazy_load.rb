# This requires jquery_lazyload and activate :automatic_image_sizes
module LazyLoad
  def ll_img(src, alt="")
    img_t = image_tag src, :alt => alt, :class => 'lazy'
    img_t_org = image_tag src, :alt => alt, :class => 'lazy'
    img_t.sub! ' src="', ' data-original="'
    img_t = img_t.chomp('>').chomp('/').chomp(' ') + ' src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsQAAA7EAZUrDhsAAAANSURBVBhXYzh8+PB/AAffA0nNPuCLAAAAAElFTkSuQmCC">'
    return img_t + '<noscript>' + img_t_org + '</noscript>'
  end
end
