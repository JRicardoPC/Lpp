class Art_rev < Publicaciones_periodicas
    attr_reader :revista, :numero, :paginas
    def initialize(*args)
        if args.length == 7
            @autor = args[0]
            @titulo = args[1]
            @revista = args[2]
            @numero = args[3]
            @paginas = args[4]
            @fecha = args[5]
            @tpb = args[6]
        end
    end
    
    def to_s
        cadena = ''
        prueba=false
        for x in @autor
            if !prueba
                cadena = cadena + x
            end
            if prueba
                cadena = cadena + ", "
                cadena = cadena + x
            end
            prueba=true;
        end
        cadena = cadena + "\n"
        cadena = cadena + @titulo
        cadena = cadena + ". \n"
        cadena = cadena + @revista
        cadena = cadena + ", \n"
        cadena = cadena + "("
        cadena = cadena + @numero
        cadena = cadena + "): "
        cadena = cadena + @paginas
        cadena = cadena + ", "
        cadena = cadena + @fecha
        cadena = cadena + "\n publicacion: "
        cadena = cadena + @tpb
        cadena = cadena + "\n"
    end
end