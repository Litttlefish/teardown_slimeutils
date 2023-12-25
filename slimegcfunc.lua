-- version 1.0.1
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
        then revive itself with a new proxy that has the same metatable so it can be recycled again
--]]