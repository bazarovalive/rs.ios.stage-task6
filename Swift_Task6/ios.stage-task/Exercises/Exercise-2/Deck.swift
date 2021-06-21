import Foundation

protocol DeckBaseCompatible: Codable {
    var cards: [Card] {get set}
    var type: DeckType {get}
    var total: Int {get}
    var trump: Suit? {get}
}

enum DeckType:Int, CaseIterable, Codable {
    case deck36 = 36
}

struct Deck: DeckBaseCompatible {

    //MARK: - Properties

    var cards = [Card]()
    var type: DeckType
    var trump: Suit?

    var total:Int {
        return type.rawValue
    }
}

extension Deck {

    init(with type: DeckType) {
        self.type = type
//        let suits = Suit.allCases
//        let values = Value.allCases
//        cards = createDeck(suits: suits, values: values)
    }

    public func createDeck(suits:[Suit], values:[Value]) -> [Card] {
        var deck = [Card]()
               for suit in suits {
                   for value in values {
                       deck.append(Card(suit: suit, value: value))
                   }
               }
               return deck
    }

    public mutating func shuffle() {
        cards.shuffle()
    }

    public mutating func defineTrump() {
        if self.cards.count > 0 {
            self.trump = self.cards.first!.suit
            self.setTrumpCards(for: self.trump!)
        }
    }

    public mutating func initialCardsDealForPlayers(players: [Player]) {
            for player in players {
                player.hand = .init()
                for _ in 1...6 {
                    guard let card = cards.popLast() else {return}
                    player.hand?.append(card)
                }
            }
        }

    public mutating func setTrumpCards(for suit:Suit) {
            for (index, card) in cards.enumerated() {
                if card.suit == suit {
                    cards[index].isTrump = true
                }
            }
        }
}

