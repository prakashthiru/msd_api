object false
node :items do
  @items.map do |item|
    {
      id: item['id'],
      brand: item['brand'],
      color: item['colors'],
      date: Time.at(item['dateAdded'])
    }
  end
end
