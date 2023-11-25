import UIKit

/*
 Задание 1: Списки фильмов

 Представьте, что вы пишете приложение для просмотра фильмов на языке Swift.
 Пользователи могут создавать списки фильмов и делиться этими списками с другими пользователями.
 Создайте класс User и класс List, который использует семантику ссылок, чтобы помочь поддерживать списки между пользователями.
 - User: содержит метод addList(_:), который добавляет заданный список в словарь объектов List (используя имя в качестве ключа), и list(forName:) -> List?, который возвращает список для заданного имени.
 - List: Содержит имя и массив названий фильмов. Метод print выводит все фильмы в списке.
 - Создайте пользователей jane и john и попросите их создавать и обмениваться списками. Пусть jane и john изменят один и тот же список и вызовут print у обоих пользователей. Все ли изменения отражены?
 - Что произойдет, если вы реализуете то же самое со структурами? С какими проблемами вы столкнетесь?
*/

    
class User {
    var name: String
    
    func addList(_ listOwner: List, _ film: String){
        listOwner.list.append(film)
    }
    
    func list(forName: List) -> List? {
        return forName
    }
    
    init(name: String) {
        self.name = name
    }
}

class List {
    var owner: User?
    var list: [String] = [] {
        didSet { print(list) }
    }
    init(owner: User? = nil) {
        self.owner = owner
    }
}


let jack = User(name: "Jack")
let jackList = List(owner: jack)
jack.addList(jackList, "Terminator")
jack.addList(jackList, "Uno")

jack.list(forName: jackList)

let poll = User(name: "Poll")
let pollList = List(owner: poll)
poll.addList(jackList, "Poll came back")
poll.addList(pollList, "Stats")

pollList.list
jackList.list
