//
//  Person.swift
//  LogInLogOut
//
//  Created by Андрей Евдокимов on 04.01.2022.
//

struct Person {
    let name: String
    let age: Int
    let favoriteFood: String
    let about: String
    
    static func getPerson() -> Person {
        return Person(
            name: "Bob Blob",
            age: 18,
            favoriteFood: "Apple",
            about: "I'am a cool guy"
        )
    }
}
