require 'csv'

contents = CSV.open "strengths.csv", headers: true, header_converters: :symbol
File.open("out.txt", 'w') do |f|
  contents.each do |row|
    headers = contents.headers
	  name = row[0]
    strength = {}
	  i = 1
    while i < row.length
      if row[i]
        strength[(row[i].to_i)] = i
      end
      i += 1
    end
    f.write("#{name} \n")
    stren = strength.sort_by { |k, v| k }
  
    stren.each do |k,v|
      f.write("\t #{headers[v].to_s.capitalize} \n")
    end
    f.write("\n")
  end
end

