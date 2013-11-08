require './lib/racional.rb'
#Definicion de la clase matriz:

class Matriz

	attr_reader :fil, :col, :matriz
	
	def initialize(fil,col=fil)
		@fil, @col = fil, col
		@matriz = Array.new(fil){Array.new(col)}
	end

	def fill(array=nil)
		if(array != nil)
			@fil.times do |i|
				@col.times do |j|
					@matriz[i][j] = array[i][j]
				end
			end
		else
			p_rand = Random.new()
			@fil.times do |i|
				@col.times do |j|
					@matriz[i][j] = p_rand.rand(30)
				end
			end
		end
	end
	
	def +(other)
		if(other.is_a?Matriz)
			result = Array.new(@fil){Array.new(@col) {0}}
			@fil.times do |i|
				@col.times do |j|
	                result[i][j] = @matriz[i][j] + other.matriz[i][j]
			    end
			end
			r = Matriz.new(@fil,@col)
			r.fill(result)
			r
		end
	end

	def -(other)
		if(other.is_a?Matriz)
			result = Array.new(@fil){Array.new(@col) {0}}
			@fil.times do |i|
				@col.times do |j|
	                result[i][j] = @matriz[i][j] - other.matriz[i][j]
			    end
			end
			r = Matriz.new(@fil,@col)
			r.fill(result)
			r
		end
	end

	def *(other)
		if(other.is_a?Matriz)
			result = Array.new(@fil){Array.new(@col) {0}}
			@fil.times do |i|
				other.col.times do |j|
					if(@matriz[0][0].is_a?Fraccion)
						aux = Fraccion.new(0,1)
					else
						aux = 0
					end
                    @col.times do |k|
                        aux += @matriz[i][k] * other.matriz[k][j]
                    end
                    result[i][j] = aux
			    end
			end
			r = Matriz.new(@fil,@col)
			r.fill(result)
			r
		end
	end
	
	def to_s
		pr = ""
        @fil.times do |i|
                @col.times do |j|
                        pr << "#{@matriz[i][j]} "
                end
                pr << "\n"
        end
        pr
	end
	
	def ==(other)
		cont = 0
		@fil.times do |i|
			@col.times do |j|
				if(other.is_a?Matriz)
					if(@matriz[i][j] == other.matriz[i][j])
						cont += 1
					end
				else
					if(@matriz[i][j] == other[i][j].to_i)
						cont += 1
					end
				end
			end
		end
		if(cont == @fil*@col)
			return true
		else
			return false
		end
	end

	def trasp
		result = Array.new
		@col.times do |i|
			fila = Array.new
			@fil.times do |j|
                fila << @matriz[j][i]
		    end
		    result << fila
		end
		r = Matriz.new(@col,@fil)
		r.fill(result)
		r
	end

end

if __FILE__ == $0
	f1 = Fraccion.new(1,2)
	f2 = Fraccion.new(1,3)
	f3 = Fraccion.new(1,4)
	f4 = Fraccion.new(1,5)
	
	f5 = Fraccion.new(1,2)
	f6 = Fraccion.new(2,3)
	f7 = Fraccion.new(3,4)
	f8 = Fraccion.new(4,5)

	m1 = Matriz.new(2)
	m1.fill([[f1,f2],[f3,f4]])

	m2 = Matriz.new(2)
	m2.fill([[f5,f6],[f7,f8]])

	m3 = m1 + m2
	m4 = m1 * m2

	puts m3
	puts
	puts m4
end
