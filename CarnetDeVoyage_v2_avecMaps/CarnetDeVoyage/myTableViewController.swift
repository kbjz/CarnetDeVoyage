//
//  myTableViewController.swift
//  CarnetDeVoyage
//
//  Created by Developer on 14/01/2015.
//  Copyright (c) 2015 Developer. All rights reserved.
//

import UIKit




class myTableViewController: UITableViewController {
    
    
    

        var monLieuManager = LieuManager()


    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        var lieu1 = Lieu(nomLieu: "La Patate qui fume", adresseLieu: "2 rue gambetta", noteLieu: 5.0, commentaireLieu: "Très bon service", typeLieu: "Restaurant")
        var lieu2 = Lieu(nomLieu: "Maison", adresseLieu: "28 rue jean-baptiste pigalle 75009 paris", noteLieu: 5.0, commentaireLieu: "a la maison", typeLieu: "Restaurant")
         monLieuManager.ajouterLieu(lieu1)
         monLieuManager.ajouterLieu(lieu2)

        
        
        
        println("------DANS view didload TABLE VIEW CONTROLLER ----------------")
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        
      
}


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return monLieuManager.nbDeLieux
    }    
    
    
  
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("lieuCell", forIndexPath: indexPath) as UITableViewCell
        
       

        // Configure the cell...
        
        cell.textLabel.text = monLieuManager.tousLesLieux[indexPath.row].nomLieu
        return cell
    }
    
    // suppression row table view
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            monLieuManager.tabDeLieux.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
        }
    }
    
    
    
    
    
    
   /* override func tableView(tableView: UITableView,didSelectRowAtIndexPath indexPath: NSIndexPath) {
        indexOfLieuSelected = indexPath.row
        println("cell #\(indexPath.row)")
        
    }
*/

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }


    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    
    
    func myVCForm(controller: ViewController) {
        controller.navigationController?.popViewControllerAnimated(true)
    }
    
        */
    

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "showDetails" {
            
            var nextVC = segue.destinationViewController as DetailsLieuViewController
           
            
            var selectedIndex = self.tableView.indexPathForCell(sender as UITableViewCell)
            nextVC.monLieuManager = self.monLieuManager
            println("dans tableView , cell numero#\(selectedIndex!.row) ")
            nextVC.selectedIndex = selectedIndex!.row
            
            nextVC.title = " Geolocalisation "
            
        }
            
        else if segue.identifier == "showForm" {
            
            println("segue  tableview VERS  view controller")
            var nextVC = segue.destinationViewController as ViewController
            println("avant transfert lieuManager")
            nextVC.monLieuManager = self.monLieuManager
               println("apres transfert lieuManager")
            println(monLieuManager.tousLesLieux)
   //         nextVC.delegate = self
        
        }
        
        
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    

}
