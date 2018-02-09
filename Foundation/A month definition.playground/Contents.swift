import Foundation

let calendar = Calendar(identifier: .gregorian)

let dateComponents1 = DateComponents(year: 2018, month: 1, day: 30)
let from = calendar.date(from: dateComponents1)!

let dateComponents2 = DateComponents(year: 2018, month: 2, day: 28)
let to = calendar.date(from: dateComponents2)!

let components = calendar.dateComponents([.year, .month, .day], from: from, to: to)
components.year
components.month
components.day

// 1/30 -> 2/28 counts 1 month
