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

    func appendNums(num:Int) -> String{
        nums.append(num)
        return getNumsLblString()
    }

    func removeValueFromNums(element: Int) -> String{
        let index = nums.firstIndex(of: element)!
        nums.remove(at: index)
        return getNumsLblString()
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

    func checkNumsAndTarget() -> String? {
        if nums.isEmpty {
            return "Output: Nums is empty."
        }
        if target == nil {
            return "Output: Target is nil."
        }
        return nil
    }
}
