class Bibliography
    include Comparable
    attr_accessor :autor, :titulo, :serie, :editorial, :edicion, :fecha, :isbn
    
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
      
        else
            raise
        end
    end
  
    def lista_autores
        @autor
    end
    
    def get_title
        @titulo
    end
    
    def get_serie
        @serie
    end
    
    def get_editorial
        @editorial
    end
    
    def get_edicion
        @edicion
    end
    
    def get_fecha
        @fecha
    end
    
    def get_isbn
        @isbn
    end
    
    def to_s
        cadena = ''
        prueba=false;
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
        cadena = cadena + "\n"
        if @serie != ''
            cadena = cadena + @serie
            cadena= cadena + "\n"
        end
        cadena = cadena + @editorial
        cadena = cadena + "; "
        cadena = cadena + @edicion.to_s
        cadena = cadena + " edicion "
        cadena = cadena + "("
        cadena = cadena + @fecha
        cadena = cadena + ")\n"
        for y in @isbn
            cadena = cadena + "ISBN-"
            cadena = cadena + y.length.to_s
            cadena = cadena + ": "
            cadena = cadena + y.to_s
            cadena = cadena + "\n"
        end
        cadena
    end
    
    def <=>(obj)
        if lista_autores == obj.lista_autores
            if get_fecha == obj.get_fecha
                return get_edicion<=>obj.get_edicion
            else
                return get_fecha <=> obj.get_fecha
            end
        else
            return lista_autores<=>obj.lista_autores
        end
      end

end