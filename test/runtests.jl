#
# Correctness Tests
#

using Test, DelimitedFiles, .MathConstants
using GeoEfficiency
const G = GeoEfficiency


include("Helper.jl")

const SourceFiles = [
					"Helper",
					"Error",
					"Input_Console",
					"Physics_Model",
					"Input_Batch",
    				"Calculations",
					"Output_Interface"
					]

@testset "GeoEfficiency" begin
	@test G.srcType === G.srcUnknown  		# the initial program condition
	@test typeofSrc() === G.srcUnknown  	# the initial program condition
	@test setSrcToPoint() === false      	# not defined, set to not point
	println("\n")
	
	@testset "$SourceFile" for SourceFile = SourceFiles
		@debug("Begin test", SourceFile)   
		include("test_$SourceFile.jl")
		println("\n")
	end #testset_SourceFile

	@test about() == nothing

end #testset_GeoEfficiency
