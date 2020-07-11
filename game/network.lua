local socket = require "socket"
local udp
local serverAddress
local serverPort = 16161
local clientPort = 61616
local updateRate = 0.5

local Network = {}

function Network:init()
	udp = socket.udp()
end

function Network:tick(dt)

	if self.server then
		self.server.tick(dt)
	end
	
	if self.client then
		self.client.tick(dt)
	end
end

function Network:getBasicInfo()
	local _ip, _port = udp:getsockname()
	print("local network ip: " .. tostring(_ip) .. " port: " .. tostring(_port))
end

function Network:startServer()
	Network:init()
	
	self.server = {}
	self.server.updateTick = 0
	
	udp:settimeout(0)
	udp:setsockname("0.0.0.0", serverPort)
	assert(udp:setoption("broadcast", true))
	
	print("network: server started at...", serverPort)
	
	self.server.tick = function(dt)
		self.server.updateTick = self.server.updateTick + dt
		
		if self.server.updateTick > updateRate then
			self.server.promote()
			self.server.listen()
			
			self.server.updateTick = 0
		end
	end
	
	self.server.listen = function()
		-- listen to incomming messages
		local datagram, msg_or_ip, port_or_nil
		repeat
			datagram, msg_or_ip, port_or_nil = udp:receivefrom()
			if datagram then
				print("server received: " .. datagram)
			
				if datagram == "askjoin" then
					-- TODO: can this client join?
					udp:sendto("acceptjoin", msg_or_ip, port_or_nil)
					print("server: accepted client at " .. msg_or_ip)
				end
				
			else
				print("NETWORK ERROR: " .. tostring(msg_or_ip))
			end
		until not datagram
		
	end
	
	self.server.promote = function()
		print("server: sending promo...")
		assert(udp:sendto("promo", "255.255.255.255", clientPort))
	end
	
end

function Network:startClient()
	Network:init()
	
	self.client = {}
	self.client.updateTick = 0
	self.client.connected = false
	self.client.joinRequestPending = false
	
	udp:settimeout(0)
	udp:setsockname("0.0.0.0", clientPort)
	
	self.client.tick = function(dt)
		self.client.updateTick = self.client.updateTick + dt
		
		if self.client.updateTick > updateRate then
			self.client.listen()
			
			self.client.updateTick = 0
		end
	end
	
	self.client.listen = function()
		local datagram, err_msg, ip_or_nil, port_or_nil

		repeat
			datagram, msg_or_nil, port_or_nil = udp:receivefrom()
			if datagram then
				print("client received: " .. datagram)
				
				if datagram == "promo" then
					if not self.client.joinRequestPending then
						if udp:sendto("askjoin", msg_or_nil, port_or_nil) then
							self.client.joinRequestPending = true
						end
					end
				
				elseif datagram == "acceptjoin" then
					self.client.joinRequestPending = false
					
					print("network: client connected to...")
					print(msg_or_nil, port_or_nil)
					
					local _ip, _port = udp:getsockname()
					print("client ip: " .. tostring(_ip) .. " port: " .. tostring(_port))
				end
				
			else--if err_msg ~= "timeout" then
				print("client: Network error (2): " .. tostring(msg_or_nil))
			end
		until not datagram
		
	end
	
end

return Network
