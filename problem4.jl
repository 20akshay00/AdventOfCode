### A Pluto.jl notebook ###
# v0.19.13

using Markdown
using InteractiveUtils

# ╔═╡ cc0a1852-89cc-4c60-8a9f-32e2dafe05b4
# xi, xf, yi, yf = parse.(Int, vcat(split.(split(line, ","), "-")...))
# ((xi in yi:yf) && (xf in yi:yf)) || ((yi in xi:xf) && (yf in xi:xf)) 
# (xi in yi:yf) || (xf in yi:yf) || (yi in xi:xf) || (yf in xi:xf)

# ╔═╡ 0fc34020-739c-11ed-00a7-ad6614f0229c
function problem4_1(path)
	sum(eachline(path)) do line
		xi, xf, yi, yf = parse.(Int, split(line, r"[,-]"))
		xi:xf ⊆ yi:yf || yi:yf ⊆ xi:xf
	end
end

# ╔═╡ 42aca98b-9f2b-4048-893d-f29cffa928c0
problem4_1("./problem4.txt")

# ╔═╡ 19e51954-bfa2-41c2-9c72-7ca2f74c96fc
function problem4_2(path)
	sum(eachline(path)) do line
		xi, xf, yi, yf = parse.(Int, split(line, r"[,-]"))
		!isempty((xi:xf) ∩ (yi:yf))
	end
end

# ╔═╡ d21d104c-6020-4e65-afbd-5acb0033d1c2
problem4_2("./problem4.txt")

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
# ╠═cc0a1852-89cc-4c60-8a9f-32e2dafe05b4
# ╠═0fc34020-739c-11ed-00a7-ad6614f0229c
# ╠═42aca98b-9f2b-4048-893d-f29cffa928c0
# ╠═19e51954-bfa2-41c2-9c72-7ca2f74c96fc
# ╠═d21d104c-6020-4e65-afbd-5acb0033d1c2
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
