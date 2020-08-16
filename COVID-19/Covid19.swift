//
//  Covid19.swift
//  COVID-19
//
//  Created by 李世文 on 2020/8/12.
//

import Foundation

struct Covid19: Decodable {
    let country: String
    let countryInfo: CountryInfo
    let cases: Int
    let todayCases: Int
    let deaths: Int
    let todayDeaths: Int
    let recovered: Int
    let todayRecovered: Int
    let active:Int
    let critical: Int
    let casesPerOneMillion: Double
    let deathsPerOneMillion: Double
    let tests: Int
    let testsPerOneMillion: Double
    let population: Int
    let continent: String
    let oneCasePerPeople: Double
    let oneDeathPerPeople: Double
    let oneTestPerPeople: Double
    let activePerOneMillion: Double
    let recoveredPerOneMillion: Double
    let criticalPerOneMillion: Double

    struct CountryInfo: Decodable {
        let _id: Int?
        let lat: Double
        let long: Double
        let flag: URL
    }
}
