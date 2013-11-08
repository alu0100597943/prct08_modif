require './lib/matriz.rb'

describe Matriz do
	before :each do
		@m1 = Matriz.new(2)
		@m1.fill([[1,2],[3,4]])
		@m2 = Matriz.new(2,3)
		@m2.fill([[1,2,5],[3,4,5]])
	end
	describe "#ALMACENAMIENTO" do
		it "Se almacena correctamente" do
			@m1.should eq([[1,2],[3,4]])
		end
	end
	describe "#OPERACIONES ARITMETICAS" do
		it "SUMA DE @M1 CONSIGO MISMA" do
			m = @m1+@m1
			m.should eq([[2,4],[6,8]])
		end
		it "RESTA DE @M1 CONSIGO MISMA" do
			m = @m1-@m1
			m.should eq([[0,0],[0,0]])
		end
		it "PRODUCTO DE @M1 CONSIGO MISMA" do
			m = @m1*@m1
			m.should eq([[7,10],[15,22]])
		end
	end
	describe "#OPERACIONES PROPIAS DE MATRICES" do
		it "TRANSPONER @M2" do
			m = @m2.trasp
			m.should eq([[1,3],[2,4],[5,5]])
		end
	end
	describe "#COMPARACION" do
		it "Comparacion entre matrices" do
			(@m1==@m1).should eq(true)
		end
	end
end
