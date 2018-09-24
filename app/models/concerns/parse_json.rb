
module ParseJson

  def parse_json(response)
    JSON.parse(response.body)
  end

end
