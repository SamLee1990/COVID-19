//
//  DetialTableViewController.swift
//  COVID-19
//
//  Created by 李世文 on 2020/8/15.
//

import UIKit
import MapKit

class DetialTableViewController: UITableViewController {
    
    var covid19Info: Covid19!
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var totalCasesLabel: UILabel!
    @IBOutlet weak var totalDeathsLabel: UILabel!
    @IBOutlet weak var totalRecoveredLabel: UILabel!
    @IBOutlet weak var todayRecoveredLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = covid19Info.country
        
        //Map
        let lat = covid19Info.countryInfo.lat
        let long = covid19Info.countryInfo.long
        mapView.region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: lat, longitude: long), latitudinalMeters: 2500000, longitudinalMeters: 2500000)
        let countryAnnotation = MKPointAnnotation()
        countryAnnotation.title = "\(covid19Info.cases)"
        countryAnnotation.coordinate = CLLocationCoordinate2D(latitude: lat, longitude: long)
        countryAnnotation.subtitle = "\(covid19Info.deaths)"
        mapView.addAnnotation(countryAnnotation)
        
        totalCasesLabel.text = String(covid19Info.cases)
        totalDeathsLabel.text = String(covid19Info.deaths)
        totalRecoveredLabel.text = String(covid19Info.recovered)
        todayRecoveredLabel.text = String(covid19Info.todayRecovered)
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        
    }

    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 2
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return 1
//    }
//
//
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
//
//        // Configure the cell...
//
//        return cell
//    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
