//MURILO RIBEIRO DE OLIVEIRA

import UIKit

class Competidor {
    let velocidade : Int
    let aceleracao : Int
    let giro : Int
    let placa : String
    
    init(velocidade : Int, aceleracao : Int, giro : Int, placa : String){
        self.velocidade = velocidade
        self.aceleracao = aceleracao
        self.giro = giro
        self.placa = placa
    }
}

class Corrida {
    
    let distancia : Int
    let premioEmDolares : Double
    let nome : String
    let quantidadeDeCompetidoresPermitidos : Int
    var listaDeCompetidores : [Competidor]
    let socorristaCarro : SocorristaCarro
    let socorristaMoto : SocorristaMoto
    
    init(distancia : Int, premioEmDolares : Double, nome : String, quantidadeDeCompetidoresPermitidos : Int, listadeCompetidores : [Competidor], socorristaCarro : SocorristaCarro, socorristaMoto : SocorristaMoto){
        
        self.distancia = distancia
        self.premioEmDolares = premioEmDolares
        self.nome = nome
        self.quantidadeDeCompetidoresPermitidos = quantidadeDeCompetidoresPermitidos
        self.listaDeCompetidores = listadeCompetidores
        self.socorristaMoto = socorristaMoto
        self.socorristaCarro = socorristaCarro
    }
    
    public func adicionarCarro(velocidade: Int, aceleracao: Int, giro: Int, placa: String){
    
        if listaDeCompetidores.count < quantidadeDeCompetidoresPermitidos {
           
            let competidor = Carros(velocidade: velocidade, aceleracao: aceleracao, giro: giro, placa: placa)
            listaDeCompetidores.append(competidor)
            
            
        }
        
    }
    
    public func adicionarMoto(velocidade: Int, aceleracao: Int, giro: Int, placa: String){
        if listaDeCompetidores.count < quantidadeDeCompetidoresPermitidos{
            
            let competidor = Motos(velocidade: velocidade, aceleracao: aceleracao, giro: giro, placa: placa)
            listaDeCompetidores.append(competidor)
            
        }
        
    }


    public func eliminarCompetidor(competidor : Competidor){
        for (index, competidorDaLista) in listaDeCompetidores.enumerated() {
            if competidor.placa == competidorDaLista.placa {
                listaDeCompetidores.remove(at: index)
            }
        }
    }
    
    public func eliminarCompetidorComPlaca(placa : String){
        for (index, competidorDaLista) in listaDeCompetidores.enumerated() {
            if placa == competidorDaLista.placa {
                listaDeCompetidores.remove(at: index)
            }
        }
    }


    
    public func oGanhador() -> Competidor? {
        
        guard let ganhador = listaDeCompetidores.randomElement() else {
            return nil
        }
        
        return ganhador
        
        
    }

    
    public func socorrer(competidor: Competidor){
        if competidor as? Carros != nil {
            socorristaCarro.socorrer(umCompetidor: competidor)
        }
        
        if competidor as? Motos != nil {
            socorristaMoto.socorrer(umCompetidor: competidor)
        }
    
    }
 
}


class Carros: Competidor {
    let peso = 1000
    let quantidadeDeRodas = 4

}


class Motos: Competidor {
    let peso = 300
    let roda = 2
}



class SocorristaCarro {
    func socorrer(umCompetidor: Competidor){
        print("Socorrendo Carro \(umCompetidor.placa)")
    }
}


class SocorristaMoto {
    func socorrer(umCompetidor : Competidor){
        print("Socorrendo Moto \(umCompetidor.placa)")
    }
}









let corridaNumeroUm = Corrida(distancia: 1000, premioEmDolares: 1000.00, nome: "Corrida dos Campeões", quantidadeDeCompetidoresPermitidos: 4, listadeCompetidores: [], socorristaCarro: SocorristaCarro(), socorristaMoto: SocorristaMoto())



corridaNumeroUm.adicionarCarro(velocidade: 100, aceleracao: 150, giro: 200, placa: "TSTCar")
corridaNumeroUm.adicionarMoto(velocidade: 50, aceleracao: 75, giro: 100, placa: "TSTBike")
corridaNumeroUm.adicionarCarro(velocidade: 110, aceleracao: 160, giro: 220, placa: "SCDCar")
corridaNumeroUm.adicionarMoto(velocidade: 60, aceleracao: 80, giro: 150, placa: "SCDBike")

corridaNumeroUm.oGanhador()?.placa

corridaNumeroUm.socorrer(competidor: corridaNumeroUm.listaDeCompetidores[3])
