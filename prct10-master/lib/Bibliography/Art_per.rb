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
    
    def get_periodico
        @periodico
    end
    
    def get_paginacion
        @paginacion
    end
    
    def to_s
        #puts "Entrando en to_s de Art_per"
        cadena = 'Autor, '
        prueba=false
        for x in @autor
            if !prueba
                cadena = cadena + x.capitalize
            end
            if prueba
                cadena = cadena + "& Autor, "
                cadena = cadena + x.capitalize
                cadena = cadena + " "
            end
            prueba=true;
        end
        cadena = cadena + "("
        cadena = cadena + @fecha
        cadena = cadena + "). \n"
        cadena = cadena + @titulo.capitalize
        cadena = cadena + ". \n"
        cadena = cadena + @periodico.capitalize
        cadena = cadena + ", "
        cadena = cadena + @paginacion
        cadena
        puts cadena
    end
end