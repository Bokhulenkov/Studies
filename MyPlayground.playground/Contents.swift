import UIKit

/*
 Задание 1: Списки фильмов

 Представьте, что вы пишете приложение для просмотра фильмов на языке Swift.
 Пользователи могут создавать списки фильмов и делиться этими списками с другими пользователями.
 Создайте класс User и класс List, который использует семантику ссылок, чтобы помочь поддерживать списки между пользователями.
 - User: содержит метод addList(_:), который добавляет заданный список в словарь объектов List (используя имя в качестве ключа), и list(forName:) -> List?, который возвращает список для заданного имени.
 - List: Содержит имя и массив названий фильмов. Метод print выводит все фильмы в списке.
 - Создайте пользователей jane и john и попросите их создавать и обмениваться списками. Пусть jane и john изменят один и тот же список и вызовут print у обоих пользователей. Все ли изменения отражены?
*/

    
final class User {
    private var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func addList(_ listOwner: List, _ film: String){
        listOwner.list.append(film)
    }
    
//    ни как не могу решить как вернуть List?
//    list(forName:) -> List?, который возвращает список для заданного имени.
    func list(forName name: String) {
        var tmp = List(owner: User(name: name))
        tmp.list
    }
}

final class List {
    private var owner: User?
    fileprivate var list: [String] = []
    
    init(owner: User? = nil) {
        self.owner = owner
    }
}


// у меня есть пользователь Jane
let jane = User(name: "Jane")
// у Jane есть список фильмов
let janeList = List(owner: jane)
janeList.list
// добавляем фильм в плейлист
jane.addList(janeList, "Terminator")
jane.addList(janeList, "Murzilka")

jane.list(forName: "Jane")


let johnList = List(owner: User(name: "John"))
