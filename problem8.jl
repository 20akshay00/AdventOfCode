### A Pluto.jl notebook ###
# v0.19.13

using Markdown
using InteractiveUtils

# ╔═╡ cfe2e480-76cd-11ed-3aaa-1fc29ca4df2e
function problem8_1(path)
	heights = parse.(Int, hcat(split.(readlines(path), "")...))
end

# ╔═╡ b8e26925-a98e-46f1-a9dc-d5e9f74376ad
function isVisible(trees, idx)
	r, c = idx

	x1 = any(trees[(r + 1):end, c] .< trees[r, c])
	x2 = any(trees[1:(r - 1), c] .< trees[r, c])
	x3 = any(trees[r, 1:(c - 1)] .< trees[r, c])
	x4 = any(trees[r, (c + 1):end] .< trees[r, c])

	(r == 1 || r == first(size(trees)) || c == 1 || c == last(size(trees))) || (x1 || x2 || x3 || x4)
end

# ╔═╡ f1c8febb-29b3-480c-acfa-e5104b288283
trees = problem8_1("./problem8.txt")

# ╔═╡ 6ac5685a-1c58-47fd-aee7-e98f864a63a8
sum(trees .< 11)

# ╔═╡ eab2f96b-8a4e-4033-a110-7fb6c57ff6e1


# ╔═╡ 076f98a2-ec36-4680-be96-83327dedff76
9801 - 9238

# ╔═╡ 8f134aae-ae4a-435d-afd7-d7001e337383
isVisible.([trees], [[x, y] for x in 1:first(size(trees)) for y in 1:last(size(trees))]) |> sum

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
# ╠═cfe2e480-76cd-11ed-3aaa-1fc29ca4df2e
# ╠═b8e26925-a98e-46f1-a9dc-d5e9f74376ad
# ╠═f1c8febb-29b3-480c-acfa-e5104b288283
# ╠═6ac5685a-1c58-47fd-aee7-e98f864a63a8
# ╠═eab2f96b-8a4e-4033-a110-7fb6c57ff6e1
# ╠═076f98a2-ec36-4680-be96-83327dedff76
# ╠═8f134aae-ae4a-435d-afd7-d7001e337383
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
