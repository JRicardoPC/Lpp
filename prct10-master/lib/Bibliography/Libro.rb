class Libro < Bibliography
    attr_reader :lugar
    def initialize (*args)
        if args.length == 7
            raise unless args[0].is_a? Array
            raise unless args[0].length > 0
            for item in args[0] do
                raise unless item.is_a? String
            end
            raise unless args[1].is_a? String
            raise unless args[2].is_a? String
            raise unless args[3].is_a? String
            raise unless args[4].is_a? Integer
            raise unless args[5].is_a? String
            raise unless args[6].is_a? Array
            raise unless args[6].length > 0
            for i in args[6] do
                raise unless i.is_a? String
            end
            
            @autor = args[0]
            @titulo = args[1]
            @serie = args[2]
            @editorial = args[3]
            @edicion = args[4]
            @fecha = args[5]
            @isbn = args[6]

        
        elsif args.length == 6
            raise unless args[0].is_a? Array
            raise unless args[0].length > 0
            raise unless args[1].is_a? String
            raise unless args[2].is_a? String
            raise unless args[3].is_a? Integer
            raise unless args[4].is_a? String
            raise unless args[5].is_a? Array
            raise unless args[5].length > 0
            for i in args[5] do
                raise unless i.is_a? String
            end
            
            @autor = args[0]
            @titulo = args[1]
            @serie = ''
            @editorial = args[2]
            @edicion = args[3]
            @fecha = args[4]
            @isbn = args[5]
        end
    end
    
    def to_s
        #puts "Entrando en to_s de Libro"
        cadena = 'Autor, '
        prueba = false;
        for x in @autor
            if !prueba
                cadena = cadena + x.capitalize
            end
            if prueba
                cadena = cadena + "& Autor, "
                cadena = cadena + x.capitalize
            end
            prueba=true;
        end
        cadena = cadena + " ("
        cadena = cadena + @fecha
        cadena = cadena + "). \n"
        cadena = cadena + @titulo.capitalize
        cadena = cadena + ": ("
        cadena = cadena + @edicion.to_s
        cadena = cadena + ") "
        cadena = cadena + " ("
        cadena = cadena + @serie
        cadena = cadena + "). \n"
        cadena = cadena + "Lugar de publicación: "
        cadena = cadena + @editorial.capitalize
        cadena
    end
end