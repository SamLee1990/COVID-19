//
//  TaiwanTableViewController.swift
//  COVID-19
//
//  Created by 李世文 on 2020/8/16.
//

import UIKit
import MapKit

class TaiwanTableViewController: UITableViewController {

    @IBOutlet weak var countryNameLabel: UILabel!
    @IBOutlet weak var countryFlagImageView: UIImageView!
    @IBOutlet weak var todayCasesLabel: UILabel!
    @IBOutlet weak var todayDeathsLabel: UILabel!
    @IBOutlet weak var casesLabel: UILabel!
    @IBOutlet weak var deathsLabel: UILabel!
    @IBOutlet weak var recoveredLabel: UILabel!
    @IBOutlet weak var todayRecovered: UILabel!
    @IBOutlet weak var locationMapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlStr = "https://disease.sh/v3/covid-19/countries/TW?yesterday=true&twoDaysAgo=false&strict=true"
        
        if let url = URL(string: urlStr) {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let data = data{
                    let decode = JSONDecoder()
                    let covid19Info = try? decode.decode(Covid19.self, from: data)
                    if let covid19Info = covid19Info{
                        DispatchQueue.main.async {
                            self.countryNameLabel.text = String(covid19Info.country)
                            self.todayCasesLabel.text = String(covid19Info.todayCases)
                            self.todayDeathsLabel.text = String(covid19Info.todayDeaths)
                            self.casesLabel.text = String(covid19Info.cases)
                            self.deathsLabel.text = String(covid19Info.deaths)
                            self.recoveredLabel.text = String(covid19Info.recovered)
                            self.todayRecovered.text = String(covid19Info.todayRecovered)
                            
                            self.mapSet(covid19Info: covid19Info)
                            
                            self.tableView.reloadData()
                        }
                        
                        URLSession.shared.dataTask(with: covid19Info.countryInfo.flag) { (data, response, error) in
                            if let data = data{
                                DispatchQueue.main.async {
                                    self.countryFlagImageView.image = UIImage(data: data)
                                }
                            }
                        }.resume()
                        
                    }
                }
            }.resume()
        }
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    func mapSet(covid19Info: Covid19) {
        //Map
        locationMapView.region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: covid19Info.countryInfo.lat, longitude: covid19Info.countryInfo.long), latitudinalMeters: 500000, longitudinalMeters: 500000)
        let countryAnnotation = MKPointAnnotation()
        countryAnnotation.title = "\(covid19Info.cases)"
        countryAnnotation.coordinate = CLLocationCoordinate2D(latitude: covid19Info.countryInfo.lat, longitude: covid19Info.countryInfo.long)
        countryAnnotation.subtitle = "\(covid19Info.deaths)"
        locationMapView.addAnnotation(countryAnnotation)
    }

    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return 0
//    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

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
