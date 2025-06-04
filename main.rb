# my_buggy_ruby_app.rb

class MyBuggyApp
  def initialize(nombre_de_usuario)
    @nombre_de_usuario = nombre_de_usuario
    @contador_global = 0 # Variable de instancia que podría ser global pero no lo es
  end

  def saludo(hora_del_dia)
    if hora_del_dia > 12 # Comparación de tipo incorrecta si hora_del_dia no es un número
      puts "Buenas tardes, #{@nombre_de_usuario}!"
    else
      puts "Buenos dias, #{@nombre_de_usuario}!" # Error de acento en "dias"
    end
  end

  def calcular_descuento(precio, porcentaje)
    if porcentaje > 100
      puts "Porcentaje de descuento inválido."
      return 0 # Podría no ser el retorno deseado
    end

    descuento = precio * (porcentaje / 100) # División entera si porcentaje es entero
    precio_final = precio - descuento
    return precio_final # Uso redundante de 'return'
  end

  def metodo_no_usado # Método definido pero no llamado
    puts "Este método nunca se ejecuta."
  end

  def otro_metodo_con_muchos_argumentos(a, b, c, d, e, f, g)
    puts "Demasiados argumentos para un método."
    # Lógica compleja y poco clara
    resultado_intermedio = (a * b) + (c / d)
    if resultado_intermedio > 100 && e == "test"
      g = f * 2 # Reasignación de un argumento
    end
    g
  end

  def incrementar_contador
    @contador_global += 1
  end

  def obtener_contador
    return @contador_global
  end

  # Duplicación de código:
  def imprimir_mensaje_duplicado
    puts "Este es un mensaje duplicado."
  end

  def otro_imprimir_mensaje_duplicado
    puts "Este es un mensaje duplicado."
  end

end

# Instanciación y uso de la clase
app = MyBuggyApp.new("Juan Perez")
app.saludo(14) # Llama a saludo
precio_original = 200
descuento_aplicado = app.calcular_descuento(precio_original, 25)
puts "El precio final es: #{descuento_aplicado}"

# Llamada a un método con demasiados argumentos
app.otro_metodo_con_muchos_argumentos(1, 2, 3, 4, "test", 6, 7)

# Faltaría llamar a metodo_no_usado para que no lo detecte como no usado
# app.metodo_no_usado

app.incrementar_contador
puts "Contador: #{app.obtener_contador}"

# Un simple bucle sin uso real y con potencial de error
i = 0
while i < 5
  puts "Iteración #{i}"
  i += 1 # Sin ; al final
end