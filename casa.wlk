import cosas.* 

object casaDePepeYJulian {
    const cosas = []
    var cuenta = cuentaConGastos

    method cuenta(_cuenta) {
      cuenta = _cuenta
    }

    method depositar(_saldo) {
      cuenta.depositar(_saldo)
    }

    method extraer(_saldo) {
      cuenta.extraer(_saldo)
    }

    method saldo() {
      return cuenta.saldo()
    }

    method cosas() {
      return cosas
    }

    method comprar(cosa) {
      cuenta.extraer(cosa.precio())
      cosas.add(cosa)
    }

    method cantidadDeCosasCompradas() {
      return cosas.size()
    }

    method tieneAlgun(categoria) {
      return cosas.any({cosa => cosa.categoria() == categoria})
    }

    method vieneDeComprar(categoria) {
      return cosas.last().categoria() == categoria
    }

    method esDerrochona() {
      return cosas.map({cosa => cosa.precio()}).sum() >= 9000
    }

    method compraMasCara() {
      return cosas.map({cosa => cosa.precio()}).max()
    }

    method comprados(categoria) {
      return if(cosas.filter({cosa => cosa.categoria() == categoria}) == []){
                self.error("no se compro nada de esa categoria")
             }
             else {
                cosas.filter({cosa => cosa.categoria() == categoria})
             }
    }

    method malaEpoca() {
      return cosas.all({cosa => cosa.categoria() == comida})
    }

    method queFaltaComprar(lista) {
      return if(lista.filter({elemento => not cosas.contains(elemento)}) == []){
                self.error("no falta comprar nada de la lista")
             }
             else {
                (lista.filter({elemento => not cosas.contains(elemento)}))
             }
    }

    method faltaComida() {
      return cosas.filter({cosa => cosa.categoria() == comida}).size() <= 2
    }

    method categoriasCompradas() {
      return if(cosas.map({cosa => cosa.categoria()}).withoutDuplicates() == []){
                self.error("aun no se ha comprado nada")
             }
             else {
                cosas.map({cosa => cosa.categoria()}).withoutDuplicates()
             }
    }
}

object cuentaCorriente {
  var saldo = 0

  method saldo() {
    return saldo
  }

  method extraer(_saldo) {
    if (saldo >= _saldo) {
        saldo -= _saldo
    }
    else {
        self.error("no hay saldo suficiente")
    }
  }
  method depositar(_saldo) {
    saldo += _saldo
  }

}

object cuentaConGastos {
  var saldo = 0
  var property costoPorOperacion = 0

  method saldo() {
    return saldo
  }

  method extraer(_saldo) {
    saldo -= _saldo
  }

  method depositar(_saldo) {
    if (_saldo > 1000) {
        self.error("no se puede depositar mas de 1000")
    }
    else {
        saldo += _saldo - costoPorOperacion
    }
  }

}

