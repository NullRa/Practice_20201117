//
//  AddTwoNumbersViewModel.swift
//  Practice_20201117
//
//  Created by Jay on 2020/12/1.
//

import Foundation

enum ListType: String {
    case listA
    case listB
}

class AddTwoNumbersViewModel {
    private var listA: ListNode?
    private var listB: ListNode?
    init(){}
    func setListAndGetString(list:ListType, newNumber: Int) -> String{
        resetList(list: list)
        setList(list: list, newNumber: newNumber)
        return getListString(list: list)
    }
    func checkListIsNil() -> ListType? {
        if listA == nil {
            return .listA
        }
        if listB == nil {
            return .listB
        }
        return nil
    }
    func addTwoNumbers() -> ListNode? {
        var listATail = listA
        var listBTail = listB
        var head: ListNode? = nil
        var tail: ListNode? = nil
        var carry = 0
        while listATail != nil || listBTail != nil {
            let sum = (listATail?.val ?? 0) + (listBTail?.val ?? 0) + carry
            carry = sum/10
            let val = sum%10
            let node = ListNode(val)
            if head == nil {
                head = node
            } else {
                tail?.next = node
            }
            tail = node
            listATail = listATail?.next
            listBTail = listBTail?.next
        }
        if carry != 0 {
            tail?.next = ListNode(carry)
        }
        return head
    }
    private func resetList(list:ListType){
        switch list {
        case .listA:
            listA = nil
        case .listB:
            listB = nil
        }
    }

    private func setList(list: ListType, newNumber: Int){
        var number = newNumber

        if number == 0 {
            switch list {
            case .listA:
                listA = ListNode(0)
            case .listB:
                listB = ListNode(0)
            }
        }
        while(number%10 > 0 || number > 10){
            switch list {
            case .listA:
                if self.listA == nil {
                    self.listA = ListNode(number%10)
                } else {
                    var a = self.listA
                    while a?.next != nil {
                        a = a?.next
                    }
                    a?.next = ListNode(number%10)
                }
            case .listB:
                if self.listB == nil {
                    self.listB = ListNode(number%10)
                } else {
                    var b = self.listB
                    while b?.next != nil {
                        b = b?.next
                    }
                    b?.next = ListNode(number%10)
                }
            }
            number = number/10
        }
    }

    private func getListString(list:ListType) -> String{
        switch list {
        case .listA:
            return "Input List A: [\(self.listA?.showListString() ?? "ERROR")]"
        case .listB:
            return "Input List B: [\(self.listB?.showListString() ?? "ERROR")]"
        }
    }
}
