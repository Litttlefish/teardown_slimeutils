# teardown_slimeutils
A Teardown modding lib collection about fast randoms, gc functions, etc.

## Description
**slimerand.lua**

A lib about fast and evenly distributed vectors and quaternions.


This library provides a faster generation method (`Fastrnd`) and a slower but more random equivalent (`Truernd`).

You can read the code to see the detailed generation types.

**How to use**

Fast random unit vectors on sphere
```lua
local randvec = Fastrnd.Sphere.UnitVec() -- Generate a fast random unit vector on a sphere
```

Fast random vectors in a ball with a radius of 42
```lua
local randvec = Fastrnd.Ball.RangedVec(42) -- Generate fast random vectors in a ball with a radius of 42
```

True random vectors in a unit ball, which has higher chance around center
```lua
local randvec = Truernd.ConcBall.UnitVec() -- Generate true random vectors in a unit ball with a higher chance around the center
```

True random quarternions with a 45-degree rotation
```lua
local randquat = Truernd.Quat.RangedAxisAngle(math.pi / 4) -- Generate true random quaternions with a 45-degree rotation
```
---
**slimegcfunc.lua**

A lib about garbage collection(GC) detection function.


The `upongc` function is designed to be triggered upon garbage collection events.

Customize this function based on your mod's specific requirements.

**How to use**

1. Include it in your mod.

2. Write a function named `upongc` in your mod's code. For example:
```lua
function upongc(t)
    DebugPrint("GC detected! userdata address: " .. tostring(t))
end
```
3. Launch the game and trigger a GC event by spamming tables or manually triggering the GC.

4. Observe the debug message to confirm GC detection.

5. Customize it to meet your needs.
