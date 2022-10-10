function love.conf(t)
	t.modules.joystick = false
	t.externalstorage = true
	t.title = "Csakennijottunk game(v.001)"
	t.window.width,t.window.height = 720,960
	t.console = true
	love.filesystem.setIdentity("Jatek")
end