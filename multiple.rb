array = [
{:GOO => 15, :MMM => 14, :ADBE => 12, :EA=> 13, :BA => 8, :KO => 10, :XOM => 20, :GPS => 7, :MCD => 11, :DIS => 15, :CRM => 6, :JNJ => 10 },
{:GOO => 8, :MMM => 20, :ADBE => 3, :EA=> 10, :BA => 5, :KO => 19, :XOM => 12, :GPS => 6, :MCD => 15, :DIS => 9, :CRM => 10, :JNJ => 17 },
{:GOO => 3, :MMM => 8, :ADBE => 15, :EA=> 5, :BA => 10, :KO => 5, :XOM => 15, :GPS => 13, :MCD => 10, :DIS => 18, :CRM => 5, :JNJ => 14 },
{:GOO => 17, :MMM => 3, :ADBE => 6, :EA=> 9, :BA => 15, :KO => 6, :XOM => 8, :GPS => 1, :MCD => 10, :DIS => 15, :CRM => 18, :JNJ => 3 },
{:GOO => 8, :MMM => 18, :ADBE => 4, :EA=> 6, :BA => 15, :KO => 18, :XOM => 3, :GPS => 12, :MCD => 19, :DIS => 3, :CRM => 7, :JNJ => 9 },
{:GOO => 10, :MMM => 12, :ADBE => 8, :EA=> 3, :BA => 18, :KO => 20, :XOM => 5, :GPS => 11, :MCD => 3, :DIS => 9, :CRM => 8, :JNJ => 15 },
{:GOO => 17, :MMM => 14, :ADBE => 2, :EA=> 17, :BA => 7, :KO => 13, :XOM => 1, :GPS => 15, :MCD => 15, :DIS => 10, :CRM => 9, :JNJ => 17 }
]


def multiple(n)
	i = 0
	array = []
	n.times{|x|
		if (x % 3 == 0) || (x % 5 == 0)
			array[i] = x.to_i
			i += 1
		end
	}
	return array
end

def sum (ar)
	return ar.inject(0, :+)
end

def multipl_by_3_and_5(m)
	sum(multiple(m))
end

def chiffre_de_cesar(str, n)
	i = 0
	arr2 = []
	arr = str.split('')
	arr.each{|x| 
		if x =~ /[A-Z]/
			unless (x.ord + n) > 90 
				arr2[i] = ((x.ord) + n).chr
			else
				arr2[i] = (65 + (((x.ord) + n) - 90) - 1).chr
			end
		elsif x =~ /[a-z]/
			unless (x.ord + n)  > 122
				arr2[i] = ((x.ord) + n).chr
			else
				arr2[i] = (97 + (((x.ord) + n) - 122) - 1).chr
			end
		else
			arr2[i] = x
		end
		i += 1
	}
	return arr2.join('')
end


def trader_du_dimanche(array)
	b = 0
	c = 0
	d = 0
	e = 0
	array.each{|x|
		d += 1
		(array.length - d).times{|y|
			if array[y+d] - x > c
				b = array[y+d]
				c = b.to_i - x
				e = x
			end
		}
	}
	a = array.join('')
	a = ((0..array.length).to_a).zip(array).to_h
	return "[#{a.rassoc(e)[0]}, #{a.rassoc(b)[0]}] $#{b} - $#{e} = $#{c}"
end

def txt_to_str(fichier)
	data = ''
	f = File.open(fichier, 'r')
	f.each_line do |line|
		data += line
	end
	return data
end

def jean_michel_data(str, dic)
	arr = str.split(" ")
	arr.each{|z| z.downcase!}
	arr_n_2 = Hash.new(0)
	dic.each do |x|
		arr.each do |y| 
			if (y =~ /#{x}/) != nil
				arr_n_2[x] += 1
			end
		end
	end
	return arr_n_2
end

def trade_du_lundi(array)
	arry = array.flat_map{|a| a.keys}.uniq
	(array[0].length).times{|j|
		ar = array.flat_map{|b| b.values[j]}
		puts "#{arry[j]} : #{trader_du_dimanche(ar)}"
	}
end

def shakespear(txt, dic)
	str = txt_to_str(txt)
	arr = str.split(" ")
	arr.each{|z| z.downcase!}
	arr__2 = Hash.new(0)
	dic.each do |x|
		arr.each do |y| 
			if (y =~ /#{x}/) != nil
				arr__2[x] += 1
			end
		end
	end
	return arr__2
end

def couqun(txt)
	arr = txt_to_str('grosmot.txt').split(" ")
	puts shakespear(txt, arr)
end

dictionary = ["below", "down", "go", "going", "horn", "how", "howdy", "it", "i", "low", "own", "part", "partner", "sit"]

dictionnary = ["the", "of", "and", "to", "a", "in", "for", "is", "on", "that", "by", "this", "with", "i", "you", "it", "not", "or", "be", "are"]

#puts multipl_by_3_and_5(1000)

#puts chiffre_de_cesar("What a string!", 5)

#puts trade_du_lundi(array)

puts jean_michel_data("Howdy partener, sit down! How's it going", dictionary).to_s 

#puts shakespear("shakespear.txt", dictionnary)

couqun("shakespear.txt")