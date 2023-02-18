using Plots

r1(theta) = 95/43*exp(theta/sqrt(9.89))

ts1 = range(0, 2pi, length=100)
rs1 = r.(ts1)

r2(theta) = 95/23*exp(theta/sqrt(9.89))

ts2 = range(-pi, 2pi, length=100)
rs2 = r.(ts2)

bx(r) = 2pi/3

plt1 = plot(
    ts1,
    rs1,
    xlabel='θ',
    ylabel="r(t)",
    proj = :polar,
    aspect_ratio=:equal,
    dpi=300,
    legend=true,
    label="Траектория катера",
    color=:green,
)

plot!(
    plt1,
    bx.(rs1),
    rs1,
    label="Траектория браконъеров",
    color=:red,
)

plt2 = plot(
    ts2,
    rs2,
    xlabel='θ',
    ylabel="r(t)",
    proj = :polar,
    aspect_ratio=:equal,
    dpi=300,
    legend=true,
    label="Траектория катера",
    color=:green,
)

plot!(
    plt2,
    bx.(rs2),
    rs2,
    label="Траектория браконъеров",
    color=:red,
)

savefig(plt1, "lab2.png")
savefig(plt2, "lab2.2png")
