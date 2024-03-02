class Storage
  def initialize(data_type)
    @filename = "/tmp/#{data_type}.txt"
  end

  def save(data)
    file = File.open(@filename, 'a+t')
    Marshal.dump(data, file)
  end

  def load
    file = File.open(@filename, 'rt')
    Marshal.load(file)
  end
end