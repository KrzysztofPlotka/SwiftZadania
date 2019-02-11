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

}


