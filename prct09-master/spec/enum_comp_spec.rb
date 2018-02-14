require 'spec_helper'
require 'gem'

describe LinkedList do
    before :each do
        @var1 = Bibliography.new(["Dave Thomas", "Andy Hunt", "Chad Fowler"],"Programming Ruby 1.9 & 2.0: The Pragmatic Programmers Guide","The Facets of Ruby","Pragmatic Bookshelf",4,"July 7, 2013",["9781937785499","1937785491"])
        @var2 = Bibliography.new(["Scott Chacon"],"Pro Git 2009th Edition","Pro","Apress",2009,"August 27, 2009",["9781430218333","1430218339"])
        @var3 = Bibliography.new(["David Flanagan", "Yukihiro Matsumoto"],"The Ruby Programming Language","O'Reilly Media",1,"February 4, 2008",["0596516177","9780596516178"])
        @var4 = Bibliography.new(["David Chelimsky", "Dave Astels", "Bryan Helmkamp", "Dan North", "Zach Dennis", "Aslak Hellesoy"],"The RSpec Book: Behaviour Driven Development with RSpec,Cucumber, and Friends","The Facets of Ruby","Pragmatic Bookshelf",1,"December 25, 2010",["1934356379","9781934356371"])
        @var5 = Bibliography.new(["Richard E"], "Silverman Git Pocket Guide","O'Reilly Media",1,"(August 2, 2013)",["1449325866","9781449325862"])
        @list1 = LinkedList.new([@var1,@var2,@var3])
        @list2 = LinkedList.new([@var3])
        @list3 = LinkedList.new([@var4])
        @list4 = LinkedList.new([])
    end
    describe "Pruebas con la Lista Enumerable" do
        it "comprobrando el metodo all?" do
            expect(@list1.all?).to eq(true)
        end
      
        it "comprobrando el metodo any?" do
            expect(@list2.any?).to eq(true)
            expect(@list4.any?).to eq(false)
        end 

        it "comprobrando el metodo collect" do
            expect(@list2.collect{|i| i.to_s}).to eq([@var3.to_s])
        end

        it "comprobrando el metodo count" do
            expect(@list1.count).to eq(3)
        end

        it "comprobrando el metodo find" do
            expect(@list1.find {|i| i == @var2}).to eq(@var2)
        end
        
        it "Comprobamos el metodo find con una expectativa falsa" do
            expect(@list3.find {|i| i == @var3}).to eq(nil)
        end
    end
end

describe Bibliography do
    before :each do
        @var1 = Bibliography.new(["Dave Thomas", "Andy Hunt", "Chad Fowler"],"Programming Ruby 1.9 & 2.0: The Pragmatic Programmers Guide","The Facets of Ruby","Pragmatic Bookshelf",4,"July 7, 2013",["9781937785499","1937785491"])
        @var2 = Bibliography.new(["Scott Chacon"],"Pro Git 2009th Edition","Pro","Apress",2009,"August 27, 2009",["9781430218333","1430218339"])
        @var3 = Bibliography.new(["David Flanagan", "Yukihiro Matsumoto"],"The Ruby Programming Language","O'Reilly Media",1,"February 4, 2008",["0596516177","9780596516178"])
        @var4 = Bibliography.new(["David Chelimsky", "Dave Astels", "Bryan Helmkamp", "Dan North", "Zach Dennis", "Aslak Hellesoy"],"The RSpec Book: Behaviour Driven Development with RSpec,Cucumber, and Friends","The Facets of Ruby","Pragmatic Bookshelf",1,"December 25, 2010",["1934356379","9781934356371"])
        @var5 = Bibliography.new(["Richard E"], "Silverman Git Pocket Guide","O'Reilly Media",1,"(August 2, 2013)",["1449325866","9781449325862"])
        @var6 = Bibliography.new(["Richard E"], "Silverman Git Pocket Guide","O'Reilly Media",2,"(August 2, 2013)",["1449325866","9781449325862"])
    end
       
    describe "Pruebas con la Bibliography Comparable" do
        it "Comparamos por orden alfabetico" do
            expect(@var1 < @var2).to eq(false)
        end
        
        it "Comprobamos la comparacion de 2 elementos que inicializan igual" do
            expect(@var4 >= @var3).to eq(true)
        end

        it "Comprobamos la igualdad" do
            expect(@var2 == @var2).to eq(true)
        end

        it "Comprobamos la igualdad con valores diferentes" do
            expect(@var3 == @var4).to eq(false)
        end
        
        it "Comprobamos con 2 entradas iguales pero cambia el valor de la edicion" do
            expect(@var5 == @var6).to eq(false)
        end
        
        it "Comprobamos la comparacion con 2 entradas iguales, salvo la edicion" do
            expect(@var5 <= @var6).to eq(false)
        end
        
        it "prueba para el travis new" do
            expect(@var5 == @var6).to eq(false)
        end
    end
end
