//
//  Questions.swift
//  IOSInterviewApp
//
//  Created by Григорий Виняр on 08/07/2022.
//

import Foundation

enum QuestionsType: String {
    case swift
    case network
    case multithrading
    case ui
    case dataBase
    case patterns
}

class Questions {
    
    func chooseQuestionsType(of type: QuestionsType) -> [String : String] {
        switch type {
        case .swift        : return swiftQuestions
        case .network      : return networkQuestions
        case .multithrading: return multithradingQuestions
        case .ui           : return uiQuestions
        case .dataBase     : return dataBaseQuestions
        case .patterns     : return patternsQuestions
        }
    }
    
    private let swiftQuestions: [String : String] =
        ["Что такое перечисления (enumerations) в Swift?" : "Перечисление (enumeration)- это группа связанных значений.Перечисления позволяют писать безопасный для типов код.",
         "Что такое Optional в Swift? Как его создать?" : "Optional - это тип, который может хранить либо значение, либо nil. Вы можете создать optional, добавив вопросительный знак ? после любого типа",
         "Что такое typealias в Swift? Как его можно создать?" : "Typealias, как следует из названия, является псевдонимом для существующего типа данных.",
         "Назовите 5 утверждений передачи управления (Control Transfer Statements) и опишите, как их использовать." : "break, continue, fallthrough, throw, return. Например, вы можете использовать оператор передачи управления break для завершения выполнения цикла for, когда продолжение цикла считается ненужным",
         "Зачем нужен completion handler в Swift?" : "Completion handlers (обработчики завершения) — это замыкания в действии. Предположим, вы выполняете трудоемкую задачу, например сетевой запрос, и хотите что-то сделать сразу после завершения запроса.",
         "Что делает init() в Swift?" : "Метод init() используется для инициализации экземпляра.Инициализация означает подготовку экземпляра (класса, структуры или перечисления) к использованию.",
         "Let и Var в Swift?" : " Swift вы можете использовать let для создания константы (значения, которое нельзя изменить) и var для создания переменной (значения, которое может быть изменено позже).",
         "Что такое plist?" : "Plist, или список свойств, - это словарь пар ключ-значение, которые используются для хранения данных в файловой системе вашего проекта. Например, info.plist.",
         "Для чего нужны Protocols в Swift? Приведите пример." : "Протокол действует как чертеж для свойств, методов и т.д. Он описывает, как должен вести себя тип, соответствующий ему. Вы не можете создавать экземпляры протоколов. Скорее, вы можете сделать так, чтобы, например, класс соответствовал протоколу.",
         "Для чего нужен оператор вида «??» ?" : "Оператор двойного вопросительного знака ?? известен как оператор объединения (слияния) nil. Он возвращает значение в левой части, если оно не равно nil. Если левая часть равна nil, то возвращается значение в правой части.",
         "Для чего используется Guard?" : "Оператор guard используется для передачи управления программой за пределы области видимости. Оператор guard похож на оператор if, но он запускается только тогда, когда некоторые условия не выполняются.",
         "Для чего используется Defer в Swift?" : "Вы можете использовать метод defer для выполнения кода перед выходом из области видимости.",
         "В чем разница между структурами и классами?" : "1. Структуры - это типы значений, в то время как классы - ссылочные типы.2. Структуры не поддерживают наследование, а классы поддерживают.3. В классе мы можем создать экземпляр с помощью ключевых слов let и попытаться изменить его свойство, в то время как в структурах такой возможности нет.4. Структуры не поддерживают приведение типов, а классы поддерживают.",
         "Что такое дженерики? Приведите пример использования дженериков" : "Дженерики позволяют писать гибкий и многократно используемый код, который может работать с любым типом данных. Представьте, что вы пишете трехмерную векторную структуру, но хотите иметь возможность создавать векторы, используя целые, плавающие и двойные числа. Вы определенно не хотите писать один и тот же код для каждого типа данных отдельно.",
         "В чем разница между операторами == и ===?" : "== - оператор равенства. === - оператор тождества"]
    
