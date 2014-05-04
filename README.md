NTUST-ECE Web
=============

台灣科技大學電資學士班系網。

Made with ♥ by \[author name here\]*1, using [Middleman][1], [Haml][2], [SCSS][3], [CoffeeScript][4] and [Slim][5].

## Build

注意：[image_optim](https://github.com/toy/image_optim) & middleman-imageoptim 需要系統 binaries 的支援，須依照 [這裡](https://github.com/toy/image_optim#binaries-installation) 的指示安裝相關套件以及 pngout*2。或將 `/config.rb` 裡的 `activate :imageoptim` 註解掉，否則 build 會噴 error。

```
bundle install
bower install
middleman build
```

若單純更新文本內容，可將 `activate :imageoptim` 關掉節省時間。

## New Post

```
middleman article TITLE
```

## Style Guides

### General

- 若只是單純更新內容 (沒動到 core layout, css, js)，commit message 請加上 `Update#  ` 的 prefix
- See & use `.editorconfig`.

### HTML、CSS、JS 架構

- build 出單一 CSS、單一 JS 為原則 (使用 [assets pipeline](http://middlemanapp.com/basics/asset-pipeline/))
- SCSS 依照 [MVCSS](http://mvcss.github.io/) 的架構

### Content、Assests

- html 內文中的 `<img>` 必須用 `<div></div>` 或 `<p></p>` 包裹，不可直接插入。圖說可放在包裹元素中、接在 `<img>` 後。例如：(slim)

  ```slim
  p 
    = ll_img 'events/2013/xi-kao/00.png', 'love'
    | 愛你，你寂寞時便不寂寞。
  ```  
  或 `%p= image_tag 'events/2013/xi-kao/00.png'` (haml)

- 別放太多圖片進 asset，可以的話儘量外連。
- 儘量使用 [lazyload](http://www.appelsiini.net/projects/lazyload) 動態載入圖片，可用 LazyLoad helper (`ll_img`)*3：

  ```
  ll_img :src [,:alt_text] # 適用於 asset image，路徑表示法與 image_tag 同，不用提供寬&高
  ll_img :src, :width, :height, [,:alt_text] # 適用於外連圖片，必須提供寬&高
  ```
  e.g. (Slim)
  
  ```
  .pull-left.box= ll_img "http://i.imgur.com/RQ1dZ00.png", "2107px", "1277px", "2013 系烤"
  ```

### css z-index 深度表

#### Desktop

- 100+ 滑鼠觸發區
- 10 Nav, Contents 等主要內容
- 2~5 裝飾品、陰影 ...etc.
- 1 Content 等主要內容的容器
- 0 主要內容容器的背景
- -100 Hero


[1]: http://middlemanapp.com
[2]: http://haml.info
[3]: http://sass-lang.com
[4]: http://coffeescript.org
[5]: http://slim-lang.com

- - -

註：

\*1: [http://www.ign.com/videos/2011/03/25/portal-glados-quote-video-7](http://www.ign.com/videos/2011/03/25/portal-glados-quote-video-7)  
\*2: Mac 上的安裝法: [https://gist.github.com/Neson/11347265](https://gist.github.com/Neson/11347265)  
\*3: 位於 /helpers/lazy_load.rb