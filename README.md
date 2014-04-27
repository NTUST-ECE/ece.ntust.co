NTUST-ECE Web
=============

台灣科技大學電資學士班系網。

Made with ♥ by \[author name here\][^1], using [Middleman][1], [Haml][2], [SCSS][3], [CoffeeScript][4] and [Slim][5].

## Build

[image_optim](https://github.com/toy/image_optim)、middleman-imageoptim 需要系統 binaries 的支援，須依照 [這裡](https://github.com/toy/image_optim#binaries-installation) 的指示安裝相關套件以及 pngout[^2]。或將 `/config.rb` 裡的 `activate :imageoptim` 註解掉，否則 build 會噴 error。


```
bundle install
bower install
middleman build
```

## New Post

```
middleman article TITLE
```

## Style Guides

- See `.editorconfig`.
- [MVCSS](http://mvcss.github.io/)
- (html) 內文中的 `<img>` 必須用 `<div></div>` 或 `<p></p>` 包裹，不可直接插入。圖說可放在包裹元素中、接在 `<img>` 後。例如：(slim)

  ```
  p 
    = ll_img 'events/2013/xi-kao/00.png', 'love'
    | 愛你，你寂寞時便不寂寞。
  ```  
  或 `%p= image_tag 'events/2013/xi-kao/00.png'` (haml)
  
- 儘量使用 [lazyload](http://www.appelsiini.net/projects/lazyload) 處理 asset 的圖片，使用 LazyLoad helper[^3]：

  ```
  ll_img :src [,:alt_text]
  ```

### z-index 深度表

#### Desktop

- 10 Nav, Contents 等主要內容
- 1 Content 等主要內容容器
- 0 主要內容容器的背景
- -100 Hero



[1]: http://middlemanapp.com
[2]: http://haml.info
[3]: http://sass-lang.com
[4]: http://coffeescript.org
[5]: http://slim-lang.com

[^1]: [http://www.ign.com/videos/2011/03/25/portal-glados-quote-video-7](http://www.ign.com/videos/2011/03/25/portal-glados-quote-video-7)
[^2]: Mac 上的安裝法: [https://gist.github.com/Neson/11347265](https://gist.github.com/Neson/11347265)
[^3]: 位於 /helpers/lazy_load.rb