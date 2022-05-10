class Pedido {
	var property distancia
	var property tiempoMaximo
	var property pasajerosATransportar
	var property coloresIncompatibles = []
	method velocidadRequerida() = distancia/tiempoMaximo
}
