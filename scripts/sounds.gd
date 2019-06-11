extends Node
	
func play(sample):
	
	get_node(sample)._set_playing(true)
	pass

func stop(sample):
	
	get_node(sample).stop()
	pass
