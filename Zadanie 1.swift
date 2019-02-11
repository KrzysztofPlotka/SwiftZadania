class CheckListElement: CustomStringConvertible{

	var name:String
	var done:Bool

	init(name: String, done: Bool)
	{
		self.name = name
		self.done = done
	}

	init()
	{
		self.name = "Brak"
		self.done = false
	}
 
	var description: String {
	if (done == false)      {return "\(name) --> Do zrobienia"}
	else                    {return "\(name) --> Gotowe"}
	}

}
