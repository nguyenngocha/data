fileja_in = File.open ARGV[0], "r"
fileja_out = File.open ARGV[0].gsub("ja", "out.ja") , "w"
fileen_in = File.open ARGV[1], "r"
fileen_out = File.open ARGV[1].gsub("en", "out.en"), "w"

class String
  def is_blank?
    self.to_s == "\n"
  end
  def escape?
    !(self.to_s =~ /[a-zA-Z]/).nil?
  end
  def too_long?
    words = self.split()
    words.each do |word|
      return true if word.length > 20
    end
    return false
  end
end

fileja_in.each.zip(fileen_in.each).each do |ja, en|
  unless en.to_s.is_blank?
    unless ja.to_s.escape? && en.too_long?
      fileen_out.print en
      fileja_out.print ja
    end
  end
end

#call: ruby escape_space_en.rb <.ja> <.vi>

