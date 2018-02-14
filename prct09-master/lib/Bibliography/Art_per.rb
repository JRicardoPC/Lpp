class Art_per < Publicaciones_periodicas
    attr_reader :periodico, :columna, :lugar, :paginacion
    def initialize(*args)
        if args.length == 8
            @autor = args[0]
            @titulo = args[1]
            @periodico = args[2]
            @lugar = args[3]
            @fecha = args[4]
            @paginacion = args[5]
            @columna = args[6]
            @tpb = args[7]
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
        cadena = cadena + @periodico
        cadena = cadena + ", "
        cadena = cadena + @lugar
        cadena = cadena + ", "
        cadena = cadena + @fecha
        cadena = cadena + "\n"
        cadena = cadena + @paginacion
        cadena = cadena + "\n"
        cadena = cadena + @columna
        cadena = cadena + "\n publicacion: "
        cadena = cadena + @tpb
        cadena = cadena + "\n"
    end
end