### A Pluto.jl notebook ###
# v0.19.13

using Markdown
using InteractiveUtils

# ╔═╡ 45ca1970-7192-11ed-31ba-77da51560529
function problem1_1(path)
	data = split.(split(read("./problem1.txt", String), "\r\n\r\n"), "\r\n")
	calories = sum.(x -> parse(Int, x), data)	
	return maximum(calories)
end

# ╔═╡ 76387684-6d0e-42f1-aead-95d4db6b6fb5
problem1_1("./problem1.txt")

# ╔═╡ a68e8607-c9a5-47e2-863d-ffd70a5d563a
function problem1_2(path)
	data = split.(split(read("./problem1.txt", String), "\r\n\r\n"), "\r\n")
	calories = sum.(x -> parse(Int, x), data)	
	
	# return sum(calories[sortperm(calories, rev = true)[1:3]])
	return sum(calories[partialsortperm(calories, 1:3, rev = true)])
end

# ╔═╡ f60bb451-055a-4c14-970a-e7a5a6447605
problem1_2("./problem1.txt")

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
# ╠═45ca1970-7192-11ed-31ba-77da51560529
# ╠═76387684-6d0e-42f1-aead-95d4db6b6fb5
# ╠═a68e8607-c9a5-47e2-863d-ffd70a5d563a
# ╠═f60bb451-055a-4c14-970a-e7a5a6447605
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
