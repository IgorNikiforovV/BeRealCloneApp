//
//  Year.swift
//  BeRealCloneApp
//
//  Created by Игорь Никифоров on 05.12.2024.
//

public struct Year {
    public var day: String
    public var month: String
    public var year: String

    init(day: String, month: String, year: String) {
        self.day = day
        self.month = month
        self.year = year
    }

    var date: String {
        "\(day)/\(month)/\(year)"
    }
}
