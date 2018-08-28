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
    
    # 画像取得
    category_image = all_name.css('.itemphoto a img')
    image = category_image.attribute('data-original').value
    
    # 商品名取得
    # name = all_name.css('p').inner_text
    
    # サイズ取得
    # if name.match(/4E|4e|eeee/)
    #     size = '4E'
    # elsif explanation.match(/4E|4e|eeee/)
    #     size = '4E'
    
    # end
    # if name.match(/3E|3e|eee/)
    #     size = '3E'
    # elsif explanation.match(/3E|3e|eee/)
    #     size = '3E'
    
    # end    
    
    # type別取得
    # if name.match(/ウォーキング/)
    #     type = 'ウォーキング'
    # elsif explanation.match(/ウォーキング/)
    #     type = 'ウォーキング'
    # end
    # if name.match(/カジュアル/)
    #     type = 'カジュアル'
    # elsif explanation.match(/カジュアル/)
    #     type = 'カジュアル'
    # end
    # if name.match(/ランニング/)
    #     type = 'ランニング'
    # elsif explanation.match(/ランイング/)
    #     type = 'ランニング'
   
    # end
   
    p image
    
end
