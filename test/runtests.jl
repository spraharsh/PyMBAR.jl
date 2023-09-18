using PyMBAR
using Test
using Random, Distributions

timeseries = PyMBAR.pymbar.timeseries
testsystems = PyMBAR.pymbar.testsystems

@testset "initialize PyMBAR.jl" begin
    # Write your tests here.
    pymbar = PyMBAR.pymbar
    @test true
end


function data()
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


# time series tests, this is a copy of the 
# same test in pymbar/pymbar/tests/test_timeseries.py
@testset "test statistical inefficiency" begin
    X, Y, energy = data()
    timeseries.statistical_inefficiency_fft(X[1, :])
    timeseries.statistical_inefficiency_fft(X[1, :] .^ 2)
    timeseries.statistical_inefficiency_fft(energy[1, :])

    g0 = timeseries.statistical_inefficiency_fft(X[1, :])
    g1 = timeseries.statistical_inefficiency(X[1, :])
    g2 = timeseries.statistical_inefficiency(X[1, :], X[1, :])
    g3 = timeseries.statistical_inefficiency(X[1, :], fft = true)

    # test equal to 6 decimal places
    @test abs(g0 .- g1) .< 1e-6
    @test abs(g0 .- g2) .< 1e-6
    @test abs(g0 .- g3) .< 1e-6
end
