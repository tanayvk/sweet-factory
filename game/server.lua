local socket = require "socket"
local udp
local serverAddress
local serverPort = 16161
local clientPort = 61616
local updateRate = 0.5

udp = socket.udp()

server = {}
server.updateTick = 0

udp:settimeout(0)
udp:setsockname("0.0.0.0", serverPort)
assert(udp:setoption("broadcast", true))

print("network: server started at...", serverPort)

server.tick = function(dt)
    server.updateTick = server.updateTick + dt
    
    if server.updateTick > updateRate then
        server.promote()
        server.listen()
        
        server.updateTick = 0
    end
end

server.listen = function()
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

server.promote = function()
    print("server: sending promo...")
    assert(udp:sendto("promo", "255.255.255.255", clientPort))
end

return server
