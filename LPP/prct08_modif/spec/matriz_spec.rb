require './lib/matriz.rb'
require './lib/racional.rb'

describe Matriz do
	before :each do
		@m1 = Matriz.new(2)
		@m1.fill([[1,2],[3,4]])
		@m2 = Matriz.new(2,3)
		@m2.fill([[1,2,5],[3,4,5]])
		@f1 = Fraccion.new(1,2)
		@f2 = Fraccion.new(1,3)
		@f3 = Fraccion.new(1,4)
		@f4 = Fraccion.new(1,5)
		@f5 = Fraccion.new(2,3)
		@f6 = Fraccion.new(3,4)
		@f7 = Fraccion.new(4,5)
		@m3 = Matriz.new(2)
		@m3.fill([[@f1,@f1],[@f1,@f1]])
		@m4 = Matriz.new(2)
		@m4.fill([[@f1,@f2],[@f3,@f4]])
		@m5 = Matriz.new(2)
		@m5.fill([[@f1,@f5],[@f6,@f7]])

	end
	describe "#ALMACENAMIENTO DE FRACCIONES EN MATRICES" do
		it "Se almacena correctamente" do
			@m4.should eq([[@f1,@f2],[@f3,@f4]])
		end
	end
	describe "#OPERACIONES ARITMETICAS CON FRACCIONES EN MATRICES" do
		it "SUMA DE @M4 CON @M5" do
			m = @m4+@m5
			m.should eq([[1,1],[1,1]])
		end
		it "RESTA DE @M3 CON @M3" do
			m = @m3-@m3
			m.should eq([[0,0],[0,0]])
		end
		it "PRODUCTO DE @M4 CON @M5" do
			m = @m4*@m5
			f1 = Fraccion.new(1,2)
			f2 = Fraccion.new(3,5)
			f3 = Fraccion.new(11/40)
			f4 = Fraccion.new(49/150)
			m.should eq([[f1,f2],[f3,f4]])
		end
	end
	describe "#OPERACIONES PROPIAS DE MATRICES" do
		it "TRANSPONER @M4" do
			m = @m4.trasp
			m.should eq([[@f1,@f3],[@f2,@f4]])
		end
	end
	describe "#COMPARACION" do
		it "Comparacion entre matrices" do
			(@m3==@m3).should eq(true)
		end
	end
end
