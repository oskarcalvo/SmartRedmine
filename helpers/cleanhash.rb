module CleanHash

  def cleanhash(hash)
    newhash = Hash.new
    hash.each do |nv_pair|
      option_name = nv_pair['name']
      option_value = nv_pair['id']
      newhash[option_value] = option_name
    end
    newhash
  
  end
  module_function :CleanHash

end
