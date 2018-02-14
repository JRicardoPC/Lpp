require 'spec_helper'
require 'gem'

describe Referencia do
    before :each do
        @libro1 = Libro.new(["Dave Thomas", "Andy Hunt", "Chad Fowler"],"Programming Ruby 1.9 & 2.0: The Pragmatic Programmers Guide","2","Pragmatic Bookshelf",4,"2013",["9781937785499","1937785491"])
        @libro2 = Libro.new(["Dave Thomas", "Andy Hunt", "Chad Fowler"],"Programming Ruby 1.9 & 2.0: The Pragmatic Programmers Guide","2","Pragmatic Bookshelf",4,"2013",["9781937785499","1937785491"])
        @libro3 = Libro.new(["Dave Thomas", "Andy Hunt", "Chad Fowler"],"Programming Ruby 1.9 & 2.0: The Pragmatic Programmers Guide","2","Pragmatic Bookshelf",4,"2013",["9781937785499","1937785491"])
        @libro4 = Libro.new(["Dave Thomas", "Andy Hunt", "Chad Fowler"],"Programming Ruby 1.9 & 2.0: The Pragmatic Programmers Guide","2","Pragmatic Bookshelf",4,"2013",["9781937785499","1937785491"])
        @art_per1 = Art_per.new(["Dave Thomas"],"Mas cerca","El Mercurio","Santiago","2008","p.4, Suplemento Deportes","col. 1","Semanal")
        @art_per2 = Art_per.new(["Juan Aguad"],"Mas cerca","El Mercurio","Santiago","2008","p.4, Suplemento Deportes","col. 1","Semanal")
        @art_rev1 = Art_rev.new(["Pablo Persico","Maria Persico"],"Tecnicas, materiales y aplicaciones en nanotecnologia","Acta Bioquimica Clinica Latinoamericana","41","189-191","2010","Mensual")
        @art_rev2 = Art_rev.new(["Pablo Persico","Maria Persico"],"Tecnicas, materiales y aplicaciones en nanotecnologia","Acta Bioquimica Clinica Latinoamericana","41","189-191","2010","Mensual")
        @art_rev3 = Art_rev.new(["Dave Thomas"],"Tecnicas, materiales y aplicaciones en nanotecnologia","Acta Bioquimica Clinica Latinoamericana","41","189-191","2010","Mensual")
        @refe = Referencia.new([@libro1,@art_per2,@art_rev1])
        @refe2 = Referencia.new([@libro2])
        @refe3 = Referencia.new([@art_rev2])
        @refe4 = Referencia.new([@libro3])
        @refe5 = Referencia.new([@libro4,@art_per1,@art_rev3])
    end
    
    describe "Probamos a imprimir el contenido de refe" do
        it "Imprimimos" do
            expect(@refe.to_s).to eq "[Autor, Aguad. Juan, (2008). \n Mas cerca. \nEl Mercurio, p.4, Suplemento Deportes\n] <=> [Autor, Persico. Pablo & Autor, Persico. Maria (2010). \n Tecnicas, Materiales Y Aplicaciones En Nanotecnologia (189-191) (41). \n Lugar de publicación: Acta Bioquimica Clinica Latinoamericana\n] <=> [Autor, Thomas. Dave & Autor, Hunt. Andy & Autor, Fowler. Chad (2013). \nProgramming Ruby 1.9 & 2.0: The Pragmatic Programmers Guide: (4) (2). \nLugar de publicación: Pragmatic Bookshelf\n]"
        end
    end
    
    describe "Los nombres estan invertidos" do
        it "Comprobamos" do
            expect(@refe2.to_s).to eq "[Autor, Thomas. Dave & Autor, Hunt. Andy & Autor, Fowler. Chad (2013). \nProgramming Ruby 1.9 & 2.0: The Pragmatic Programmers Guide: (4) (2). \nLugar de publicación: Pragmatic Bookshelf\n]"
         end
    end
    
    describe "El titulo del articulo de revista tiene las iniciales en mayuscula" do
        it "Comprobar" do
            expect(@refe3.to_s).to eq "[Autor, Persico. Pablo & Autor, Persico. Maria (2010). \n Tecnicas, Materiales Y Aplicaciones En Nanotecnologia (189-191) (41). \n Lugar de publicación: Acta Bioquimica Clinica Latinoamericana\n]"
        end
    end
        
    describe "Los autores van separados por &" do
        it "Con varios autores" do
            expect(@refe4.to_s).to eq "[Autor, Thomas. Dave & Autor, Hunt. Andy & Autor, Fowler. Chad (2013). \nProgramming Ruby 1.9 & 2.0: The Pragmatic Programmers Guide: (4) (2). \nLugar de publicación: Pragmatic Bookshelf\n]"
        end
    end
    
    describe "Varios documentos de un mismo autor" do
        it "comprobamos el orden" do
            expect(@refe5.to_s).to eq "[Autor, Thomas. Dave, (2008). \n Mas cerca. \nEl Mercurio, p.4, Suplemento Deportes\n] <=> [Autor, Thomas. Dave (2010). \n Tecnicas, Materiales Y Aplicaciones En Nanotecnologia (189-191) (41). \n Lugar de publicación: Acta Bioquimica Clinica Latinoamericana\n] <=> [Autor, Thomas. Dave & Autor, Hunt. Andy & Autor, Fowler. Chad (2013). \nProgramming Ruby 1.9 & 2.0: The Pragmatic Programmers Guide: (4) (2). \nLugar de publicación: Pragmatic Bookshelf\n]"
       
        end
    end
end