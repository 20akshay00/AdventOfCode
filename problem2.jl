### A Pluto.jl notebook ###
# v0.19.13

using Markdown
using InteractiveUtils

# ╔═╡ efefd770-7226-11ed-2a0d-fbaf91ec029d
function problem2_1(path)
	data = split.(replace.(readlines(path), 
		"A" => 1, "B" => 2, "C" => 3, 
		"X" => 1, "Y" => 2, "Z" => 3)) .|> elt -> parse.(Int, elt)

	points = [3 6 0; 0 3 6; 6 0 3]
	
	reduce(data, init = 0) do score, (opp, player)
		score + points[opp, player] + player
	end
end

# ╔═╡ 2ff1b63c-70df-4799-b573-255225f55e43
problem2_1("./problem2.txt")

# ╔═╡ ffaa152b-d698-41db-b19e-2b47a8d094e1
function problem2_2(path)
	data = split.(replace.(readlines(path), 
		"A" => 1, "B" => 2, "C" => 3, 
		"X" => 0, "Y" => 3, "Z" => 6)) .|> elt -> parse.(Int, elt)

	points = [3 6 0; 0 3 6; 6 0 3]
	
	reduce(data, init = 0) do score, (opp, res_score)
		score + res_score + findfirst(==(res_score), points[opp, :])
	end
end

# ╔═╡ a1150e78-e80a-4626-8391-adb9fd6b78d9
problem2_2("./problem2.txt")

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.8.0"
manifest_format = "2.0"
project_hash = "da39a3ee5e6b4b0d3255bfef95601890afd80709"

[deps]
"""

# ╔═╡ Cell order:
# ╠═efefd770-7226-11ed-2a0d-fbaf91ec029d
# ╠═2ff1b63c-70df-4799-b573-255225f55e43
# ╠═ffaa152b-d698-41db-b19e-2b47a8d094e1
# ╠═a1150e78-e80a-4626-8391-adb9fd6b78d9
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
