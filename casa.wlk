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
      return cosas.any({cosa => self.esMismaCategoria(cosa.categoria(), categoria)})
    }

    method esMismaCategoria(cat1, cat2) {
      return cat1 == cat2
    }

    method vieneDeComprar(categoria) {
      return self.esMismaCategoria(cosas.last().categoria(), categoria)
    }

    method esDerrochona() {
      return cosas.map({cosa => cosa.precio()}).sum() >= 9000
    }

    method compraMasCara() {
      return cosas.map({cosa => cosa.precio()}).max()
    }

    method comprados(categoria) {
      return cosas.filter({cosa => self.esMismaCategoria(cosa.categoria(), categoria)})
    }

    method malaEpoca() {
      return cosas.all({cosa => cosa.categoria().esComestible()})
    }

    method queFaltaComprar(lista) {
      return lista.filter({elemento => !self.apareceEnCosas(elemento)})
    }

    method apareceEnCosas(unaCosa) {
      return cosas.any({cosa => self.esMismaCosa(cosa, unaCosa)})
    }

    method esMismaCosa(cosa1, cosa2) {
      return cosa1 == cosa2
    }

    method faltaComida() {
      return self.cantidadDeComidaComprada() < 2
    }

    method cantidadDeComidaComprada() {
      return cosas.count({cosa => cosa.categoria().esComestible()})
    }

    method categoriasCompradas() {
      return self.listaDeCategoriasCompradas().withoutDuplicates()
    }

    method listaDeCategoriasCompradas() {
      return cosas.map({cosa => cosa.categoria()})
    }
}

object cuentaCorriente {
  var saldo = 0

  method saldo() {
    return saldo
  }

  method extraer(_saldo) {
    if (self.validarExtraccion(_saldo)) {
      saldo -= _saldo
    }
    else {
      self.error("no hay saldo suficiente")
    }
  }
  method validarExtraccion(_saldo) {
    return saldo >= _saldo
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
    if (self.validarDeposito(_saldo)) {
        self.error("no se puede depositar mas de 1000")
    }
    else {
        saldo += _saldo - costoPorOperacion
    }
  }
  method validarDeposito(_saldo) {
    return _saldo > 1000
  }

}

