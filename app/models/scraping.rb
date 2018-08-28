class Scraping
   
    # all_nameは価格コムサイトのclass=item+numberfor文内で利用できる
    def self.get_image(all_name)
        # 画像を取得
        category_image = all_name.css('.itemphoto a img')
        image = category_image.attribute('data-original').value
        return image
    end
    
    def self.get_name(all_name)
        # 名前を取得
        name = all_name.css('p').inner_text
        return name
    end
    
    def self.get_size(all_name, explanation)
        # sizeを取得
        name = all_name.css('p').inner_text
        if name.match(/6E|6e|eeeeee/)
            size = 6
        elsif explanation.match(/6E|6e|eeeeee/)
            size = 6
        end
        if name.match(/5E|5e|eeeee/)
            size = 5
        elsif explanation.match(/5E|5e|eeeee/)
            size = 5
        end
        if name.match(/4E|4e|eeee/)
            size = 4
        elsif explanation.match(/4E|4e|eeee/)
            size = 4
        end
        if name.match(/3E|3e|eee/)
            size = 3
        elsif explanation.match(/3E|3e|eee/)
            size = 3
        end    
        if name.match(/2E|2e|ee/)
            size = 2
        elsif explanation.match(/2E|2e|ee/)
            size = 2
        end
        if name.match(/1E|1e/)
            size = 1
        elsif explanation.match(/1E|1e/)
            size = 1
        end
        return size
    end
    
    def self.get_type(all_name, explanation)
        # typeを取得
        if name.match(/ウォーキング/)
            type = 'ウォーキング'
        elsif explanation.match(/ウォーキング/)
            type = 'ウォーキング'
        end
        if name.match(/カジュアル/)
            type = 'カジュアル'
        elsif explanation.match(/カジュアル/)
            type = 'カジュアル'
        end
        if name.match(/ランニング/)
            type = 'ランニング'
        elsif explanation.match(/ランニング/)
            type = 'ランニング'
        end
        return type
    end
   
   def self.get_content()
        thisurl = "http://kakaku.com"
        page_url = "/search_results/%8CC%81E%83V%83%85%81%5B%83Y/"
        for page in 1..2 do 
            url = thisurl + page_url
            charset = nil
            html = open(url) do |f|
                charset = f.charset # 文字種別を取得
                f.read # htmlを読み込んで変数htmlに渡す
            end
            doc = Nokogiri::HTML.parse(html.toutf8, nil, 'utf-8')
      
            for i in 1..30 do
                str_num = i.to_s
                fixed_num = "%02d" % str_num 
                all_name = doc.css('.item'+fixed_num)
                explanation = all_name.css('li.searchitem').inner_text
                
                name = get_name(all_name)
                image = get_image(all_name)
                size = get_size(all_name, explanation)
                type = get_type(all_name, explanation)
               
                shoe = Shoe.where(pic: image, name: name, size_id: size, type_id: type).first_or_initialize
                shoe.save
               
            end
            next_html = doc.css('.pagenation > ul > li.nextPage a')
            # unless next_html
            page_url = next_html.attribute('href')
            
            
            
        end
    end
end
