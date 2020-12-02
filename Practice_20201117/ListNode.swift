//
//  ListNode.swift
//  Practice_20201117
//
//  Created by Jay on 2020/12/1.
//

import Foundation
class ListNode {
    var val: Int
    var next: ListNode?

    init(_ val: Int){
        self.val = val
        self.next = nil
    }

    func showListString() -> String {
        var string = "\(val)"
        var nextNode = next
        while nextNode != nil {
            string = "\(string), \(nextNode!.val)"
            nextNode = nextNode?.next
        }
        return string
    }
}
