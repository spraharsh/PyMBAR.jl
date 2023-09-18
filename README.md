# PyMBAR.jl

[![Build Status](https://github.com/spraharsh/PyMBAR.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/spraharsh/PyMBAR.jl/actions/workflows/CI.yml?query=branch%3Amain)


PyMBAR.jl is a Julia package that functions as a lightweight wrapper for the Python [pymbar package](https://pymbar.readthedocs.io/en/master/), facilitating the calculation of free energy differences. Leveraging [PyCall.jl](https://github.com/JuliaPy/PyCall.jl) to call Python packages, it aims to be a drop-in replacement, making it simpler to add pymbar as a dependency in your Julia projects.

## Installation

To install PyMBAR.jl, use the following command in the Julia REPL:

```julia
using Pkg
Pkg.add("PyMBAR")
```



## Usage 


Below, find a practical example illustrating how to utilize PyMBAR.jl. Note that all functionalities available in [pymbar](https://pymbar.readthedocs.io/en/master/) are accessible in a similar manner when using this Julia wrapper.


### Example

In this example, we generate dummy data and compute the statistical inefficiency.


```
using PyMBAR, Random, Distributions

timeseries = PyMBAR.pymbar.timeseries

function dummy_data()
    N = 10000
    K = 1
    var = ones(N)

    for replica = 2:K
        var = vcat(var, ones(N))
    end

    X = reshape(rand(Normal(0.0, 1.0), K * N) .* var / 10.0, (K, N))
    Y = reshape(rand(Normal(0.0, 1.0), K * N) .* var, (K, N))

    energy = 10 * (X .^ 2) / 2.0 .+ (Y .^ 2) / 2.0

    return X, Y, energy
end

X, Y, energy = dummy_data()
g0 = timeseries.statistical_inefficiency_fft(X[1, :])
```