    private let networkQuestions: [String : String] =
        ["Что делает ключевое слово Mutating?" : "Вы можете использовать ключевое слово mutating, чтобы разрешить изменение свойств структуры в методе, пометив этот конкретный метод mutating.",
         "Что означает http, tcp?" : "Протокол передачи гипертекста (HTTP) и протокол управления передачей (TCP) — это компьютерные протоколы, участвующие в передаче данных, но хотя они по отдельности служат своим целям, между ними существует тесная связь.",
         "Какими способами можно работать с networking?" : "URLSession, Alamofire",
         "Какие виды запросов бывают" : "GET, POST, PUT, DELETE",
         "Чтобы зарегистрировать юзера, какой вид запроса нужно создать" : "GET",
         "С помощью какого enum мы можем обработать error и success?" : "Result",
         "Что такое URLSessionConfiguration?" : "Объект определяет поведение и политики, используемые при загрузке и выгрузке данных с помощью объекта. При загрузке или выгрузке данных создание объекта конфигурации всегда является первым шагом, который необходимо сделать. Вы используете этот объект для настройки значений тайм-аута, политик кэширования, требований к подключению и других типов информации, которые вы собираетесь использовать с вашим объектом."]
    
    private let multithradingQuestions: [String : String] =
        ["Какие технологии в iOS возможно использовать для работы с потоками." : "Thread, GCD, NSOperation",
         "Чем отличается dispatch_async от dispatch_sync?" : "Единственное отличие состоит в том, что при dispatch_sync возврат осуществляется только после завершения блока, тогда как при dispatch_async возврат после его добавления в очередь может не завершиться.",
         "Что такое deadlock?" : "Ситуация в многозадачной среде или СУБД, при которой несколько процессов находятся в состоянии бесконечного ожидания ресурсов, захваченных самими этими процессами.",
         "Что такое livelock?" : "Тип взаимной блокировки, при котором несколько потоков выполняют бесполезную работу, попадая в зацикленность при попытке получения каких-либо ресурсов. При этом их состояния постоянно изменяются в зависимости друг от друга.",
         "Что такое семафор?" : "Семафоры позволяют вам контролировать доступ нескольких потребителей в определенном (ограниченном) количестве ресурсов. Например, если вы создали семафор с пулом из двух ресурсов, то одновременно максимум только два потока смогут получить доступ к критической секции. Другие элементы, которые захотят использовать ресурс, будут должны ждать в очереди в порядке их добавления в нее.",
         "Что такое mutex?" : "Mutex подобен замку. Разница в том, что это могут быть разные процессы, а не только треды. ",
         "Асинхронность vs многопоточность. Чем отличаются?" : "Асинхронное программирование — это асинхронная последовательность задач, а многопоточность — несколько потоков, работающих параллельно."]
    
    private let uiQuestions: [String : String] =
        ["В чем разница между @IBOutlet и @IBAction" : "Первое - это свойство, второе - метод",
         "Что такое CALayer?" : "Класс предостовляющий работу с UI на низком уровне (CoreGraphics)",
         "В каком методе можно подменить базовую UIView?" : "LoadView()",
         "Чем отличается UITableView от UICollectionView?" : "В UITableView нельзя создать кастомный лэйоут и возможно только осуществить вертикальный вариант расположения ячеек",
         "Что очень важно при обновлении пользовательского интерфейса в многопоточном приложении? Как вы можете это сделать?" : "Обновлять только в основном потоке или в основной очереди.",
         "Что делать, когда клавиатура появляется и скрывает некоторые важные части пользовательского интерфейса — реализация логики?" : "Это можно решить с помощью делегатов уведомлений прокрутки и клавиатуры.",
         "Что такое UIStackView?" : "UIStackView предоставляет способ компоновки серии представлений по горизонтали или по вертикали.",
         "Объясните разницу между UIWindow и UIView?" : "Windows не имеет видимого содержимого , но предоставляет базовый контейнер для представлений вашего приложения. Представления определяют часть окна, которую вы хотите заполнить некоторым содержимым.",
         "Объясните, что такое цепочка респондентов?" : "Первый объект в ResponderChain называется First Responder. Цепочка ответчиков представляет собой ряд связанных объектов ответчиков. Он начинается с первого респондента и заканчивается объектом приложения. Если первый респондент не может обработать событие, он перенаправляет событие следующему респонденту в цепочке респондентов.",
         "Что такое иерархия UIButton?" : "UIButton -> UIControl -> UIView -> UIResponder -> NSObject."]
    
