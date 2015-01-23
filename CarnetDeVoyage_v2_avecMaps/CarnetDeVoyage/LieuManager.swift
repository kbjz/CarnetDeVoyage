//
//  LieuManager.swift
//  CarnetDeVoyage
//
//  Created by Developer on 14/01/2015.
//  Copyright (c) 2015 Developer. All rights reserved.
//


class LieuManager {
    
    var tabDeLieux = [Lieu]()
    var nbDeLieux : Int {
        return tabDeLieux.count
    }
    var tousLesLieux: [Lieu] {
        return tabDeLieux
    }
    func ajouterLieu(monLieu : Lieu) {
        tabDeLieux.append(monLieu)
    }
    
    
    
}



    