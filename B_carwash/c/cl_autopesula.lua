CreateThread(function()
	for i = 1, #pesuloita do
		pesulansijainti = pesuloita[i]
		if pesulansijainti.blip then
			local coords = pesulansijainti.coords
			stationBlip = AddBlipForCoord(coords.x, coords.y, coords.z)
	
			SetBlipSprite(stationBlip, 100)  -- Blipin merkki / Blip Make
			SetBlipScale(stationBlip, 0.7)   -- Blipin koko   / Blip Size
			SetBlipColour(stationBlip, 42)   -- Blipin väri   / Blip Color
			SetBlipAsShortRange(stationBlip, true)
			
			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString('Autopesula') -- Blippi kartalla ja nimi / Blip map and name
			EndTextCommandSetBlipName(stationBlip)
		end
	end
end)

