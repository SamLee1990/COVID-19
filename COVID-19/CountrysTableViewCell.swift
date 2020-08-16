//
//  CountrysTableViewCell.swift
//  COVID-19
//
//  Created by 李世文 on 2020/8/15.
//

import UIKit

class CountrysTableViewCell: UITableViewCell {
    

    @IBOutlet weak var countryNameLabel: UILabel!
    @IBOutlet weak var countryFlagImageView: UIImageView!
    @IBOutlet weak var todayCasesLabel: UILabel!
    @IBOutlet weak var todayDeathsLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func update(with covid19Info: Covid19) {
        countryNameLabel.text = covid19Info.country
        todayCasesLabel.text = String(covid19Info.todayCases)
        todayDeathsLabel.text = String(covid19Info.todayDeaths)
    }

}
