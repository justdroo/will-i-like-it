class Search
  require 'rest-client'

  def initialize
    @baseURI = "https://api.untappd.com/v4"
    @bid_endpoint = "/beer/info/"
    @name_endpoint = "/search/beer"
    @key = "?client_id=89F896A85DA50275AF3DD06FD8E6A12215A69A9E&client_secret=6F6A475729C06DABC5D9EECD6CA9C0391317D074 "
  end

  def by_bid(bid)
    url = @baseURI + @bid_endpoint + bid + @key
    response = RestClient.get(url)
    beer_hash = JSON.parse(response)
    final_beer = parse_beer(beer_hash)
  end

  def by_name(name)
    url = @baseURI + @name_endpoint + @key + "&q=" + name
    response = RestClient.get(url)
    beer_hash = JSON.parse(response)
    final_beer = parse_beer(beer_hash)
  end

  def parse_beer(new_beer)
    beer = new_beer["response"]["beer"]

    raw_beer = {
      bid: beer["bid"],
      name: beer["beer_name"],
      label: beer["beer_label"],
      abv: beer["beer_abv"],
      ibu: beer["beer_ibu"],
      description: beer["beer_description"],
      style: beer["beer_style"],
      slug: beer["beer_slug"],
      rating: beer["rating_score"],
      brewery_name:  beer["brewery"]["brewery_name"],
      brewery_state: beer["brewery"]["location"]["brewery_state"]
    }
  end

end
