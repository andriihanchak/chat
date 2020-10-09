//
//  Generator.swift
//  Chat
//
//  Created by Andrii Hanchak on 09.10.2020.
//

import Foundation

final class Generator {
    
    private var messages: [String] = [
        "Meatball sausage.",
        "Turducken pig pork chop.",
        "Turkey pig short ribs alcatra spare ribs bresaola chicken.",
        "Spicy jalapeno bacon ipsum dolor amet pork chop corned beef ham pork bresaola pork loin.",
        "Leberkas corned beef tenderloin.",
        "Swine capicola kielbasa filet mignon spare ribs boudin short loin turkey bresaola landjaeger tongue ball tip.",
        "Pork chop fatback pig boudin.",
        "Chislic landjaeger pork chop kevin meatball andouille cow. ",
        "Cow beef pork loin turducken chislic.",
        "Pork chop fatback pig boudin.",
        "Frankfurter ribeye ham pork chop shoulder bresaola alcatra salami cupim kielbasa boudin, filet mignon cow flank.",
        "Rump turkey corned beef pork jowl.",
        "Pig pork short ribs, strip steak short loin swine ribeye shankle frankfurter ball tip ham ham hock leberkas sirloin kielbasa.",
        "Burgdoggen pastrami beef.",
        "Pastrami ribeye cupim hamburger pork loin kielbasa cow strip steak fatback meatloaf leberkas.",
        "Spare ribs t-bone pork.",
        "Meatball sausage tenderloin, cow pork loin tail pig frankfurter tongue strip steak shank bresaola.",
        "Shoulder pig cupim drumstick kielbasa capicola prosciutto ball tip, frankfurter beef tri-tip pork loin brisket salami. Turkey pork chop ham salami, sausage strip steak cupim swine fatback pork."
    ]
    
    func generate(number: Int) -> Item {
        let rawKind = Int.random(in: 0...1)
        guard let kind = Kind(rawValue: rawKind)
        else { fatalError() }
        let index = Int.random(in: 0..<messages.count)
        let message = "\(messages[index]) [\(number)]"
        return Item(kind: kind, message: message)
    }
}
