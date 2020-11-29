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

    func getAnswerDict() -> [(Int,Int)] {
        var answerTupleArray: [(Int,Int)] = []
        guard let target = target else {
            return answerTupleArray
        }
        var numberIndexDict = [Int:Int]()
        for (index, num) in nums.enumerated() {
            guard let pairedIndex = numberIndexDict[target - num] else {
                numberIndexDict[num] = index
                continue
            }
            answerTupleArray.append((pairedIndex,index))
        }
        return answerTupleArray
    }

    func twoSum() -> String {
        let answer = getAnswerDict()
        switch answer.count {
        case 0:
            return "No Paired element."
        case 1:
            return "[\(answer[0].0), \(answer[0].1)]"
        default:
            return "Over 1 solve, first is [\(answer[0].0), \(answer[0].1)]"
        }
    }
}
