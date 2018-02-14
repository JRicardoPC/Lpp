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
            
        
    end
    
    describe "Prueba de los pop" do
        it "Hacemos un pop" do
            expect(@list1.pop_delante).to eq "Dave Thomas, Andy Hunt, Chad Fowler\nProgramming Ruby 1.9 & 2.0: The Pragmatic Programmers Guide\nThe Facets of Ruby\nPragmatic Bookshelf; 4 edicion (July 7, 2013)\nISBN-13: 9781937785499\nISBN-10: 1937785491\n"
        end
    
        it "Al hacer otro pop deberiamos conseguir @var2" do
            @list1.pop_delante
            expect(@list1.pop_delante).to eq "Scott Chacon\nPro Git 2009th Edition\nPro\nApress; 2009 edicion (August 27, 2009)\nISBN-13: 9781430218333\nISBN-10: 1430218339\n"
        end
        
        it "Hacemos un pop desde el final y nos muestra @var3" do
            expect(@list1.pop_detras).to eq "David Flanagan, Yukihiro Matsumoto\nThe Ruby Programming Language\nO'Reilly Media; 1 edicion (February 4, 2008)\nISBN-10: 0596516177\nISBN-13: 9780596516178\n"
        end
    end
    
    describe "Pruebas con push" do
        
        it "Insertamos por detras " do
            @list2.push_detras(@var2)
            expect(@list2.start.value.to_s).to eq(@var2.to_s)
        end
        
        it "Insertamos por delante " do
            @list2.push_delante(@var2)
            expect(@list2.end.value.to_s).to eq(@var2.to_s)
        end
    end
end

describe Bibliography do
    describe "Pruebas con la Clase Padre" do
        it "Bibliography es una clase padre" do
            expect(Bibliography.superclass).to eq Object
        end
    end
end

describe Libro do
    
    before :each do
        @libro1 = Libro.new(["Dave Thomas", "Andy Hunt", "Chad Fowler"],"Programming Ruby 1.9 & 2.0: The Pragmatic Programmers Guide","The Facets of Ruby","Pragmatic Bookshelf",4,"July 7, 2013",["9781937785499","1937785491"])
    end
    
    describe "Probamos la herencia por parte de la clase Libro" do
        it "La clase libro hereda de la clase Bibliography" do
            expect(Libro<Bibliography).to eq true
        end
        it "Libro es heredado de Bibliography" do
            expect(Libro.superclass).to_not eq Object
        end
        
        it "Comprobamos la existencia de Libro1" do
            expect(@libro1.to_s).to eq "Dave Thomas, Andy Hunt, Chad Fowler\nProgramming Ruby 1.9 & 2.0: The Pragmatic Programmers Guide\nThe Facets of Ruby\nPragmatic Bookshelf; 4 edicion (July 7, 2013)\nISBN-13: 9781937785499\nISBN-10: 1937785491\n"
        end
    end
end

describe Publicaciones_periodicas do
    
    it "La clase Publicaciones_periodicas hereda de la clase Bibliography" do
        expect(Publicaciones_periodicas<Bibliography).to eq true
    end
    
    describe Art_per do
        
        before :each do
            @art_per1 = Art_per.new(["AGUAD, Juan"],"Mas cerca","El Mercurio","Santiago","16 de enero de 2008","p.4, Suplemento Deportes","col. 1","Semanal")
        end
        
        describe "Pruebas con la clase de articulo de periodico" do
            it "Comprobar que es una clase heredada" do
                expect(Art_per<Bibliography).to eq true
            end
            it "Comprobar que hereda de Publicaciones_periodicas" do
                expect(Art_per<Publicaciones_periodicas).to eq true
            end
            it "Imprimimos un Articulo de Periodico" do
                expect(@art_per1.to_s).to eq "AGUAD, Juan\nMas cerca. \nEl Mercurio, Santiago, 16 de enero de 2008\np.4, Suplemento Deportes\ncol. 1\n publicacion: Semanal\n"
            end
        end
    end
    
    describe Art_rev do
        before :each do
            @art_rev1 = Art_rev.new(["PERSICO, Pablo","PERSICO, Maria Cecilia"],"Tecnicas, materiales y aplicaciones en nanotecnologia","Acta Bioquimica Clinica Latinoamericana","41","189-191","Abril","Mensual")
        end
        
        describe "Pruebas con la clase Articulo de revista" do
            it "Comprobar que hereda de Bibliography" do
                expect(Art_rev<Bibliography).to eq true
            end
            it "Comprobar que hereda de Publicaciones_periodicas" do
                expect(Art_rev<Publicaciones_periodicas).to eq true
            end
            it "Imprimimos un articulo de revista" do
                expect(@art_rev1.to_s).to eq "PERSICO, Pablo, PERSICO, Maria Cecilia\nTecnicas, materiales y aplicaciones en nanotecnologia. \nActa Bioquimica Clinica Latinoamericana, \n(41): 189-191, Abril\n publicacion: Mensual\n"
            end
        end
    end
    
    describe Doc_elect do
        describe "Pruebas con la clase Doc_elect" do
            it "La clase Doc_elect hereda de la clase Bibliography" do
                expect(Doc_elect<Bibliography).to eq true
            end
            it "Comprobar que hereda de Publicaciones_periodicas" do
                expect(Doc_elect<Publicaciones_periodicas).to eq true
            end
            #it "Imprimimos un documento electronico" do
            #    expect(@doc_e1.to_s).to eq ""
            #end
        end
    end

end

