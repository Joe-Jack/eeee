require 'nokogiri'
require 'open-uri'
require 'kconv'
require 'pry'

url = "http://kakaku.com/search_results/%8CC%81E%83V%83%85%81%5B%83Y/"
charset = nil
html = open(url) do |f|
  charset = f.charset # 文字種別を取得
  f.read # htmlを読み込んで変数htmlに渡す
end
doc = Nokogiri::HTML.parse(html.toutf8, nil, 'utf-8')

# whole_shoes = []

for i in 1..10 do
    # one_shoes = []
    str_num = i.to_s
    fixed_num = "%02d" % str_num 
    all_name = doc.css('.item'+fixed_num)
    explanation = all_name.css('li.searchitem').inner_text
    
    # # 画像取得
    # category_image = all_name.css('.itemphoto a img')
    # image = category_image.attribute('data-original').value
    
    
    category_link = all_name.css('div.iviewbtn a')
    link = category_link.attribute('href').value
    #main > div.itemtblList.onjs > div.item.item01.clearfix > div > div.itemInfo > div > div.iviewbtn > a
    p link
    
end
