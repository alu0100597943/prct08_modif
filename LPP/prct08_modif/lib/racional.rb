class Fraccion
	include Comparable
	attr_reader :n, :d
	def initialize(num,den)
		@n,@d = num.to_i , den.to_i
	end
#<<<<<<< HEAD

	def to_s
		"#{@n} / #{@d}"
	end

	def gcd(u, v)
	  u, v = u.abs, v.abs
	  while v != 0
	    u, v = v, u % v
	  end
	  u
	end

	def simply
		n = @n/gcd(@n,@d)
		d = @d/gcd(@n,@d)
		@n, @d = n, d
	end

	def +(other)
		n = @n*other.d+@d*other.n
		d = @d*other.d
		Fraccion.new(n/gcd(n,d),d/gcd(n,d))
	end

	def -(other)
		n = @n*other.d-@d*other.n
		d = @d*other.d
		Fraccion.new(n/gcd(n,d),d/gcd(n,d))
		
		
	end

	def *(other)
		n = @n*other.n
		d = @d*other.d
		Fraccion.new(n/gcd(n,d),d/gcd(n,d))
	end

	def /(other)
		n = @n*other.d
		d = @d*other.n
		Fraccion.new(n/gcd(n,d),d/gcd(n,d))
	end
	def <=> (other)
		(@n.to_f / @d)<=>(other.n.to_f / other.d)
	end
/
	def ==(other)
		check = false
		if(@n == other.n && @d == other.d)
			check = true
		·end
	end

	def <(other)
		a = @n*other.d
		b = @d*other.n
		check = false
		if(a < b)
			check = true
		end
		check
	end

	def >(other)
		a = @n*other.d
		b = @d*other.n
		check = false
		if(a > b)
			check = true
		end
		check
	end

	def <=(other)
		check = false
		if(self == other || self < other)
			check = true
		end
		check
	end

	def >=(other)
		check = false
		if(self == other || self > other)
			check = true
		end
		check
	end
/
	def imp_to_mix
		base = @n/@d
		num = @n % @d
		"#{base} + #{num}/#{@d}"
	end

	def recip
		Fraccion.new(@d,@n)
	end
#=======
	def num
		@n
	end
	def denom
		@d
	end
	def to_s
	
		"#{@n} / #{@d}"
	end
	def float
		
		"#{@n.to_f/@d}"
	end
	def fabs
		if @n < 0
			@n=@n*(-1)
		end
		if @d < 0
			@d = @d*(-1)
		end
		self.to_s
#>>>>>>> origin/test_alderete
	end
	def op
		Fraccion.new(-@n,@d)	 
	end
	def %(other)
		f1=self.n.to_f/self.d
		f2=other.n.to_f/other.d
		f1%f2
	end
end





