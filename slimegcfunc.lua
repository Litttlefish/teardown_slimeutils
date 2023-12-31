-- version 1.0.3, source: https://github.com/Litttlefish/teardown_slimeutils
-- please do not rename slimegcfunc.lua, thanks.

--{
    getmetatable(newproxy(true)).__gc = function(self) upongc(self) return newproxy(self) end
--}

--[[
    proxy is a lua 5.1 built-in zero-size userdata which can call __gc metamethod when being recycled
    newproxy(true) creates a proxy with a blank metatable
    newproxy(false) creates one without metatable
    newproxy(proxy) creates another proxy that shares the metatable with the original one
    so what's happening here is:
        calls upongc() function when being recycled
        then revive the metatable with a new proxy so it can be recycled again
--]]