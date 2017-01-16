class Scraping
  def self.urls
    image_urls = []
    agent = Mechanize.new
    page = agent.get("https://www.min-breeder.com/dogSearch.php")

    breeds = page.search('.pic_kind_name')
    image_imgs = page.search('.pic_image img')
    image_imgs.each do |img|
      image_urls << img.get_attribute('src')
    end
    num = 0

    breeds.each do |breed|
      image_url = image_urls[num]
      br = breed.inner_text
      pet = Pet.new(breed: br, image_url: image_url)
      pet.save
      num = num + 1
    end
  end
end