class Evaluator
  def self.exacts(zipped_array)
    zipped_array.select{|x| x[0] == x[1]}.count
  end

  def self.partials(zipped_array)
    zipped_array.select!{|x| x[0] != x[1]}
    comp, user = zipped_array.transpose

    partials = comp&user
    partials.count
  end
end