    private let dataBaseQuestions: [String : String] =
        ["Какие варианты сохранения данных доступны на iOS?" : "В зависимости от случая и объема данных существуют разные способы хранения данных. Примерами являются пользовательские настройки по умолчанию, сохранение файлов, связка ключей, основные данные. Существуют также сторонние библиотеки, такие как Realm.",
         "В каких случаях вы бы использовали UserDefaults?" : "UserDefaults — отличный способ сохранить небольшой объем данных. Вы можете хранить базовые типы, такие как Bool, Int, Stringи т. д., а также более сложные типы, такие как массивы и словари.",
         "Как бы вы сохраняли большие объемы объектов данных со связями в iOS?" : "Core Data или Realm Database часто используются в iOS для работы с большими объемами данных. Это, конечно, не единственные варианты. Например, вы также можете использовать базу данных SQL, есть несколько библиотек SQL, например SQLite.swift.",
         "Объясните, что означает миграция данных и когда ее необходимо выполнять?" : "Миграция данных часто необходима, когда нужно внести изменения в модель данных. Поэтому каждый раз, когда модель данных нуждается в изменении, например, для запроса новой функции, вам нужно будет создать новую версию модели данных и указать путь миграции. Альтернативой миграции является простое удаление и перестроение хранилища данных. Но это только вариант, если сохраненные пользовательские данные могут быть полностью восстановлены, например, из внутреннего API.",
         "Что такое object graph в CoreData?" : "CoreData -> Persistance Data -> Core Data Stack.",
         "Является ли CoreData эквивалентом SQLite или какой-то оболочке?" : "Нет, Core Data — это фреймворк для управления графом объектов. SQLite — это реляционная база данных. SQLite — это база данных, а Core Data — нет. Core Data может использовать SQLite в качестве постоянного хранилища, но сам фреймворк не является базой данных.",
         "Как Core Data ведет себя с многопоточностью?" : "Предполагается, что Core Data будет выполняться в одном потоке.",
         "Как прочитать только несколько свойств сущности?" : "Это может быть достигнуто с помощью свойства экземпляра propertiesToFetch Core Data.",
         "Что такое NSFetchRequest?" : "NSFetchRequest — это класс, отвечающий за выборку из Core Data. Запросы на выборку являются мощными и гибкими. Вы можете использовать запросы на выборку для получения набора объектов, соответствующих заданным критериям, отдельным значениям и т. д.",
         "Объясните NSPersistentContainer?" : "Персистентный контейнер создает и возвращает контейнер, загрузив в него хранилище для приложения. Это свойство является необязательным, поскольку существуют допустимые условия ошибки, которые могут привести к сбою создания хранилища.",
         "Какие преимущества дает Realm?" : "База данных с открытым исходным кодом. Реализовано с нуля. Хранилище объектов с нулевым копированием. Быстро.",
         "Что такое ограничения SQLite?" : "Нам нужно определить отношения между таблицами. Определите схему всех таблиц. Мы должны вручную писать запросы для получения данных. Нам нужно запросить результаты, а затем сопоставить их с моделями. Запросы очень быстрые.",
         "Что такое правила удаления в основных данных?" : "Правило удаления отношения указывает, что должно произойти, если будет предпринята попытка удалить исходный объект.",
         "Как выполнить миграцию основных данных?" : "Постоянное хранилище привязано к конкретной версии модели данных. Он хранит ссылку на идентификатор модели данных. Если модель данных изменится, нам нужно сообщить Core Data, как перенести данные постоянного хранилища в новую версию модели данных."]
    
