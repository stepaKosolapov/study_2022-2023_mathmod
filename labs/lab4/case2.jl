using DifferentialEquations
using Plots

const x = 1.5
const y = 1.1

function res(du,u,p,t)
    du[1] = u[2]
    du[2] = -3u[1]-3u[1]
end

condition(u,t,integrator) = 50
cb = ContinuousCallback(condition,terminate!)
u0 = [x, y]
tspan = (0.0, 44.0)

prob = ODEProblem(res,u0,tspan,callback=cb)
sol = solve(prob)
plt = plot(sol)

savefig(plt, 'julia2.png')
