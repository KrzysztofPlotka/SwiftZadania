protocol CanBeChanged{

	var done: Bool {get set }

}

class CheckListElement:CanBeChanged, CustomStringConvertible{

	var day: String 
	var name:String
	var done:Bool


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
	}
  
	var description: String {
	if (done == false)      {return "\(day) \(name) --> Do zrobienia"}
	else                    {return "\(day) \(name) --> Gotowe"}
	}

}