    private let patternsQuestions: [String : String] =
        ["Что такое MVC, объясните концепцию MVC?" : " Модель будет только инкапсулировать данные, она не должна содержать никакой бизнес-логики. Представление инкапсулирует то, что пользователь может видеть в пользовательском интерфейсе, и оно также не должно иметь бизнес-логики. Контроллер должен поддерживать все виды бизнес-логики, которая проходит между представлением и моделью.",
         "Что такое MVVM?" : "MVVM/Model-View-ViewModel — это архитектурный шаблон, позволяющий отделить бизнес-логику и логику представления от пользовательского интерфейса. Создание чистого разделения поможет вам легко находить ошибки и эффективно тестировать. MVVM будет хорошим выбором, если вы хотите уменьшить размер вашего контроллера представления и сделать бизнес-логику более читаемой. Модель представления вызывает изменения в модели и обновляет себя обновленной моделью, и, поскольку у нас есть привязка между представлением и моделью представления, первая обновляется соответствующим образом.",
         "Что такое шаблон Singleton и почему нам следует избегать его чрезмерного использования? " : "Шаблон singleton (Creational) гарантирует, что только один экземпляр класса создается за время существования приложения. Это очень простой шаблон для реализации, но он также имеет плохую репутацию из-за неправильного использования. Синглтон убивает идею «разделения интересов», поскольку к нему можно получить доступ отовсюду (они обычно используются как глобальный экземпляр). Синглтон нарушает принцип единой ответственности и делает код очень тесно связанным.",
         "Почему синглтоны плохи для тестирования?" : "Синглтон — это проблема с точки зрения тестирования. Они, как правило, затрудняют написание изолированных модульных тестов, потому что один тест может изменить глобальное значение, которое недействительно для других тестов.",
         "Почему при использовании шаблона делегирования переменная делегата является слабой?" : "Так что он не поддерживает ссылку на объект, который он не имеет права сохранять.",
         "Что такое фабричный метод в Swift?" : "Фабричный метод — это порождающий шаблон проектирования, который решает проблему создания объектов без указания их конкретных классов.",
         "Что такое антипаттерн?" : "Антишаблон используется с верой в то, что он решит конкретную проблему, но в долгосрочной перспективе создаст больше проблем, чем преимуществ. Шаблоны, считающиеся плохой практикой разработки программного обеспечения, являются анти-шаблонами. Иногда синглтон считается антипаттерном из-за неправильного использования.",
         "Что такое шаблон адаптера? " : "Шаблон проектирования адаптера позволяет двум объектам со связанными функциями работать вместе, даже если они имеют несовместимые интерфейсы. Адаптер позволяет объектам взаимодействовать с другими объектами там, где они обычно не могут работать из-за разных интерфейсов. Это структурный шаблон проектирования, который полезен для объединения классов и объектов в более крупную систему. Swift не поддерживает множественное наследование, но Swift поддерживает соответствие нескольким протоколам, вы можете реализовать шаблон адаптера с помощью протоколов.",
         "Что такое шаблон наблюдателя? " : "Паттерн наблюдателя — это поведенческий шаблон проектирования, в котором объекты могут уведомлять другие объекты об изменениях своего состояния. Шаблон Observer предоставляет способ подписываться на эти события и отписываться от них для любого объекта, реализующего интерфейс подписчика. Мы можем реализовать шаблон наблюдателя двумя способами в Swift — уведомления и наблюдение за ключом-значением.",
         "Какова схема делегирования?" : "Делегирование — это шаблон проектирования, который позволяет классу или структуре передавать (или делегировать) часть своих обязанностей экземпляру другого типа. Делегирующий объект обычно хранит ссылку на другой объект (делегата) и отправляет ему сообщение в соответствующее время."]
}