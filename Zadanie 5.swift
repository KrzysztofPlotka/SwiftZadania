protocol CanBeChanged{

	var done: Bool {get set }

}

protocol Delegate{

	func display() -> Void

}


class CheckListElement:CanBeChanged, CustomStringConvertible{

	var day: String 
	var name:String
	var done:Bool
	var delegate: Delegate?

	init(day: String, name: String, done: Bool)
	{
		self.day = day
		self.name = name
		self.done = done
	}

	init()
	{
		self.day = "Poniedzialek" 
		self.name = "Brak"
		self.done = false
	}
 
	func changeProgress(change: Bool)-> Void{
		done = change;
		delegate?.display()
	}
 
	var description: String {
		if (done == false)      {return "\(day) \(name) --> Do zrobienia"}
		else                    {return "\(day) \(name) --> Gotowe"}
	}

}

class CheckList: Delegate{

	var ListElements: [CheckListElement]

	
	init(ListElements:[CheckListElement]){

		self.ListElements=ListElements

		for element in ListElements{	

			element.delegate = self
	
		}
	}

	func display () ->Void{

		for element in ListElements{
		
			print(element)

		}
	}
	
	func display3 () ->Void{
		
		for i in stride(from:0, to: ListElements.count,by: 3){ print(ListElements[i]) }
		
	}

}

let note1 = CheckListElement()
let note2 = CheckListElement(day: "Wtorek", name: "Wyniesc smieci", done:false)
let note3 = CheckListElement(day: "Sroda", name: "Skosic trawnik", done:false)
let note4 = CheckListElement(day: "Czwartek", name: "Zrobic obiad", done:false)
let note5 = CheckListElement(day: "Piatek", name: "Posprzatac dom", done:false)
let note6 = CheckListElement(day: "Sobota", name: "Odwiedzic babcie", done:false)
let note7 = CheckListElement(day: "Niedziela", name: "Isc do kosciola", done:false)

var arr = [note1, note2, note3, note4, note5, note6, note7]

let list = CheckList(ListElements: arr)
note1.changeProgress(change: true)
print()
list.display3()