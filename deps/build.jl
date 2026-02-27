using PyCall

if PyCall.conda
    using Conda
    Conda.add("pymbar", channel="conda-forge")
else
    run(`$(PyCall.pyprogramname) -m pip install pymbar`)
end
