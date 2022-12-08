### A Pluto.jl notebook ###
# v0.19.13

using Markdown
using InteractiveUtils

# ╔═╡ 1d87511e-75f8-11ed-3128-a716cfa573b5
begin
	abstract type Data end

	struct Directory <: Data
		name :: String
		contents :: Vector{Data}
		parent :: Union{Directory, Nothing}

		Directory(name, parent) = new(name, Vector{Data}[], parent)
	end

	struct File <: Data
		name :: String
		size :: Int64
		parent :: Directory
	end
	
	size(f::File) = f.size
	size(d::Directory) = sum(size(data) for data in d.contents)

	function getfile(d::Directory, filename)
		idx = findfirst(==(filename), getfield.(d.contents, :name))				
		d.contents[idx]
	end
	
	path(f::Data) = (f.name == "/") ? f.name : path(f.parent) * "/" * f.name
end

# ╔═╡ 20823c1c-09e5-4692-bf63-197d9b47a7b5
begin
	function parse_input(line)
		patterns = [r"\$ (cd) (.+)", r"\$ (ls)()", r"(dir) (.+)", r"(\d+) (.+)"]
		matches = match.(patterns, line)
		matches[findfirst(!isnothing, match.(patterns, [line]))].captures
	end
	
	function parse_tree(file)
		root = Directory("/", nothing)
		cdir = root # current directory
		
		for line in eachline(file)
			if line == "\$ cd /" continue end
			
			cmd, name = parse_input(line)

			if(cmd == "cd")
				cdir = (name == "..") ? cdir.parent : getfile(cdir, name)
				
			elseif(cmd != "ls")
				if cmd == "dir"
					push!(cdir.contents, Directory(name, cdir))
				else
					push!(cdir.contents, File(name, parse(Int, cmd), cdir))
				end				
			end
		end
		
		return root
	end
end

# ╔═╡ 80467f5c-2ebb-4ebb-b8e1-ec2249035b10
function get_sizes(dir::Directory)
	child_dirs = filter(elt -> isa(elt, Directory), dir.contents)

	isempty(child_dirs) && return size(dir)
	
	reduce(child_dirs, init = [size(dir)]) do res, data
		append!(res, get_sizes(data))
	end
end

# ╔═╡ aa26b8bd-481f-4da4-af79-b4ee36429917
root = parse_tree("./problem7.txt")

# ╔═╡ cf4d654a-b334-458c-817a-79580ae22c98
# part 1
filter(<=(100000), get_sizes(root)) |> sum

# ╔═╡ 0626ebae-aae5-4d94-880b-fc6f71fef2aa
# part 2
begin
	total = 70000000
	req_unused = 30000000
	
	to_be_freed = size(root) - (total - req_unused)
	
	filter(>=(to_be_freed), get_sizes(root)) |> minimum 
end

# ╔═╡ 57546947-592b-4b7c-8a73-aa1c96d3795d
# function tree(d::Directory, depth = 0)
# 	println("|    " ^ (depth) * "|--> ", d.name)
	
# 	for data in d.contents
# 		if isa(data, Directory)
# 			tree(data, depth + 1)
# 		else
# 			println("|    " ^ depth * "|--> ", data.name)
# 		end
# 	end
# end

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
# ╠═1d87511e-75f8-11ed-3128-a716cfa573b5
# ╠═20823c1c-09e5-4692-bf63-197d9b47a7b5
# ╠═80467f5c-2ebb-4ebb-b8e1-ec2249035b10
# ╠═aa26b8bd-481f-4da4-af79-b4ee36429917
# ╠═cf4d654a-b334-458c-817a-79580ae22c98
# ╠═0626ebae-aae5-4d94-880b-fc6f71fef2aa
# ╠═57546947-592b-4b7c-8a73-aa1c96d3795d
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
