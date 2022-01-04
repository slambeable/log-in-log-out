//
//  User.swift
//  LogInLogOut
//
//  Created by Андрей Евдокимов on 04.01.2022.
//

struct User {
    let login: String
    let password: String

    let person: Person
    
    static func getUser() -> User {
        return User(
            login: "Bob",
            password: "Password",
            person: Person.getPerson()
        )
    }
}
