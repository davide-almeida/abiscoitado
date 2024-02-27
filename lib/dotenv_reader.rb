class DotenvReader
  def self.load
    dotenv_path = File.expand_path('../../.env', __FILE__)

    if File.exist?(dotenv_path)
      File.readlines(dotenv_path).each do |line|
        key, value = line.strip.split('=', 2)
        ENV[key] = value
      end
    else
      raise "O arquivo .env não foi encontrado. =/"
    end
  end
end
