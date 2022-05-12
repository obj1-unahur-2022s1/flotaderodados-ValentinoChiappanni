class Pedido {
	var property distancia
	var property tiempoMaximo
	var property pasajerosATransportar
	var property coloresIncompatibles = []
	method velocidadRequerida() = distancia/tiempoMaximo
	method loPuedoSastifacer(unVehiculo){
		return unVehiculo.velocidadMaxima() >= self.velocidadRequerida()+10 and
		unVehiculo.capacidad() >= pasajerosATransportar and
		not coloresIncompatibles.contains(unVehiculo.color())
	}
	method acelerar(){
		tiempoMaximo = 0.max(tiempoMaximo-1)
	}
	method relajar(){
		tiempoMaximo += 1
	}
}
