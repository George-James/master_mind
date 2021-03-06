class Evaluator
  def self.exacts(zipped_array)
    zipped_array.select{|x| x[0] == x[1]}.count
  end

  def self.partials(zipped_array)
    # Remove all the exact match
    zipped_array.select!{|x| x[0] != x[1]}
    # Seperate computer from user
    comp, user = zipped_array.transpose
    partials = []
    if(user !=nil)
      user.each do |a|
            if comp.include? a
              comp.delete_at(comp.index(a))
              partials << a
            end
      end
    end
    partials.size
  end

  def self.format_time(total_time)
    if(total_time > 60)
      total_time = "#{total_time/60}m#{(total_time%60).to_i}s"
    else
      total_time ="#{total_time.to_i}s"
    end
  end
end
