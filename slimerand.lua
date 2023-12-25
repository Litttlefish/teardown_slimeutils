-- version 1.0.1
-- please do not rename slimerand.lua, thanks.
--init {
    local random = math.random
    math.randomseed(tonumber(tostring(newproxy(false)):sub(19, -2), 16))
    local samples, cbrs = {},{} -- pre-calculated data
	for i = 128, 1, -1 do
		local r = random()
		samples[i], cbrs[i] = (r ^ 0.135 - (1 - r) ^ 0.135) / 0.1975, r ^ (1 / 3) -- fast standard normal distribution
	end
--}

local function fast_std_norm_distr()
    local r = random()
    return (r ^ 0.135 - (1 - r) ^ 0.135) / 0.1975
end

Fastrnd = {
    Sphere = {
        UnitVec = function()
            return VecNormalize({samples[random(128)], samples[random(128)], samples[random(128)]})
        end,
        RangedVec = function(r)
            return VecScale(VecNormalize({samples[random(128)], samples[random(128)], samples[random(128)]}), r)
        end
    },
    Ball = {
        UnitVec = function()
            return VecScale(VecNormalize({samples[random(128)], samples[random(128)], samples[random(128)]}), cbrs[random(128)])
        end,
        RangedVec = function(r)
            return VecScale(VecNormalize({samples[random(128)], samples[random(128)], samples[random(128)]}), cbrs[random(128)] * r)
        end
    },
    ConcBall = {
        UnitVec = function()
            return VecScale(VecNormalize({samples[random(128)], samples[random(128)], samples[random(128)]}), random())
        end,
        RangedVec = function(r)
            return VecScale(VecNormalize({samples[random(128)], samples[random(128)], samples[random(128)]}), random() * r)
        end
    },
    Quat={
        Raw = function()
            return Quat(samples[random(128)], samples[random(128)], samples[random(128)], samples[random(128)]) -- the game will normalize it automatically so no worries!
        end,
        AxisAngle = function(d)
            return QuatAxisAngle({samples[random(128)], samples[random(128)], samples[random(128)]}, d)
        end,
        RangedAxisAngle = function(d)
            return QuatAxisAngle({samples[random(128)], samples[random(128)], samples[random(128)]}, random() * d)
        end
    }
}

Truernd={
    Sphere = {
        UnitVec = function()
            return VecNormalize({fast_std_norm_distr(), fast_std_norm_distr(), fast_std_norm_distr()})
        end,
        RangedVec = function(r)
            return VecScale(VecNormalize({fast_std_norm_distr(), fast_std_norm_distr(), fast_std_norm_distr()}), r)
        end
    },
    Ball = {
        UnitVec = function()
            return VecScale(VecNormalize({fast_std_norm_distr(), fast_std_norm_distr(), fast_std_norm_distr()}), random() ^ (1 / 3))
        end,
        RangedVec = function(r)
            return VecScale(VecNormalize({fast_std_norm_distr(), fast_std_norm_distr(), fast_std_norm_distr()}), random() ^ (1 / 3) * r)
        end
    },
    ConcBall = {
        UnitVec = function()
            return VecScale(VecNormalize({fast_std_norm_distr(), fast_std_norm_distr(), fast_std_norm_distr()}), random())
        end,
        RangedVec = function(r)
            return VecScale(VecNormalize({fast_std_norm_distr(), fast_std_norm_distr(), fast_std_norm_distr()}), random() * r)
        end
    },
    Quat={
        Raw = function()
            return Quat(fast_std_norm_distr(), fast_std_norm_distr(), fast_std_norm_distr(), fast_std_norm_distr()) -- the game will normalize it automatically so no worries!
        end,
        AxisAngle = function(d)
            return QuatAxisAngle({fast_std_norm_distr(), fast_std_norm_distr(), fast_std_norm_distr()}, d)
        end,
        RangedAxisAngle = function(d)
            return QuatAxisAngle({fast_std_norm_distr(), fast_std_norm_distr(), fast_std_norm_distr()}, random() * d)
        end
    }
}
