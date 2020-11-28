//
//  TwoSumViewModel.swift
//  Practice_20201117
//
//  Created by Jay on 2020/11/28.
//

import Foundation

class TwoSumViewModel {
    private var nums: [Int] = []
    private var target: Int? = nil

    init(){}

    func getTarget() -> Int?{
        return target
    }

    func setTarget(newTarget: Int){
        target = newTarget
    }

    func appendNums(num:Int){
        nums.append(num)
    }

    func removeValueFromNums(element: Int) -> Bool{
        guard let index = nums.firstIndex(of: element) else {
            return false
        }
        nums.remove(at: index)
        return true
    }

    func checkNumsEmpty() -> Bool{
        return nums.isEmpty
    }

    func getNums() -> [Int] {
        return nums
    }

    func getNumsLblString() -> String{
        var string = ""
        for num in self.nums {
            if string != "" {
                string = "\(string), \(num)"
            } else {
                string = "\(num)"
            }
        }
        return string
    }
}
