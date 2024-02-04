
import Foundation

// На главном потоке по букве асинхронно выведите “HELLO”. Для букв “H” и “O” дополнительно, перед выводом вызовите sleep(1).

//DispatchQueue.main.async {
//    sleep(1)
//    print("H")
//}
//DispatchQueue.main.async { print("E") }
//DispatchQueue.main.async { print("L") }
//DispatchQueue.main.async { print("L") }
//DispatchQueue.main.async {
//    sleep(1)
//    print("O")
//}

// В песочнице на глобальной очереди по букве выведите “HELLO”. Для букв “H” и “O” дополнительно, перед выводом вызовите sleep(1).
DispatchQueue.global().sync {
    sleep(1)
    print("H")
}
print("E")
print("L")
print("L")
print("O")

