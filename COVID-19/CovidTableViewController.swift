//
//  CovidTableViewController.swift
//  COVID-19
//
//  Created by 李世文 on 2020/8/15.
//

import UIKit

class CovidTableViewController: UITableViewController {
    
    var covid19Infos = [Covid19]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlStr = "https://disease.sh/v3/covid-19/countries?yesterday=true&sort=todayCases&allowNull=false"
        
        if let url = URL(string: urlStr) {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let data = data{
                    let decode = JSONDecoder()
                    let covid19Results = try? decode.decode([Covid19].self, from: data)
                    if let covid19Results = covid19Results {
                        self.covid19Infos = covid19Results
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                        }
                    }
                }
            }.resume()
        }

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return covid19Infos.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Covid19Cell", for: indexPath) as! CountrysTableViewCell

        // Configure the cell...
        cell.update(with: covid19Infos[indexPath.section])
        
        cell.countryFlagImageView.image = UIImage(systemName: "flag.fill")
        URLSession.shared.dataTask(with: covid19Infos[indexPath.section].countryInfo.flag) { (data, response, error) in
            if let data = data{
                DispatchQueue.main.async {
                    cell.countryFlagImageView.image = UIImage(data: data)
                }
            }
        }.resume()

        return cell
    }
    

    @IBSegueAction func showDetialSegue(_ coder: NSCoder) -> DetialTableViewController? {
        let controller = DetialTableViewController(coder: coder)
        let section = tableView.indexPathForSelectedRow?.section
        if let section = section {
            controller?.covid19Info = covid19Infos[section]
        }
        return controller
    }
    

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
