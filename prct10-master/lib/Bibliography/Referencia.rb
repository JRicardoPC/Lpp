require 'gem'


class Referencia < LinkedList
    
    attr_reader :nodos
    def initialize(nodes)
        
        for i in 0..nodes.length-1 do
            nombre = []
            for j in nodes[i].autor
                nom=j.split(" ")
                aux=nom[0]
                nom[0]=nom[1]
                nom[1]=aux
                nom=nom.join(". ")
                nombre.push(nom)
                #puts "-----------------------------------"
                #puts nombre
                #puts "-------------------------------"
            end
            nodes[i].autor=nombre
            #puts "************************"
            #puts nodes[i].autor
            #puts "***************************"
        end
        
        nodes=nodes.sort
        @nodos = nodes;

        for i in 0..nodes.length-1 do
            nodes[i]=Node.new(nodes[i],nil,nil)
        end
        
        x = nodes.length
        x -= 1
        @end = nodes[0]
        @start = nodes[x]
        if x > 1
            @end.next = nodes[1]
            
            for j in 1..x-1 do
                nodes[j].next = nodes[j+1]
                nodes[j].prev = nodes[j-1]
            end
            @start.prev = nodes[x-1]
        end
        

        
    end



    
    def to_s
        cadena = ''
        #for x in 0..nodos.length-1 do
        x=0
        aux=@end
        while aux!=nil do
            if aux.value.instance_of? Libro
                cadena = cadena + '['
                cadena = cadena + to_s_L(aux)
                if x == nodos.length-1
                    cadena = cadena + ']'
                else
                    cadena = cadena + '] <=> '
                end
                
            end
            if aux.value.instance_of? Art_per
                cadena = cadena + '['
                cadena = cadena + to_s_P(aux)
                if x == nodos.length-1
                    cadena = cadena + ']'
                else
                    cadena = cadena + '] <=> '
                end
            end
            if aux.value.instance_of? Art_rev
                cadena = cadena + '['
                cadena = cadena + to_s_R(aux)
                if x == nodos.length-1
                    cadena = cadena + ']'
                else
                    cadena = cadena + '] <=> '
                end
            end
            x+=1
            aux = aux.next
        end
        cadena
    end
    
    def to_s_L(aux)
        #puts "Entrando en to_s de Libro"
        cadena = "Autor, "
        prueba = false;
        for x in aux.value.lista_autores
            if !prueba
                cadena = cadena + x
            end
            if prueba
                cadena = cadena + " & Autor, "
                cadena = cadena +  x
            end
            prueba=true;
        end
        cadena = cadena + " ("
        cadena = cadena + aux.value.get_fecha
        cadena = cadena + "). \n"
        cadena = cadena + aux.value.get_title
        cadena = cadena + ": ("
        cadena = cadena + aux.value.get_edicion.to_s
        cadena = cadena + ") "
        cadena = cadena + "("
        cadena = cadena + aux.value.get_serie
        cadena = cadena + "). \n"
        cadena = cadena + "Lugar de publicación: "
        cadena = cadena + aux.value.get_editorial
        cadena = cadena + "\n"
        cadena
    end
    
    def to_s_R(aux)
        #puts "Entrando en to_s de Revista"
        cadena = "Autor, "
        prueba=false
        for x in aux.value.lista_autores
            if !prueba
                cadena = cadena + x
            end
            if prueba
                cadena = cadena + " & Autor, "
                cadena = cadena +  x
            end
            prueba=true;
        end
        cadena = cadena + " ("
        cadena = cadena + aux.value.get_fecha
        cadena = cadena + "). \n "
        revis=aux.value.get_title.split(" ")
        for y in 0..revis.length-1
            cadena = cadena + revis[y].capitalize
            cadena = cadena + " "
        end
        cadena = cadena + "("
        cadena = cadena + aux.value.get_paginas
        cadena = cadena + ") "
        cadena = cadena + "("
        cadena = cadena + aux.value.get_numero
        cadena = cadena + "). \n "
        cadena = cadena + "Lugar de publicación: "
        cadena = cadena + aux.value.get_revista
        cadena = cadena + "\n"
        cadena
    end
    
    def to_s_P(aux)
        #puts "Entrando en to_s de Periodico"
        cadena = "Autor, "
        prueba=false
        
        for x in aux.value.lista_autores
            
            if !prueba
                cadena = cadena + x
            end
            if prueba
                cadena = cadena + " & Autor, "
                cadena = cadena +  x
            end
            prueba=true;
        end
        cadena = cadena + ", ("
        cadena = cadena + aux.value.get_fecha
        cadena = cadena + "). \n "
        cadena = cadena + aux.value.get_title
        cadena = cadena + ". \n"
        cadena = cadena + aux.value.get_periodico
        cadena = cadena + ", "
        cadena = cadena + aux.value.paginacion
        cadena = cadena + "\n"
        cadena
    end

end