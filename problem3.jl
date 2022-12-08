### A Pluto.jl notebook ###
# v0.19.13

using Markdown
using InteractiveUtils

# ╔═╡ 5b0d4000-72dc-11ed-1ea0-1fdf581385de
function problem3_1(path)
	data = readlines(path)
	reduce(data, init = 0) do priority, sack
		
		sack1, sack2 = sack[1:(length(sack) ÷ 2)], sack[(length(sack) ÷ 2 + 1):end]
		
		item = sack2[findfirst(in(sack1), sack2)]

		priority + (islowercase(item) ? Int(item) - 96 : Int(item) - 38)
	end
end

# ╔═╡ bb0678ea-3c13-432a-8085-e0844feaf642
problem3_1("./problem3.txt")

# ╔═╡ 377fe7bd-6a49-4995-bb60-991add3346f1
function problem3_2(path)
	data = readlines(path)
	
	reduce(1:3:length(data), init = 0) do priority, g_id
		
		sack1, sack2, sack3 = data[g_id:(g_id + 2)]
		
		# item = sack3[findfirst(in(sack2[findall(in(sack1), sack2)]), sack3)]
		item = first(intersect(sack1, sack2, sack3))
		
		priority + (islowercase(item) ? Int(item) - 96 : Int(item) - 38)
	end
end

# ╔═╡ e68ff35a-3466-4333-9fcf-400c598b9f51
problem3_2("./problem3.txt")

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
# ╠═5b0d4000-72dc-11ed-1ea0-1fdf581385de
# ╠═bb0678ea-3c13-432a-8085-e0844feaf642
# ╠═377fe7bd-6a49-4995-bb60-991add3346f1
# ╠═e68ff35a-3466-4333-9fcf-400c598b9f51
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
