//
//  ViewModel.swift
//  Practice_20201117
//
//  Created by Jay on 2020/11/25.
//

import Foundation

class ViewModel {
    let cellTitleList: [String] = ["1. Two Sum", "2. Add Two Numbers"]
    init(){}

    func getCellTitle(index: Int) -> String {
        return cellTitleList[index]
    }

    func getTableArrayCount() -> Int{
    return cellTitleList.count
    }
}
