module CLI
  class Banner
    BANNER_FILE = File.expand_path('./banner.txt', __dir__)

    def self.render
      File.foreach(BANNER_FILE) { |line| puts line }
    end
  end
end