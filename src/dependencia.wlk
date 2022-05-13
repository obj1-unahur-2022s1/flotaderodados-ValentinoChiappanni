import rodados.*
class Dependencia {
	var rodados = []
	var pedidos = []
	var property cantEmpleados = 0
	method agregarAFlota(rodado){
		rodados.add(rodado)
	}
	method quitarDeFlota(rodado){
		rodados.remove(rodado)
	}
	method pesoTotalFlota(){
		return rodados.sum({r=>r.peso()})
	}
	method todosAndanAlmenosA(velocidad){
		return rodados.all({r=>r.velocidadMaxima()>=velocidad})
	}
	method cantidadDeRodados() = rodados.size()
	
	method estaBienEquipada(){
		return self.cantidadDeRodados() >= 3 and self.todosAndanAlmenosA(100)
	}
	method rodadosDeUn(color){
		return rodados.filter({r=>r.color() == color})
	}
	method capacidadTotalEnColor(color){
		return self.rodadosDeUn(color).sum({r=>r.capacidad()})
	}
	method colorDelRodadoMasRapido(){
		return rodados.max({r=>r.velocidadMaxima()}).color()
	}
	method capacidadTotalFlota(){
		return rodados.sum({r=>r.capacidad()})
	}
	method capacidadFaltante(){
		return 0.max(cantEmpleados - self.capacidadTotalFlota())
	}
	method esGrande(){
		return cantEmpleados>= 40 and self.cantidadDeRodados() >= 5
	}
	method agregarUnPedido(unPedido){
		pedidos.add(unPedido)
	}
	method sacarUnPedido(unPedido){
		pedidos.remove(unPedido)
	}
	method totalDePasajerosATransportar(){
		return pedidos.sum({p=>p.pasajerosATransportar()})
	}
	method pedidosInsatisfechos() {
		return pedidos.filter( { p => not self.puedeSatisfacerPedido(p) })
	}
	
	method puedeSatisfacerPedido( pedido ) {
		return rodados.any ({ r => pedido.loPuedeSatisfacer(r) })
	}
	method esColorImpatibleParaTodosLosPedidos(unColor) {
		return pedidos.all({p=>p.coloresIncompatibles().contains(unColor)})
	}
	method relajarTodosLosPedidosRegistrado() {
		pedidos.forEach( { p=> p.relajar()})
	}
	
}




