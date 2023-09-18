# PyMBAR.jl

[![Build Status](https://github.com/spraharsh/PyMBAR.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/spraharsh/PyMBAR.jl/actions/workflows/CI.yml?query=branch%3Amain)

This package serves as a thin wrapper around the python pymbar package used to calculate free energy differences. It is intended to be used as a drop-in replacement for the python package. The documentation for the python package can be found [here](https://pymbar.readthedocs.io/en/master/). This uses [PyCall.jl](https://github.com/JuliaPy/PyCall.jl) to call the python package.