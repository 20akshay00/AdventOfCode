### A Pluto.jl notebook ###
# v0.19.13

using Markdown
using InteractiveUtils

# ╔═╡ 87df8238-9e71-48d0-8059-615292386ccc
using BenchmarkTools

# ╔═╡ 9c056550-746d-11ed-0109-43148a196bb5
function problem5_1(path; f = reverse)
	data = readlines(path)

	# indices needed for parsing
	breakidx = findfirst(isempty, data)
	stackidx = findall(isdigit, data[breakidx - 1])

	# parse initial stack
	stacks = map(stackidx) do idx
		filter(isletter, getindex.(data[1:(breakidx - 2)], idx))
	end

	# parse instructions
	instructions = map(data[(breakidx + 1):end]) do line
		parse.(Int, match(r"move (\d+) from (\d+) to (\d+)", line).captures)
	end

	# apply instructions
	apply!(stacks, (n, i, j)) = prepend!(stacks[j], f(splice!(stacks[i], 1:n)))
	apply!.([stacks], instructions)
	
	getindex.(stacks, 1) |> join
end

# ╔═╡ f682ebd4-379e-41d5-b630-f05a6cd4a750
problem5_1("./problem5.txt")

# ╔═╡ 7b68c322-5116-42b4-92b3-1b48e9ad2a87
function problem5_2(path; f = reverse)
	data = readlines(path)

	# indices needed for parsing
	breakidx = findfirst(isempty, data)

	stacks = map(data[1:(breakidx - 2)]) do line
		arr = getproperty.(eachmatch(r"\[([A-Z])\]|\ {4}", line), :captures)
		arr = (arr .|> (elt) -> isnothing(elt) ? elt : first(elt)) |> reverse
	end |> arr -> rot180(hcat(arr...))
end

# ╔═╡ 23bb036c-08e4-483e-ab9d-4d2fb4baf26c
problem5_2("./problem5.txt")

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
BenchmarkTools = "6e4b80f9-dd63-53aa-95a3-0cdb28fa8baf"

[compat]
BenchmarkTools = "~1.3.2"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.8.0"
manifest_format = "2.0"
project_hash = "8c72e043718b5b2b781afa164b5e4ec6fa6c9bde"

[[deps.Artifacts]]
uuid = "56f22d72-fd6d-98f1-02f0-08ddc0907c33"

[[deps.BenchmarkTools]]
deps = ["JSON", "Logging", "Printf", "Profile", "Statistics", "UUIDs"]
git-tree-sha1 = "d9a9701b899b30332bbcb3e1679c41cce81fb0e8"
uuid = "6e4b80f9-dd63-53aa-95a3-0cdb28fa8baf"
version = "1.3.2"

[[deps.CompilerSupportLibraries_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "e66e0078-7015-5450-92f7-15fbd957f2ae"
version = "0.5.2+0"

[[deps.Dates]]
deps = ["Printf"]
uuid = "ade2ca70-3891-5945-98fb-dc099432e06a"

[[deps.JSON]]
deps = ["Dates", "Mmap", "Parsers", "Unicode"]
git-tree-sha1 = "3c837543ddb02250ef42f4738347454f95079d4e"
uuid = "682c06a0-de6a-54ab-a142-c8b1cf79cde6"
version = "0.21.3"

[[deps.Libdl]]
uuid = "8f399da3-3557-5675-b5ff-fb832c97cbdb"

[[deps.LinearAlgebra]]
deps = ["Libdl", "libblastrampoline_jll"]
uuid = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"

[[deps.Logging]]
uuid = "56ddb016-857b-54e1-b83d-db4d58db5568"

[[deps.Mmap]]
uuid = "a63ad114-7e13-5084-954f-fe012c677804"

[[deps.OpenBLAS_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "Libdl"]
uuid = "4536629a-c528-5b80-bd46-f80d51c5b363"
version = "0.3.20+0"

[[deps.Parsers]]
deps = ["Dates", "SnoopPrecompile"]
git-tree-sha1 = "b64719e8b4504983c7fca6cc9db3ebc8acc2a4d6"
uuid = "69de0a69-1ddd-5017-9359-2bf0b02dc9f0"
version = "2.5.1"

[[deps.Printf]]
deps = ["Unicode"]
uuid = "de0858da-6303-5e67-8744-51eddeeeb8d7"

[[deps.Profile]]
deps = ["Printf"]
uuid = "9abbd945-dff8-562f-b5e8-e1ebf5ef1b79"

[[deps.Random]]
deps = ["SHA", "Serialization"]
uuid = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"

[[deps.SHA]]
uuid = "ea8e919c-243c-51af-8825-aaa63cd721ce"
version = "0.7.0"

[[deps.Serialization]]
uuid = "9e88b42a-f829-5b0c-bbe9-9e923198166b"

[[deps.SnoopPrecompile]]
git-tree-sha1 = "f604441450a3c0569830946e5b33b78c928e1a85"
uuid = "66db9d55-30c0-4569-8b51-7e840670fc0c"
version = "1.0.1"

[[deps.SparseArrays]]
deps = ["LinearAlgebra", "Random"]
uuid = "2f01184e-e22b-5df5-ae63-d93ebab69eaf"

[[deps.Statistics]]
deps = ["LinearAlgebra", "SparseArrays"]
uuid = "10745b16-79ce-11e8-11f9-7d13ad32a3b2"

[[deps.UUIDs]]
deps = ["Random", "SHA"]
uuid = "cf7118a7-6976-5b1a-9a39-7adc72f591a4"

[[deps.Unicode]]
uuid = "4ec0a83e-493e-50e2-b9ac-8f72acf5a8f5"

[[deps.libblastrampoline_jll]]
deps = ["Artifacts", "Libdl", "OpenBLAS_jll"]
uuid = "8e850b90-86db-534c-a0d3-1478176c7d93"
version = "5.1.1+0"
"""

# ╔═╡ Cell order:
# ╠═87df8238-9e71-48d0-8059-615292386ccc
# ╠═9c056550-746d-11ed-0109-43148a196bb5
# ╠═f682ebd4-379e-41d5-b630-f05a6cd4a750
# ╠═7b68c322-5116-42b4-92b3-1b48e9ad2a87
# ╠═23bb036c-08e4-483e-ab9d-4d2fb4baf26c
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
