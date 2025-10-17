class Corsa{
  const color
  method pasajeros() = 4
  method velocidad() = 150
  method peso() = 1300
  method color() = color
}

class Kwid{
  var tieneGas = false
  method pasajeros() = if(tieneGas) 3 else 4 
  method velocidad() = if(tieneGas) 110 else 120
  method peso() = if(tieneGas) 1350 else 1200
  method color() = "azul"
  method ponerleGas(){tieneGas = true}
  method sacarleGas(){tieneGas = false}
}

class Trafic{
  var interior = comodo
  var motor = pulenta
  method pasajeros() = interior.capacidad()
  method velocidad() = motor.velocidad()
  method peso() = 400 + interior.peso() + motor.peso()
  method cambiarInterior(unInterior){
    interior = unInterior
  }
  method cambiarMotor(unMotor){
    motor = unMotor
  }
  method color() = "blanco"
}

object comodo{
  method peso() = 700
  method capacidad() = 5

}
object popular{
  method peso() = 1000
  method capacidad() = 12
}
object pulenta{
  method peso() = 800
  method velocidad() = 130
}
object bataton{
  method peso() = 500
  method velocidad() = 80
}

class Especial{
  const property pasajeros
  const property velocidad
  const property peso
  const property color   
}

class Dependencia{
  const property rodados = new List()
  var property empleados
  method agregarAFlota(rodado) {rodados.add(rodado)}
  method quitarAFlota(rodado) {rodados.remove(rodado)}
  method pesoTotalFlota() = rodados.sum({r => r.peso()})
  method estaBienEquipada(){
    return 
      rodados.size() >= 3 && rodados.all({r => r.velocidad() >= 100})
  }
  method capacidadTotalEnColor(color){
    return self.rodadosDeUnColor(color).sum({r => r.pasajeros()})
  }
  method rodadosDeUnColor(color){
    return rodados.filter({r => r.color()==color})
  }
  method colorDelRodadoMasRapido(){
    return rodados.max({r => r.velocidad()}).color()
  }
  method capacidadFaltante(){
    return (empleados - self.capacidadTotal()).max(0)
  }
  method capacidadTotal() = rodados.sum({r => r.pasajeros()})
  method esGrande(){
    return empleados >= 40 && rodados.size() >= 5
  }
}