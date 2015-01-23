//
//  DetailsLieuViewController.swift
//  CarnetDeVoyage
//
//  Created by Alice Dalverny on 21/01/2015.
//  Copyright (c) 2015 Developer. All rights reserved.
//

import UIKit
import MapKit

class DetailsLieuViewController: UIViewController, MKMapViewDelegate {

    // index de la ligne selectionnee
     var selectedIndex = 99999999
    
    // Initialise un LieuManager
    var monLieuManager = LieuManager()
    

    @IBOutlet weak var theMapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
       var adresseMaps = monLieuManager.tousLesLieux[selectedIndex].adresseLieu
        println(monLieuManager.tousLesLieux[selectedIndex].adresseLieu)

        println("dans maps , cell numero#\(selectedIndex) ")
        
        var coord  = ""
        var geocoder = CLGeocoder()
        geocoder.geocodeAddressString(adresseMaps,completionHandler:
        {
                (placemarks: [AnyObject]!,error: NSError!)-> Void in
                if let placemark = placemarks?[0] as? CLPlacemark {
                    self.theMapView.addAnnotation(MKPlacemark(placemark: placemark))

                   self.theMapView.setRegion(
                    MKCoordinateRegionMake(
                    CLLocationCoordinate2DMake(
                        placemark.location.coordinate.latitude,
                        placemark.location.coordinate.longitude),
                        MKCoordinateSpanMake(0.01, 0.01)),
                    animated: true)
                    //self.theMapView.showsUserLocation = true
        }
                                                                    }
                )

    }

    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
