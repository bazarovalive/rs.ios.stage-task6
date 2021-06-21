import Foundation

class CoronaClass {
 
    var seats = [Int]() { didSet { seats.sort() } }
    let n: Int
    
     init(n: Int) {
        if n > 0 && n <= 100 {
            self.n = n
        } else {
            self.n = 0
        }
     }
     
     func seat() -> Int {
        var numOfSeat = 0
        if seats.isEmpty {
            numOfSeat = 0
            seats.append(0)
        } else if seats.count == n {
            numOfSeat = 0
        } else {
            
            
        }
        return numOfSeat
     }
     
     func leave(_ p: Int) {
        if seats.contains(p) {
            if let index = seats.firstIndex(of: p) {
                seats.remove(at: index)
            }
        }
     }
}
