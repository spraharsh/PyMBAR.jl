module PyMBAR

using PyCall

const pymbar = PyNULL()


function __init__()
    copy!(pymbar, pyimport_conda("pymbar", "pymbar", "conda-forge"))
end



end
