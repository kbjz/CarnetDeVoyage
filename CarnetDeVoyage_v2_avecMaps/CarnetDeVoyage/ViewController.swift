//
//  ViewController.swift
//  CarnetDeVoyage
//
//  Created by Developer on 14/01/2015.
//  Copyright (c) 2015 Developer. All rights reserved.
//

import UIKit



class ViewController: UIViewController , UIPickerViewDataSource, UIPickerViewDelegate{
    
    
    @IBOutlet weak var sliderNoteForm: UISlider!
    @IBOutlet weak var pickerTypeForm: UIPickerView!
    let pickerData = ["Restaurant","Monument","Bar","Boite","Point de vue","Ville","Pays","Coiffeur","Commerce"]
    var pickerChoice : String?

    
    
    @IBOutlet weak var textFieldNomForm: UITextField!
    
    @IBOutlet weak var textFieldAdresseForm: UITextField!
    @IBOutlet weak var textFieldCommentaireForm: UITextField!
    
    
    
    // Initialise un LieuManager
        var monLieuManager = LieuManager()
    
    
    // VIEW DID LOAD
    override func viewDidLoad() {
        println("entree view did load form")
        super.viewDidLoad()
        
        //picker view
        pickerTypeForm.dataSource = self
        pickerTypeForm.delegate = self
        
    
        println("il y a : \(monLieuManager.nbDeLieux) lieux ")
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
  
    // SAVE FORMULAIRE NOUVEAU LIEU
    @IBAction func sauvegarderLieu(sender:AnyObject) {
   
        
        var unLieu: Lieu
        
        
        unLieu = Lieu(
            nomLieu: textFieldNomForm.text,
            adresseLieu: textFieldAdresseForm.text,
            noteLieu: sliderNoteForm.value,
            commentaireLieu: textFieldCommentaireForm.text,
            typeLieu:pickerChoice)
        
        if textFieldNomForm.text != "" && textFieldAdresseForm.text != "" {
       
        monLieuManager.ajouterLieu(unLieu)
        self.resetForm()
            
            
            
            println("Details du lieu ajouté :")
       
            println(unLieu.nomLieu)
            println(unLieu.adresseLieu)
            println(unLieu.noteLieu!)
            println(unLieu.commentaireLieu)
            println(unLieu.typeLieu!)

        println("il y a : \(monLieuManager.nbDeLieux) lieu(x) qui est/sont :  ")
        for lieux in monLieuManager.tousLesLieux {
            println(lieux.nomLieu)
        }
        
    }
        
    }// fin sauvegarder lieu
    
    
    func resetForm() {
        
        textFieldNomForm.text = ""
        textFieldAdresseForm.text = ""
        sliderNoteForm.value = 5.0
        textFieldCommentaireForm.text = ""
    }

    
    
    //BOUTON J'Y SUIS
    
    @IBAction func boutonJysuisForm(sender: AnyObject) {
    }
    
    
    

    //MARK: - Delegates and datasources
    //MARK: Data Sources
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    //MARK: Delegates
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        
        
        pickerChoice = pickerData[row]
        return pickerData[row]
   
    }
    
    
    
    
    


}




struct Lieu {
    
    let nomLieu: String
    let adresseLieu: String
    let noteLieu: Float?
    let commentaireLieu: String
    let typeLieu:String?
}

    